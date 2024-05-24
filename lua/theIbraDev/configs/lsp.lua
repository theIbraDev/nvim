local cmp_lsp = require("cmp_nvim_lsp")
local util = require("lspconfig/util")
local capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())
local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"gopls",
		"svelte",
		"tsserver",
		"eslint",
	},
	handlers = {
		function(server_name) -- default handler (optional)
			require("lspconfig")[server_name].setup({
				capabilities = capabilities,
			})
		end,

		["lua_ls"] = function()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = { version = "Lua 5.1" },
						diagnostics = {
							globals = { "vim", "it", "describe", "before_each", "after_each" },
						},
					},
				},
			})

			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
                on_attach = function(client, bufnr)
                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                end,
                filetypes = {"rust"},
                root_dir = util.root_pattern("Cargo.toml"),
			})

		end,
	},
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

autocmd("LspAttach", {
	group = ibraGroup,
	callback = function(e)
		local opts = { buffer = e.buf } vim.keymap.set("n", "gd", function() vim.lsp.buf.definition()
		end, opts) vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
		vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
		vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
		vim.keymap.set("n", "gR", function() vim.lsp.buf.rename() end, opts)
		vim.keymap.set("n", "gq", function() vim.lsp.buf.workspace_symbol() end, opts)
		vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
		vim.keymap.set("n", "gT", function() vim.lsp.buf.type_definition() end, opts)
		vim.keymap.set("n", "ga", function() vim.lsp.buf.code_action() end, opts)

		local next_diagnostic_repeat, prev_diagnostic_repeat =
			ts_repeat_move.make_repeatable_move_pair(vim.diagnostic.goto_next, vim.diagnostic.goto_prev) -- Makes moves repeatable
		vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_next) -- moves regardless of the last direction
		vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_previous)
		vim.keymap.set({ "n", "x", "o" }, "md", next_diagnostic_repeat) -- Has to be below repeatable pair
		vim.keymap.set({ "n", "x", "o" }, "Md", prev_diagnostic_repeat)
	end,
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- Use a sub-list to run only the first available formatter
		javascript = { { "prettierd", "prettier" } },
	},
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = "*",
-- 	callback = function(args)
-- 		require("conform").format({ bufnr = args.buf })
-- 	end,
-- })
