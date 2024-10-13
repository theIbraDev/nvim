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

				palette = {
					-- Override the builtin palette per variant
					moon = {
						base = "#191724", -- Base of main
						surface = "#1f1d2e", -- Surface of main
						overlay = "#26233a", -- Overlay of main
						gold = "#ea9d34", -- Gold of dawn
						rose = "#d7827e", -- Rose of dawn
						muted = "#6e6a86",
						sublte = "#9e9aba",
						iris = "#c4a7e7",
					},
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
