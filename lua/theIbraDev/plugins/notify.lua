return {
	"rcarriga/nvim-notify",
	config = function ()
		require("notify").setup({
			timeout = 500,
		})
		vim.notify = require("notify")
	end
}
