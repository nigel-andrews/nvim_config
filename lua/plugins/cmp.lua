vim.o.completeopt = "menuone,noselect,preview"
return {
    "hrsh7th/nvim-cmp",
    version = false,
    event = { "InsertEnter", "CmdLineEnter" },
    dependencies = {
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        local cmp = require("cmp")

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },

            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = 'nvim_lsp' },
                { name = "nvim_lsp_signature_help" },
                { name = "path" },
                { name = "buffer" },
            }),

            preselect = cmp.PreselectMode.None,

            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),

            formatting = {
                format =
                function(entry, item)
                    local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
                    item = require("lspkind").cmp_format({
                        with_text = true,
                        menu = {
                            nvim_lsp = "[LSP]",
                            path = "[path]",
                            luasnip = "[snip]",
                            calc = "[calc]",
                            nvim_lsp_signature_help = "[sign]",
                            buffer = "[buf]",
                        },
                    })(entry, item)
                    if color_item.abbr_hl_group then
                        item.kind_hl_group = color_item.abbr_hl_group
                        item.kind = color_item.abbr
                    end
                    return item
                end,
            },
        })
    end,
}
