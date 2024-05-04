return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
        "nvim-treesitter/nvim-treesitter-textobjects",
    },

    config = function()
        local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "gopls",
                "svelte",
                "tsserver",
            },
            handlers = {
                function(server_name) -- default handler (optional)

                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                    { name = 'buffer' },
                })
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })

        local autocmd = vim.api.nvim_create_autocmd

        local ibraGroup = vim.api.nvim_create_augroup("theIbraDev_worktree", {})

        autocmd('LspAttach', {
            group = ibraGroup,
            callback = function(e)
                local opts = { buffer = e.buf }
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "<leader>lc", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<leader>lR", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_next) -- moves regardless of the last direction
                vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_previous)
                local next_diagnostic_repeat, prev_diagnostic_repeat = ts_repeat_move.make_repeatable_move_pair(vim.diagnostic.goto_next , vim.diagnostic.goto_prev)
                vim.keymap.set({ "n", "x", "o" }, "md", next_diagnostic_repeat) -- Has to be below repeatable pair
                vim.keymap.set({ "n", "x", "o" }, "Md", prev_diagnostic_repeat)
            end
        })

    end
}
