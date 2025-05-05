-- change the <leader> key
vim.g.mapleader = ','

-- enable line numbers
vim.o.number = true
vim.o.relativenumber = true

-- enable undofile to store undo info across sessions
vim.o.undofile = true

-- enable cursor line highlight
vim.o.cursorline = true

-- enable better colors
vim.o.termguicolors = true

-- change split directions
vim.o.splitright = true
vim.o.splitbelow = true

-- auto resize windows only horizontally
vim.o.eadirection = 'hor'

-- better search
vim.o.hlsearch = false
vim.o.smartcase = true

-- disable swapfiles
vim.o.swapfile = false

-- try to keep atleast a few lines around the cursor
vim.o.scrolloff = 4

-- always show the sign column
vim.o.signcolumn = 'yes'

-- initial indent settings, expected to be overridden by editorconfig
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.smarttab = true
vim.o.expandtab = true

-- define custom filetypes
vim.filetype.add({ filename = { ['.envrc'] = 'bash' } })
vim.filetype.add({ extension = { ['json'] = 'jsonc' } })
vim.filetype.add({ extension = { ['tf'] = 'terraform' } })
vim.filetype.add({ pattern = { ['.*/templates/.*%.yaml'] = 'helm' } })
vim.filetype.add({ pattern = { ['.*%.component%.html'] = 'htmlangular' } })

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

-- alias cc to CodeCompanion in command line mode
vim.cmd([[cab cc CodeCompanion]])
