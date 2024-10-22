return
{
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "onsails/lspkind.nvim",
        {
            "folke/lazydev.nvim",
            config = true,
        },
        {
            "kosayoda/nvim-lightbulb",
            opts = {
                sign = { enabled = false },
                virtual_text = {
                    enabled = true,
                    text = "󰌵",
                },
                autocmd = { enabled = true },
            },
        },
        {
            "j-hui/fidget.nvim",
            tag = "legacy",
            opts = {
                text = {
                    spinner = "dots",
                    done = "",
                },
            },
        },
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("plugins.lsp_helpers.ui").setup()

        vim.diagnostic.config({ severity_sort = true })

        local function on_attach(client, bufnr)
            -- require("custom.plugins.lsp.keymaps").on_attach(bufnr)
            require("plugins.lsp_helpers.ui").on_attach(client, bufnr)
        end

        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                },
            },
            clangd = {
                capabilities = {
                    textDocument = { completion = { completionItem = { snippetSupport = false } } },
                },
            },
            pyright = {},
            texlab = {},
            nil_ls = {},
            rust_analyzer = {},
        }

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local lspconfig = require("lspconfig")
        for server, config in pairs(servers) do
            lspconfig[server].setup(vim.tbl_deep_extend("force", {
                on_attach = on_attach,
                capabilities = vim.deepcopy(capabilities),
            }, config))
        end
    end,
}
