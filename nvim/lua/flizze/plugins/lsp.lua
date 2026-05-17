return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        { "folke/neodev.nvim", opts = {} },
    },
    config = function()
        vim.diagnostic.config({
            virtual_text = false,
            signs = true,
            underline = true,
            severity_sort = true,
        })

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "LSP Rename" })
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, desc = "Next Diagnostic" })
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Previous Diagnostic" })
            vim.keymap.set(
                { "n", "v" },
                "<leader>ca",
                vim.lsp.buf.code_action,
                { buffer = bufnr, desc = "Code Action" }
            )
        end

        local servers = {
            "cssls",
            "eslint",
            "html",
            "hyprls",
            "jsonls",
            "pyright",
            "tailwindcss",
            "ts_ls",
        }
        for _, server in ipairs(servers) do
            vim.lsp.config(server, {
                capabilities = capabilities,
                on_attach = on_attach,
            })
        end
    end,
}
