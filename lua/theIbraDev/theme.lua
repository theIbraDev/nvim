-- Change font when entering a buffer
vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("theme_swithcer", {}),
	callback = function()
		if vim.bo.filetype == "netrw" then
			vim.cmd.colorscheme('carbonfox')
		elseif vim.bo.filetype == "lua" then
			vim.cmd.colorscheme('tokyonight')
		elseif vim.bo.filetype == "svelte" then
			vim.cmd.colorscheme('monokai-pro')
		elseif vim.bo.filetype == "rust" then
			vim.cmd.colorscheme('gruvbox-baby')
		elseif vim.bo.filetype == "typescript" then
			vim.cmd.colorscheme('rose-pine-main')
		elseif vim.bo.filetype ~= "telescope" then
			-- Do nothing
		else
			vim.cmd.colorscheme('carbonfox')
		end
	end,
})
-- Change font to default when leaving a buffer
-- vim.api.nvim_create_autocmd("BufLeave", {
-- 	group = vim.api.nvim_create_augroup("theme_swithcer", {}),
-- 	callback = function()
-- 		print('leaving buffer')
-- 		vim.cmd.colorscheme('carbonfox')
-- 	end,
-- })
--
