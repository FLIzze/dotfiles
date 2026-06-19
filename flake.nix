{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, nur, ... } @ inputs:
  let
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;

    mkHost = { hostname, system ? "x86_64-linux", users ? [ "flizze" ] }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/${hostname}/default.nix
          { networking.hostName = hostname; }
        ]
        ++ map (u: ./users/${u}.nix) users;
      };

    mkHome = { username, hostname, system ? "x86_64-linux" }:
      home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ nur.overlays.default ];
        };
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home-manager/home.nix ];
      };
  in
  {
    packages  = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    overlays = import ./overlays { inherit inputs; };

    nixosConfigurations = {
      desktop = mkHost { hostname = "desktop"; };
      laptop   = mkHost { hostname = "laptop"; };
    };

    homeConfigurations = {
      "flizze@desktop" = mkHome { username = "flizze"; hostname = "dekstop"; };
      "flizze@laptop"  = mkHome { username = "flizze"; hostname = "laptop"; };
    };
  };
}
