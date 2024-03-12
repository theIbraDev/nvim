local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>tx', builtin.commands, {})
vim.keymap.set('n', '<leader>tc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>tb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>ts', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

require('telescope').setup{
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                -- even more opts
            }

        }
    }
}
require("telescope").load_extension("ui-select")
