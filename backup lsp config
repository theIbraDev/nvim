local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>lc", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>lR", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_next) -- moves regardless of the last direction
    vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_previous)
    local next_diagnostic_repeat, prev_diagnostic_repeat = ts_repeat_move.make_repeatable_move_pair(vim.diagnostic.goto_next , vim.diagnostic.goto_prev)
    vim.keymap.set({ "n", "x", "o" }, "md", next_diagnostic_repeat) -- Has to be below repeatable pair
    vim.keymap.set({ "n", "x", "o" }, "Md", prev_diagnostic_repeat)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'tsserver','jsonls', 'svelte', 'rust_analyzer', 'lua_ls', 'gopls'},
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})
    -- Autocompletion
local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
  },
  -- Below is mappings for cmp
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<CR>'] = cmp.mapping.confirm({select = true}),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
})
