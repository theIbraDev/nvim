require("rose-pine").setup({
	disable_background = false,

	variant = "moon", -- auto, main, moon, or dawn
	dark_variant = "moon", -- main, moon, or dawn

	styles = {
		bold = true,
		italic = false,
		transparency = true,
	},

	groups = {
		border = "muted",
		link = "iris",
		panel = "surface",

		error = "love",
		hint = "iris",
		info = "foam",
		warn = "gold",

		git_add = "foam",
		git_change = "rose",
		git_delete = "love",
		git_dirty = "rose",
		git_ignore = "muted",
		git_merge = "iris",
		git_rename = "pine",
		git_stage = "iris",
		git_text = "rose",
		git_untracked = "subtle",

		headings = {
			h1 = "iris",
			h2 = "foam",
			h3 = "rose",
			h4 = "gold",
			h5 = "pine",
			h6 = "foam",
		},
		-- Alternatively, set all headings at once.
		-- headings = "subtle",
	},

	highlight_groups = {
		-- Comment = { fg = "foam" },
		-- VertSplit = { fg = "muted", bg = "muted" },
	},

	before_highlight = function(group, highlight, palette)
		-- Disable all undercurls
		-- if highlight.undercurl then
		--     highlight.undercurl = false
		-- end
		--
		-- Change palette colour
		-- if highlight.fg == palette.pine then
		--     highlight.fg = palette.foam
		-- end
	end,
})
vim.cmd("colorscheme rose-pine")
