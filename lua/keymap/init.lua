local key = require('core.keymap')
local utils = require('keymap.utils')

local cmd = key.cmd
local opts = key.new_opts
local silent, noremap = key.silent, key.noremap

key.nmap({
    -- buffer movements
    { '<c-h>',     '<c-w>h',                               opts(silent) },
    { '<c-j>',     '<c-w>j',                               opts(silent) },
    { '<c-k>',     '<c-w>k',                               opts(silent) },
    { '<c-l>',     '<c-w>l',                               opts(silent) },

    -- yank to end of line
    { 'Y',         'y$',                                   opts(noremap) },

    -- telescope mappings
    { '<c-f>',     cmd('Telescope grep_string search=""'), opts(noremap, silent) },
    { '<c-p>',     utils.telescope_project_files,          opts(noremap, silent) },

    -- formatting
    { '<leader>f', utils.format_buffer,                    opts(noremap, silent) },

    -- open neotree
    { '-',         cmd('Neotree filesystem float reveal'), opts(noremap, silent) },
})

key.tmap({
    -- buffer movements
    { '<c-h>', '<c-\\><c-n><c-w>h', opts(silent) },
    { '<c-j>', '<c-\\><c-n><c-w>j', opts(silent) },
    { '<c-k>', '<c-\\><c-n><c-w>k', opts(silent) },
    { '<c-l>', '<c-\\><c-n><c-w>l', opts(silent) },
})

key.vmap({
    -- better indenting
    { '<', '<gv',              opts(noremap, silent) },
    { '>', '>gv',              opts(noremap, silent) },

    -- move lines up and down
    { 'J', ":m '>+1<CR>gv=gv", opts(noremap, silent) },
    { 'K', ":m '<-2<CR>gv=gv", opts(noremap, silent) },
})
