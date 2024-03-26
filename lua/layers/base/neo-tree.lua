return {
  'nvim-neo-tree/neo-tree.nvim',
  lazy = false,
  branch = 'v3.x',
  dependencies = {
    { 'MunifTanjim/nui.nvim' },
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-tree/nvim-web-devicons' },
  },
  config = function()
    local neotree = require('neo-tree')

    vim.fn.sign_define('DiagnosticSignHint', { text = '󰌵', texthl = 'DiagnosticSignHint' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
    vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })

    -- link nvim-tree to neotree
    vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', { link = 'NvimTreeFolderIcon' })
    vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', { link = 'NvimTreeFolderName' })
    vim.api.nvim_set_hl(0, 'NeoTreeSymbolicLinkTarget', { link = 'NvimTreeSymlink' })
    vim.api.nvim_set_hl(0, 'NeoTreeRootName', { link = 'NvimTreeRootFolder' })
    vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', { link = 'NvimTreeOpenedFolderName' })
    vim.api.nvim_set_hl(0, 'NeoTreeFileNameOpened', { link = 'NvimTreeOpenedFile' })

    neotree.setup({
      popup_border_style = 'single',
      close_if_last_window = true,
      default_component_configs = { indent = { padding = 1, indent_size = 4 } },
      window = { position = 'float' },
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

    vim.keymap.set('n', '-', '<cmd>Neotree filesystem float reveal<cr>', { noremap = true })
  end,
}
