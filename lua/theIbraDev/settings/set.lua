vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.nu = true
vim.opt.relativenumber = true -- Display line numbers relative to the current line
vim.opt.splitbelow = true -- Horizontal splits will be below
vim.opt.splitright = true -- Vertical splits will be to the right
vim.opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.shada = { "'10", "<0", "s10", "h" } -- Files to remember
vim.opt.swapfile = false
vim.opt.formatoptions:remove("o") -- Suprising how often this annoys me.
vim.opt.wrap = true -- Always keep all text visible on screen.
vim.opt.linebreak = true

-- Indent / show blankspace
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0 -- Defaults to 8, when 0 it's the same as tabstop
vim.opt.softtabstop = 8
vim.opt.expandtab = false
vim.opt.smartindent = true
vim.opt.list = true
vim.opt.listchars = "tab:| "

-- Folds
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

vim.opt.backup = false
vim.opt.undofile = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80,120"

vim.cmd([[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]])
