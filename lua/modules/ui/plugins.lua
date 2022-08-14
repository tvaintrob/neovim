-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin

plugin({
  'luisiacc/gruvbox-baby',
  branch = 'main',
  config = function()
    vim.cmd([[colorscheme gruvbox-baby]])
  end,
})

plugin({
  'feline-nvim/feline.nvim',
  config = function()
    require('feline').setup({})
    require('feline').winbar.setup({})
  end,
})

-- plugin({
--   'glepnir/galaxyline.nvim',
--   branch = 'main',
--   config = conf.galaxyline,
--   requires = 'kyazdani42/nvim-web-devicons',
-- })

-- plugin({
--   'strash/everybody-wants-that-line.nvim',
--   config = function()
--     require('everybody-wants-that-line').setup({})
--   end,
-- })
