local M = {}

function M.config()
  require('rose-pine').setup({ dark_variant = 'moon' })
  vim.cmd('colorscheme rose-pine')

  -- setup highlights for rose-pine colors
  vim.api.nvim_set_hl(0, 'RosePineBase', { fg = '#e0def4', bg = '#232136' })
  vim.api.nvim_set_hl(0, 'RosePineSurface', { fg = '#e0def4', bg = '#2a273f' })
  vim.api.nvim_set_hl(0, 'RosePineOverlay', { fg = '#e0def4', bg = '#393552' })
end

return M
