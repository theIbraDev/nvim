return {
	"lewis6991/gitsigns.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		require("theIbraDev.configs.gitsigns")
	end,
}
