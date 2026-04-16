return {
    "tpope/vim-fugitive",

    config = function()
        local keymap = vim.keymap.set

        keymap("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
        keymap("n", "<leader>gc", ":Git commit<cr>", { desc = "Git commit" })
        keymap("n", "<leader>ga", ":Git add %<cr>", { desc = "Git add file" })
        keymap("n", "<leader>gp", ":Git push<cr>", { desc = "Git push" })
        keymap("n", "<leader>gP", ":Git pull<cr>", { desc = "Git pull" })
        keymap("n", "<leader>gb", ":Git blame<cr>", { desc = "Git blame" })

        keymap("n", "<leader>gd", ":Gvdiffsplit<cr>", { desc = "Git diff (3-way)" })
        keymap("n", "]c", "]c", vim.tbl_extend("force", opts, { desc = "Next diff hunk" }))
        keymap("n", "[c", "[c", vim.tbl_extend("force", opts, { desc = "Prev diff hunk" }))

        keymap("n", "<leader>gh", ":diffget //2<CR>", { desc = "Get LEFT change" })
        keymap("n", "<leader>gl", ":diffget //3<CR>", { desc = "Get RIGHT change" })
    end,
}
