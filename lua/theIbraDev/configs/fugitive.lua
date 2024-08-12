-- Fugitive
vim.keymap.set("n", "<leader>gg", vim.cmd.Git)

local theIbraDev_fugitive = vim.api.nvim_create_augroup("theIbraDev_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
	group = theIbraDev_fugitive,
	-- Removed group
	pattern = "*",
	callback = function()
		if vim.bo.ft ~= "fugitive" then
			return
		end

		local bufnr = vim.api.nvim_get_current_buf()
		local opts = { buffer = bufnr, remap = false }

		vim.keymap.set("n", "<leader>gp", ":Git push -u origin ", opts)
		vim.keymap.set("n", "<leader>go", ":Git remote add origin ", opts)
		vim.keymap.set("n", "<leader>gr", ":Git rebase ", opts)

		vim.keymap.set("n", "<leader>p", function()
			vim.cmd([[ Git push ]])
		end, opts)

		vim.keymap.set("n", "<leader>scp", function()
			vim.cmd([[ Git commit -m "update markdown" | Git push ]])
		end, opts)

		vim.keymap.set("n", "<leader>P", function()
			vim.cmd([[ Git pull --rebase ]])
		end, opts)

		vim.keymap.set("n", "<leader>c", function()
			vim.cmd([[ Git config --get remote.origin.fetch ]])
		end, opts)
		vim.keymap.set("n", "<leader>C", ":Git config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'", opts)
	end,
	-- rework this conflict stuff, this is useless
	-- vim.keymap.set("n", "<leaader>gr", "<cmd>diffget //2<CR>"),
	-- vim.keymap.set("n", "gd", "<cmd>diffget //3<CR>"),
})
