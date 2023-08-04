-- tvaintrob's neovim config

require('lazy_nvim').setup_lazy()

-- TODO: this is temporary
vim.cmd.colorscheme('habamax')

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hidden = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.showmode = false
vim.opt.hlsearch = false
vim.opt.swapfile = false
vim.opt.scrolloff = 4
vim.opt.foldlevel = 10
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
