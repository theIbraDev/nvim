return {
	"polarmutex/git-worktree.nvim",
	dependencies = {
		'nvim-lua/plenary.nvim',
		"nvim-telescope/telescope.nvim",
	},
	config = function ()
		require('theIbraDev.configs.git_worktree')
	end
}
