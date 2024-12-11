require("theIbraDev.settings.set")
require("theIbraDev.settings.remap")
require("theIbraDev.lazy_init") -- Set & remap has to always be in front of lazy_init
require("theIbraDev.sveltekit.movements")
require("theIbraDev.terminal.terminal")
require("theIbraDev.theme")
require("theIbraDev.theme")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local ibraGroup = augroup("ibraGroup", {})
local yank_group = augroup("HighlightYank", {})

function R(name)
	require("plenary.reload").reload_module(name)
end

vim.filetype.add({
	extension = {
		templ = "templ",
	},
})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

autocmd({ "BufWritePre" }, {
	group = ibraGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
