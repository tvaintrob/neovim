local lualine = require('plugins.interface.lualine')
local rose_pine = require('plugins.interface.rose_pine')

return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = rose_pine.config,
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'arkav/lualine-lsp-progress' },
    config = lualine.config,
  },

  {
    'f-person/git-blame.nvim',
    config = function()
      vim.g.gitblame_date_format = '%r'
    end,
  },
}
