return {
	{ dir = "~/personal/sveltekit-movements.nvim/",
		config = function()
			require("sveltekit-movements").setup({
				-- Jump to spesific file
				page_keymap = '<C-h>',   -- Jump to +page.svelte
				server_keymap = '<C-y>',  -- Jump to +page.server.ts
				layout_keymap = '<leader>sl',  -- Jump to nearest layout file
				hooks_keymap = '<leader>sh',  -- Jump to nearest hooks file
				-- Toggles
				toggle_keymap = '<leader>sa',  -- Toggle between page and server
			})

		end,
	},
}
