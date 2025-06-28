-- change the <leader> key
vim.g.mapleader = ','

-- enable line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- enable undofile to store undo info across sessions
vim.opt.undofile = true

-- enable cursor line highlight
vim.opt.cursorline = true

-- enable better colors
vim.opt.termguicolors = true

-- change split directions
vim.opt.splitright = true
vim.opt.splitbelow = true

-- auto resize windows only horizontally
vim.opt.eadirection = 'hor'

-- better search
vim.opt.hlsearch = false
vim.opt.smartcase = true

-- disable swapfiles
vim.opt.swapfile = false

-- try to keep atleast a few lines around the cursor
vim.opt.scrolloff = 4

-- always show the sign column
vim.opt.signcolumn = 'yes'

-- initial indent settings, expected to be overridden by editorconfig
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

-- define diagnostic signs
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.HINT] = '󰌵',
            [vim.diagnostic.severity.WARN] = ' ',
            [vim.diagnostic.severity.INFO] = ' ',
            [vim.diagnostic.severity.ERROR] = ' ',
        },
    },
})

require('tvaintrob.lazy').setup({
    { import = 'tvaintrob.plugins.editor' },
    { import = 'tvaintrob.plugins.git' },
    { import = 'tvaintrob.plugins.intellisense' },
    { import = 'tvaintrob.plugins.ui' },

    -- language packs
    { import = 'tvaintrob.langs.lua' },
    { import = 'tvaintrob.langs.bash' },
    { import = 'tvaintrob.langs.python' },
    { import = 'tvaintrob.langs.typescript' },
    { import = 'tvaintrob.langs.docker' },

    { import = 'tvaintrob.langs.json' },
    { import = 'tvaintrob.langs.yaml' },
    { import = 'tvaintrob.langs.html' },
    { import = 'tvaintrob.langs.markdown' },
    { import = 'tvaintrob.langs.terraform' },
})
