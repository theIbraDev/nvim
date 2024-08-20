-- TODO ADD COLORSCHEME TO TELESCOPE
-- Telescope
local actions = require "telescope.actions"
local builtin = require("telescope.builtin")

require("telescope").setup({
    defaults = {
			mappings = {
				i = {
					["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
					["<C-w>"] = actions.smart_add_to_qflist + actions.open_qflist,
				},
				n = {
					["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
					["<C-w>"] = actions.smart_add_to_qflist + actions.open_qflist,
				},
			},
	},
	file_ignore_patterns = {
		"node_modules",
		".svg",
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),
		},
	},
})

require("telescope").load_extension("ui-select")

-- Builtin
vim.keymap.set("n", "<leader>p", builtin.find_files, {})
vim.keymap.set("n", "<leader>tc", builtin.commands, {})
vim.keymap.set("n", "<leader>td", builtin.diagnostics, {})
vim.keymap.set("n", "<leader>th", builtin.help_tags, {})
vim.keymap.set("n", "<leader>tc", builtin.git_commits, {})
vim.keymap.set("n", "<leader>tq", builtin.quickfix, {})
vim.keymap.set("n", "<leader>tQ", builtin.quickfixhistory, {})
vim.keymap.set("n", "<leader>tS", builtin.live_grep, {})
vim.keymap.set("n", "<leader>ts", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>tb", builtin.git_branches, {})
vim.keymap.set("n", "<leader>tB", builtin.buffers, {})
vim.keymap.set("n", "<leader>tw", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
vim.keymap.set("n", "<leader>tW", "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>")

