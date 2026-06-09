return {
    "neovim/nvim-lspconfig",

    config = function()
        local on_attach = function(client, bufnr)
<<<<<<< HEAD
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "LSP Rename" })
=======
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
>>>>>>> 4e1485e (vimrc, gitconfig)
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, desc = "Next Diagnostic" })
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Previous Diagnostic" })
        end
    end,
}
