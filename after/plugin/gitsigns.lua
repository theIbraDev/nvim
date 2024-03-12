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

    -- Navigation []d will jump to previous and next changes
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

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
    map('n', '<leader>gb', function() gs.blame_line{full=false} end)
    -- Shows blame for current line
    map('n', '<leader>gc', gs.diffthis)
    -- shows us older versions, hitting td again will hide it
    map('n', '<leader>gx', gs.toggle_deleted)

    -- Text object
    --    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
end
}
