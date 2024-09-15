--tjdevries/express_line.nvim
-- return {
-- 	"tjdevries/express_line.nvim",
-- 	config = function()
--       require("theIbraDev.configs.statusline")
--     end,
-- }
--lualine
return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require('theIbraDev.configs.statusline')
    end
}

-- Feline
-- return {
--     'freddiehaddad/feline.nvim',
--     opts = {},
--     config = function(_, opts)
--         require('theIbraDev.configs.statusline')
--     end
-- }
