local set = vim.opt_local

-- Set local settings for terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", {}),
	callback = function()
		set.number = false
		set.relativenumber = false
		set.scrolloff = 0
	end,
})

-- Easily hit escape in terminal mode.
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

-- Open terminal in new tab
vim.keymap.set("n", "<Leader>,t", function()
	vim.cmd.tabnew()
	vim.cmd.term()
	-- name the buffer "terminal"
	vim.api.nvim_buf_set_name(0, "terminal")
end)
