return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", opts = {} }, -- Shows LSP activity on the bottom right
		"nvim-treesitter/nvim-treesitter-textobjects", -- Extends tresitter selection
		"folke/neodev.nvim",
		-- Autoformatting
		"stevearc/conform.nvim",
		-- Schema information
		"b0o/SchemaStore.nvim",
	},

	config = function()
		require("theIbraDev.configs.lsp")
	end,
}
