return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                lua = { "stylua" },
                python = { "isort", "black" },
            },

            formatters = {
                prettier = {
                    args = {
                        "--stdin-filepath",
                        "$FILENAME",
                        "--tab-width",
                        "4",
                        "--use-tabs",
                        "false",
                    },
                },

                stylua = {
                    args = {
                        "--indent-type",
                        "Spaces",
                        "--indent-width",
                        "4",
                        "-",
                    },
                },
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>c", function()
            conform.format({
                lsp_fallback = false,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "Format (Conform)" })
    end,
}
