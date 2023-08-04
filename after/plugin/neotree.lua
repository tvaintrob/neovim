local neotree = require('neo-tree')

vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '󰌵', texthl = 'DiagnosticSignHint' })

neotree.setup({
  close_if_last_window = true,
  default_component_configs = { indent = { padding = 1, indent_size = 4 } },
  window = { position = 'current' },
  filesystem = {
    follow_current_file = { enabled = true },
    window = {
      mappings = {
        ['^'] = 'navigate_up',
        ['I'] = 'toggle_hidden',
      },
    },
  },
})

vim.keymap.set('n', '-', '<cmd>Neotree filesystem current reveal<cr>')
