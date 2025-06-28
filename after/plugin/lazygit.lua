local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
    cmd = 'lazygit',
    dir = 'git_dir',
    direction = 'float',
    float_opts = {
        border = 'single',
    },
    on_open = function(term)
        vim.cmd('startinsert!')
        vim.api.nvim_buf_set_keymap(
            term.bufnr,
            'n',
            'q',
            '<cmd>close<CR>',
            { noremap = true, silent = true }
        )
    end,
    on_close = function(term)
        vim.cmd('startinsert!')
    end,
})

function _lazygit_toggle()
    lazygit:toggle()
end

vim.api.nvim_set_keymap(
    'n',
    '<leader>lg',
    '<cmd>lua _lazygit_toggle()<CR>',
    { noremap = true, silent = true }
)
