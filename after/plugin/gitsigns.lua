local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
  current_line_blame = false,
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end


        -- repeat
        vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_next)
        vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_previous)
        -- HAS TO BE AFTER REPEAT
        local next_hunk_repeat, prev_hunk_repeat = ts_repeat_move.make_repeatable_move_pair(gs.next_hunk, gs.prev_hunk)
        -- Or, use `make_repeatable_move` or `set_last_move` functions for more control. See the code for instructions.

        vim.keymap.set({ "n", "x", "o" }, "mh", next_hunk_repeat)
        vim.keymap.set({ "n", "x", "o" }, "Mh", prev_hunk_repeat)
    -- Actions
    -- Stage current hunk
    map({'n', 'v'}, '<leader>gs', ':Gitsigns stage_hunk<CR>')
    -- Remove what's new in current hunk
    map({'n', 'v'}, '<leader>gu', ':Gitsigns reset_hunk<CR>')
    -- Stage undo hunk
    map('n', '<leader>gr', gs.undo_stage_hunk)
    -- Preview changes in current hunk
    map('n', '<leader>gp', gs.preview_hunk)
    -- shows last commit for line
    map('n', '<leader>gb', function() gs.blame_line{full=true} end)
    -- Shows blame for current line
    map('n', '<leader>gc', gs.diffthis)
    -- shows us older versions, hitting td again will hide it
    map('n', '<leader>gx', gs.toggle_deleted)

    -- Text object
    --    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
end
}
