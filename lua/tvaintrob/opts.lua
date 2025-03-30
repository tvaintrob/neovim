-- Basic opts

vim.g.mapleader = ',' -- set the leaderkey to comma

vim.opt.number = true -- enable line numbers
vim.opt.relativenumber = true -- enable relative line numbers
vim.opt.hidden = true -- enable hidden buffers, in unsaved state
vim.opt.undofile = true -- enable undo state to carryover between sessions
vim.opt.cursorline = true -- enable a cursorline highlight
vim.opt.termguicolors = true -- enable 24bit colors in the terminal
vim.opt.splitright = true -- new vertical splits will be created to the right
vim.opt.splitbelow = true -- new horizontal splits will be created below
vim.opt.hlsearch = false -- disable highlighting searched patterns after the search is accepted
vim.opt.swapfile = false -- disable swapfiles creation, they are mostly trash
vim.opt.scrolloff = 4 -- keep 4 lines offset when scrolling
vim.opt.foldlevel = 10 -- setup initial fold level to 10
vim.opt.modeline = true -- enable modeline parsing, allow setting options using in file directives
vim.opt.mouse = 'a' -- enable mouse usage
vim.opt.signcolumn = 'yes' -- always show the sign column
vim.opt.smartcase = true
vim.opt.eadirection = 'hor' -- resize windowns automatically only horizontaly

-- default tab settings,
-- should be overriden by editorconfig
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.expandtab = true

-- define custom filetypes
vim.filetype.add({ filename = { ['.envrc'] = 'bash' } })
vim.filetype.add({ extension = { ['json'] = 'jsonc' } })
vim.filetype.add({ extension = { ['tf'] = 'terraform' } })
vim.filetype.add({ pattern = { ['.*/templates/.*%.yaml'] = 'helm' } })
vim.filetype.add({ pattern = { ['.*%.component%.html'] = 'htmlangular' } })
