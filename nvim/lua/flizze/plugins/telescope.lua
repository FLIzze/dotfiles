return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-k>"] = "move_selection_previous",
                        ["<C-j>"] = "move_selection_next",
                    },
                },
            },
        })

        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
        vim.keymap.set("n", "<leader>fl", builtin.git_files, { desc = "Find git files" })
        vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find diagnostics" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })

        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
        vim.keymap.set("n", "<leader>fm", builtin.man_pages, { desc = "Find mans" })

    end,
}
