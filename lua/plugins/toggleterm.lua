return {
  'akinsho/toggleterm.nvim',
  version = '*',
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    require('toggleterm').setup({ size = 20 })

    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({
      cmd = 'lazygit',
      dir = 'git_dir',
      direction = 'float',
      float_opts = { border = 'single' },
      on_open = function(term)
        vim.cmd.startinsert()
        vim.keymap.set('n', 'q', term.toggle, { noremap = true, silent = true, buffer = true })
      end,
    })

    vim.keymap.set({ 'n', 't' }, '<leader>t', '<cmd>ToggleTerm<cr>')
    vim.keymap.set({ 'n', 't' }, '<leader>vt', '<cmd>ToggleTerm direction=vertical size=100<cr>')
    vim.keymap.set('n', '<leader>lg', function()
      lazygit:toggle()
    end)
  end,
}
