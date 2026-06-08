return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer", 
        "hrsh7th/cmp-path", 
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
        "rafamadriz/friendly-snippets",
        "onsails/lspkind.nvim", 
    },
    config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")

        local function feedkeys(keys)
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, true, true), "", true)
        end

        local function expand_or_jump()
            if vim.fn["vsnip#available"](1) == 1 then
                feedkeys("<Plug>(vsnip-expand-or-jump)")
                return true
            end

            if vim.fn["vsnip#jumpable"](1) == 1 then
                feedkeys("<Plug>(vsnip-jump-next)")
                return true
            end

            return false
        end

        local function confirm_or_expand_or_complete(fallback)
            if cmp.visible() then
                cmp.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                })
            elseif expand_or_jump() then
                return
            else
                cmp.complete()
            end
        end

        cmp.setup({
            completion = {
                autocomplete = false,
            },
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-d>"] = cmp.mapping.scroll_docs(4),
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-space>"] = cmp.mapping(confirm_or_expand_or_complete, { "i", "s" }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "vsnip" },
                { name = "buffer" },
                { name = "path" },
            }),
        })

        vim.cmd([[
      set completeopt=menuone,noinsert,noselect
      highlight! default link CmpItemKind CmpItemMenuDefault
    ]])
    end,
}
