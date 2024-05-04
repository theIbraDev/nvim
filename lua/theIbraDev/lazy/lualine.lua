return {
'nvim-lualine/lualine.nvim',
config = function()
    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = 'dracula',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},

            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },

            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,

            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            }
        },

        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},

            lualine_c = {
                {
                    'filename',
                    file_status = true,      -- Displays file status (readonly status, modified status)
                    newfile_status = false,  -- Display new file status (new file means no write after created)
                    path = 3,                -- 0: Just the filename
                    -- 1: Relative path
                    -- 2: Absolute path
                    -- 3: Absolute path, with tilde as the home directory
                    -- 4: Filename and parent dir, with tilde as the home directory
                    shorting_target = 80,    -- Shortens path to leave 40 spaces in the window
                    symbols = {
                        modified = '[Modified, not saved]',      -- Text to show when the file is modified.
                        readonly = '[Readonly, sudo to edit]',      -- Text to show when the file is non-modifiable or readonly.
                        unnamed = '[Unnamed buffer]', -- Text to show for unnamed buffers.
                        newfile = '[New file, no first write]',     -- Text to show for newly created file before first write
                    }
                }
            },

            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}

        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
    }
end
}
