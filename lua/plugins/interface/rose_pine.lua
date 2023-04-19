local M = {}

function M.config()
  require('rose-pine').setup({ dark_variant = 'moon' })
  vim.cmd('colorscheme rose-pine')

  -- setup highlights for rose-pine colors
  vim.api.nvim_set_hl(0, 'RosePineBase', { fg = '#e0def4', bg = '#232136' })
  vim.api.nvim_set_hl(0, 'RosePineSurface', { fg = '#e0def4', bg = '#2a273f' })
  vim.api.nvim_set_hl(0, 'RosePineOverlay', { fg = '#e0def4', bg = '#393552' })
  -- vim.api.nvim_set_hl(0, 'Muted', {}) #6e6a86
  -- vim.api.nvim_set_hl(0, 'Subtle', {}) #908caa
  -- vim.api.nvim_set_hl(0, 'Text', {}) #e0def4
  -- vim.api.nvim_set_hl(0, 'Love', {}) #eb6f92
  -- vim.api.nvim_set_hl(0, 'Gold', {}) #f6c177
  -- vim.api.nvim_set_hl(0, 'Rose', {}) #ea9a97
  -- vim.api.nvim_set_hl(0, 'Pine', {}) #3e8fb0
  -- vim.api.nvim_set_hl(0, 'Foam', {}) #9ccfd8
  -- vim.api.nvim_set_hl(0, 'Iris', {}) #c4a7e7
  -- vim.api.nvim_set_hl(0, 'Highlight Low', {}) #2a283e
  -- vim.api.nvim_set_hl(0, 'Highlight Med', {}) #44415a
  -- vim.api.nvim_set_hl(0, 'Highlight High', {}) #56526e
end

return M
