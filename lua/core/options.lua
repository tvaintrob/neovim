local cache_dir = os.getenv('HOME') .. '/.cache/nvim/'

vim.g.python3_host_prog = vim.api.nvim_call_function('stdpath', { 'data' }) .. '/pynvim/bin/python3'
vim.g.mapleader = ','
vim.g.gitblame_date_format = '%r'
vim.g.neo_tree_remove_legacy_commands = 1

vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.directory = cache_dir .. 'swag/'
vim.opt.undofile = true
vim.opt.undodir = cache_dir .. 'undo/'
vim.opt.backupdir = cache_dir .. 'backup/'
vim.opt.viewdir = cache_dir .. 'view/'
vim.opt.spellfile = cache_dir .. 'spell/en.uft-8.add'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.scrolloff = 4
vim.opt.signcolumn = 'yes'
vim.opt.showmode = false
vim.opt.swapfile = false
vim.opt.hlsearch = false

-- default tab settings,
-- should be overriden by editorconfig
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.expandtab = true

vim.opt.mouse = 'a'
vim.opt.hidden = true
vim.opt.splitright = true
vim.opt.splitbelow = true

-- resize windowns automatically only horizontaly
vim.opt.eadirection = 'hor'

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.updatetime = 750
vim.opt.foldlevel = 10
