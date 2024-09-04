-- Basic keymaps

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
