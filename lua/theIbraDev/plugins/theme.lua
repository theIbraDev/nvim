return {
	{ "EdenEast/nightfox.nvim" },
	{
		"rose-pine/nvim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "moon", -- auto, main, moon, or dawn
				dark_variant = "moon", -- main, moon, or dawn
				styles = {
					bold = true,
					italic = false,
					transparency = true,
				},
			})
			vim.cmd("colorscheme rose-pine-moon")
		end,
	},
	{ "luisiacc/gruvbox-baby" },
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				style = "night",
				on_colors = function(colors)
					colors.border = "#ffffff"
				end,
			})
		end,
	},
	{ "loctvl842/monokai-pro.nvim" },
	{ "catppuccin/nvim", name = "catppuccin" },
}
