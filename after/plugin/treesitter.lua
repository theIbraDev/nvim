require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    sync_install = false,

    -- Install parsers synchronously (only applied to `ensure_installed`)
    auto_install = false,

    highlight = { enable = true },

    indent = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
        },
    },
    ensure_installed = { "rust", "c", "javascript", "html", "typescript", "lua", "svelte", "vim", "vimdoc", "query" },
    -- The greatest setting of all fucking time
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
                ['ii'] = '@conditional.inner',
                ['ai'] = '@conditional.outer',
                ['il'] = '@loop.inner',
                ['al'] = '@loop.outer',
                ['at'] = '@comment.outer',
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ['mf'] = '@function.outer',
                ['mc'] = '@class.outer',
                ['mt'] = '@comment.outer',
                ['ml'] = '@loop.outer',
            },
            goto_previous_start = {
                ['Mf'] = '@function.outer',
                ['Mc'] = '@class.outer',
                ['Mt'] = '@comment.outer',
                ['Ml'] = '@loop.outer',
            },
        },
    }
}
local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
-- ensure , goes forward and ; goes backward regardless of the last direction
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_previous)
