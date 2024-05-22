-- Lsp
require("neodev").setup({
	-- library = {
	--   plugins = { "nvim-dap-ui" },
	--   types = true,
	-- },
})

local capabilities = nil
if pcall(require, "cmp_nvim_lsp") then
	capabilities = require("cmp_nvim_lsp").default_capabilities()
end

local lspconfig = require("lspconfig")

local servers = {
	bashls = true,
	gopls = true,
	lua_ls = true,
	rust_analyzer = true,
	svelte = true,
	templ = true,
	cssls = true,

	-- Probably want to disable formatting for this lang server
	tsserver = true,

	jsonls = {
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
				validate = { enable = true },
			},
		},
	},

	yamlls = {
		settings = {
			yaml = {
				schemaStore = {
					enable = false,
					url = "",
				},
				schemas = require("schemastore").yaml.schemas(),
			},
		},
	},

	ocamllsp = {
		manual_install = true,
		settings = {
			codelens = { enable = true },
		},

		filetypes = {
			"ocaml",
			"ocaml.interface",
			"ocaml.menhir",
			"ocaml.cram",
		},
	},

	lexical = {
		cmd = { "/home/tjdevries/.local/share/nvim/mason/bin/lexical", "server" },
		root_dir = require("lspconfig.util").root_pattern({ "mix.exs" }),
	},

	clangd = {
		-- TODO: Could include cmd, but not sure those were all relevant flags.
		--    looks like something i would have added while i was floundering
		init_options = { clangdFileStatus = true },
		filetypes = { "c" },
	},
}

local servers_to_install = vim.tbl_filter(function(key)
	local t = servers[key]
	if type(t) == "table" then
		return not t.manual_install
	else
		return t
	end
end, vim.tbl_keys(servers))

require("mason").setup()
local ensure_installed = {
	"stylua",
	"lua_ls",
	"delve",
	--"tailwind-language-server",
}

vim.list_extend(ensure_installed, servers_to_install)
require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

for name, config in pairs(servers) do
	if config == true then
		config = {}
	end
	config = vim.tbl_deep_extend("force", {}, {
		capabilities = capabilities,
	}, config)

	lspconfig[name].setup(config)
end

local disable_semantic_tokens = {
	lua = true,
}

local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")
		local next_diagnostic_repeat, prev_diagnostic_repeat =
			ts_repeat_move.make_repeatable_move_pair(vim.diagnostic.goto_next, vim.diagnostic.goto_prev) -- Makes moves repeatable

		--old
		vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
		vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { buffer = 0 })
		vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_next) -- moves regardless of the last direction
		vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_previous)
		vim.keymap.set({ "n", "x", "o" }, "md", next_diagnostic_repeat) -- Has to be below repeatable pair
		vim.keymap.set({ "n", "x", "o" }, "Md", prev_diagnostic_repeat)
		--new
		vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = 0 })
		vim.keymap.set("n", "gR", vim.lsp.buf.rename, { buffer = 0 })
		vim.keymap.set("n", "gq", vim.lsp.buf.workspace_symbol)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
		vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
		vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { buffer = 0 })

		local filetype = vim.bo[bufnr].filetype
		if disable_semantic_tokens[filetype] then
			client.server_capabilities.semanticTokensProvider = nil
		end
	end,
})

-- Autoformatting Setup
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(args)
		require("conform").format({
			bufnr = args.buf,
			lsp_fallback = true,
			quiet = true,
		})
	end,
})
