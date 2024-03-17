return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = {
    { 'nvim-tree/nvim-web-devicons' },
    { 'nvim-telescope/telescope.nvim' },
  },
  config = function()
    vim.api.nvim_set_hl(0, 'DashboardMruTitle', { link = 'DashboardHeader' })
    vim.api.nvim_set_hl(0, 'DashboardProjectTitle', { link = 'DashboardHeader' })

    require('dashboard').setup({})
  end,
}
