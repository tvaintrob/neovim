return {
  'rose-pine/neovim',
  name = 'rose-pine',
  config = function()
    local rose_pine = require('rose-pine')
    local palette = require('rose-pine.palette')

    rose_pine.setup({ dark_variant = 'moon' })
    vim.cmd.colorscheme('rose-pine')

    vim.api.nvim_set_hl(0, 'RosePineBase', { fg = palette.text, bg = palette.base })
    vim.api.nvim_set_hl(0, 'RosePineSurface', { fg = palette.text, bg = palette.surface })
    vim.api.nvim_set_hl(0, 'RosePineOverlay', { fg = palette.text, bg = palette.overlay })
  end,
}
