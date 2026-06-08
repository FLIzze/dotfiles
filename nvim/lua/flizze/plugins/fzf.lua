return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "nvim-mini/mini.icons" },
    ---@module "fzf-lua"
    ---@type fzf-lua.Config|{}
    ---@diagnostic disable: missing-fields
    opts = {},
    ---@diagnostic enable: missing-fields

    -----------
    -- FILES --
    -----------
    vim.keymap.set({ "n" }, "<leader>fw", function()
        FzfLua.files()
    end, { silent = true, desc = "Fuzzy files workspace" }),

    vim.keymap.set({ "n" }, "<leader>fa", function()
        FzfLua.files({ cwd = "~/Documents" })
    end, { silent = true, desc = "Fuzzy files from ~/Documents/" }),

    vim.keymap.set({ "n" }, "<leader>fg", function()
        FzfLua.git_files()
    end, { silent = true, desc = "Fuzzy git files" }),

    ----------
    -- GREP --
    ----------
    vim.keymap.set({ "n" }, "<leader>gw", function()
        FzfLua.live_grep()
    end, { silent = true, desc = "Grep workspace" }),

    vim.keymap.set({ "n" }, "<leader>ga", function()
        FzfLua.live_grep({ cwd = "~/Documents" })
    end, { silent = true, desc = "Grep from ~/Documents/" }),

    vim.keymap.set({ "n" }, "<leader>fb", function()
        FzfLua.buffers()
    end, { silent = true, desc = "Fuzzy buffers" }),

    -----------
    -- MISCS --
    -----------
    vim.keymap.set({ "n" }, "<leader>fr", function()
        FzfLua.registers()
    end, { silent = true, desc = "Fuzzy registers" }),

    vim.keymap.set({ "n" }, "<leader>fm", function()
        FzfLua.manpages()
    end, { silent = true, desc = "Fuzzy mans" }),

    vim.keymap.set({ "n" }, "<leader>fb", function()
        FzfLua.buffers()
    end, { silent = true, desc = "Fuzzy buffers" }),


    ---------
    -- LSP --
    ---------
    vim.keymap.set({ "n" }, "<leader>lr", function()
        FzfLua.lsp_references()
    end, { silent = true, desc = "Fuzzy lsp references" }),

    vim.keymap.set({ "n" }, "<leader>ld", function()
        FzfLua.lsp_definitions()
    end, { silent = true, desc = "Fuzzy lsp definitions" }),

    vim.keymap.set({ "n" }, "<leader>dw", function()
        FzfLua.diagnostics_workspace()
    end, { silent = true, desc = "Fuzzy lsp workspace diagnostics" }),

    vim.keymap.set({ "n" }, "<leader>df", function()
        FzfLua.diagnostics_document()
    end, { silent = true, desc = "Fuzzy lsp file diagnostics" }),
}
