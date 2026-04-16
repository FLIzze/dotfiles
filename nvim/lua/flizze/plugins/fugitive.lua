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
    keymap("n", "<leader>gd", ":Gvdiffsplit<cr>", { desc = "Git diff split" })
  end,
}
