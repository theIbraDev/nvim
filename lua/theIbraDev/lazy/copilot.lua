return {
    "github/copilot.vim",
    config = function ()
        -- Disable copilot by default
        vim.g.copilot_enabled = 0
        -- vim bind leader c to enable copilot
        vim.api.nvim_set_keymap('n', '<Leader>cc', ':Copilot enable<CR>', { noremap = true, silent = true })
        -- vim bind leader d to disable copilot
        vim.api.nvim_set_keymap('n', '<Leader>cd', ':Copilot disable<CR>', { noremap = true, silent = true })
        -- bind leader p to get panel
        vim.api.nvim_set_keymap('n', '<Leader>cp', ':Copilot panel<CR>', { noremap = true, silent = true })
        -- Accept next word
        vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')
    end
}

