return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-tree/nvim-web-devicons' },
    { 'MunifTanjim/nui.nvim' },
  },
  config = function()
    local neotree = require('neo-tree')

    vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
    vim.fn.sign_define('DiagnosticSignHint', { text = '󰌵', texthl = 'DiagnosticSignHint' })

    neotree.setup({
      close_if_last_window = true,
      default_component_configs = { indent = { padding = 1, indent_size = 4 } },
      window = { position = 'float' },
      filesystem = {
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = 'open_default',
        window = {
          mappings = {
            ['^'] = 'navigate_up',
            ['I'] = 'toggle_hidden',
          },
        },
      },
    })

    vim.keymap.set('n', '-', '<cmd>Neotree filesystem current reveal<cr>')
  end,
}
