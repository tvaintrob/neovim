local delegate = require('core.utils').delegate

local neotree = require('plugins.navigation.neotree')
local telescope = require('plugins.navigation.telescope')

return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    cmd = 'Telescope',
    module = 'telescope',
    config = telescope.config,
    keys = {
      { '<c-p>', telescope.project_files },
      { '<c-f>', delegate('telescope.builtin', 'grep_string', {}) },
    },
  },

  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    dependencies = {
      'muniftanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    lazy = false, -- required for netrw hijack
    config = neotree.config,
    keys = { { '-', '<cmd>Neotree filesystem float reveal<cr>' } },
  },
}
