return {
    "tpope/vim-fugitive",

    config = function()
        local keymap = vim.keymap.set

        keymap("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
        keymap("n", "<leader>gb", ":Git blame<cr>", { desc = "Git blame" })
        keymap("n", "<leader>gd", ":Gvdiffsplit!<cr>", { desc = "Git diff (3-way)" })
        keymap("n", "<leader>gh", ":diffget //2<CR>", { desc = "Get LEFT change" })
        keymap("n", "<leader>gl", ":diffget //3<CR>", { desc = "Get RIGHT change" })
    end,
}
