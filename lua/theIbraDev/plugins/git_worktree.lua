return {
    "polarmutex/git-worktree.nvim",
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
	config = function ()
		require('theIbraDev.configs.git_worktree')
	end
}
