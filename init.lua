-- tvaintrob's neovim config

-- change the <leader> key to ,
vim.g.mapleader = ','

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- load all plugins and configurations
require('lazy_nvim').setup('plugins')

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hidden = true
vim.opt.undofile = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.showmode = false
vim.opt.hlsearch = false
vim.opt.swapfile = false
vim.opt.scrolloff = 4
vim.opt.foldlevel = 10
vim.opt.modeline = true
vim.opt.mouse = 'a'
vim.opt.signcolumn = 'yes'
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- default tab settings,
-- should be overriden by editorconfig
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.expandtab = true

-- resize windowns automatically only horizontaly
vim.opt.eadirection = 'hor'

-- split movements
vim.keymap.set('n', '<c-h>', '<c-w>h', { silent = true, noremap = true })
vim.keymap.set('n', '<c-j>', '<c-w>j', { silent = true, noremap = true })
vim.keymap.set('n', '<c-k>', '<c-w>k', { silent = true, noremap = true })
vim.keymap.set('n', '<c-l>', '<c-w>l', { silent = true, noremap = true })
vim.keymap.set('t', '<c-h>', '<c-\\><c-n><c-w>h', { silent = true, noremap = true })
vim.keymap.set('t', '<c-j>', '<c-\\><c-n><c-w>j', { silent = true, noremap = true })
vim.keymap.set('t', '<c-k>', '<c-\\><c-n><c-w>k', { silent = true, noremap = true })
vim.keymap.set('t', '<c-l>', '<c-\\><c-n><c-w>l', { silent = true, noremap = true })

-- yank to end of line
vim.keymap.set('n', 'Y', 'y$', { noremap = true })

-- better indenting
vim.keymap.set('v', '<', '<gv', { silent = true, noremap = true })
vim.keymap.set('v', '>', '>gv', { silent = true, noremap = true })

-- move lines up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true, noremap = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true, noremap = true })

-- disable command history
vim.keymap.set('n', 'Q', '<nop>', { noremap = true })
vim.keymap.set('n', 'q:', '<nop>', { noremap = true })

-- auto reload file when changed
vim.api.nvim_create_autocmd('CursorHold', {
  pattern = '*',
  command = 'checktime',
  group = vim.api.nvim_create_augroup('AutoRead', { clear = true }),
})
