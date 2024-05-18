return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-treesitter/nvim-treesitter-textobjects",
	},

	config = function()
		require("theIbraDev.configs.telescope")
	end,
}
