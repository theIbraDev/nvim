return {

    "nvim-treesitter/nvim-treesitter",
    dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
},
    build = ":TSUpdate",
    config = function ()
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
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['al'] = '@loop.outer',
                        ['il'] = '@loop.inner',
                        ['at'] = '@comment.outer',
                        ['it'] = '@comment.outer',
                        ['ai'] = '@conditional.outer',
                        ['ii'] = '@conditional.inner',
                        ['an'] = '@assignment.lhs', -- Variable selector name
                        ['in'] = '@assignment.lhs', -- Variable selector name
                        ['av'] = '@assignment.outer', -- Variable selector value
                        ['iv'] = '@assignment.rhs', -- Variable selector value
                        ['ac'] = '@class.outer',
                        ['ic'] = '@class.inner',
                        ['aa'] = '@parameter.outer',
                        ['ia'] = '@parameter.inner',
                    },
                },

                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        ['mf'] = '@function.outer',
                        ['ml'] = '@loop.outer',
                        ['mt'] = '@comment.outer',
                        ['mi'] = '@conditional.outer',
                        ['mv'] = '@assignment.rhs', -- Variable select value
                        ['mn'] = '@assignment.lhs', -- Variable selector name
                        ['mc'] = '@class.outer',
                        ['ma'] = '@parameter.outer',
                    },
                    goto_previous_start = {
                        ['Mf'] = '@function.outer',
                        ['Ml'] = '@loop.outer',
                        ['Mt'] = '@comment.outer',
                        ['Mi'] = '@conditional.outer',
                        ['Mv'] = '@assignment.rhs',
                        ['Mn'] = '@assignment.lhs',
                        ['Mc'] = '@class.outer',
                        ['Ma'] = '@parameter.outer',
                    },
                },
            }
        }
        local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
        -- ensure , goes forward and ; goes backward regardless of the last direction
        vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_next)
        vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_previous)
    end
}
