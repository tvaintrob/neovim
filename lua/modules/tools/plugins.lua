-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('modules.tools.config')

plugin({
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  module = 'telescope',
  config = conf.telescope,
  requires = {
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    { 'nvim-lua/popup.nvim', opt = true },
    { 'nvim-lua/plenary.nvim', opt = true },
  },
})

plugin({
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v2.x',
  config = conf.neotree,
  requires = {
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
  },
})

plugin({
  'andrewferrier/debugprint.nvim',
  config = function()
    require('debugprint').setup()
  end,
})

plugin({ 'gpanders/editorconfig.nvim' })
