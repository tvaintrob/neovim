return {
  'kcl-lang/kcl.nvim',
  dependencies = { 'neovim/nvim-lspconfig' },
  config = function()
    local server_config = require('lspconfig.configs')
    local util = require('lspconfig.util')

    server_config.kcl = {
      default_config = {},
    }

    require('lspconfig').kcl.setup({
      cmd = { 'kcl-language-server' },
      filetypes = { 'kcl' },
      root_dir = util.root_pattern('.git', 'kcl.mod'),
    })
  end,
}
