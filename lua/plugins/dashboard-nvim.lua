return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = {
    { 'nvim-tree/nvim-web-devicons' },
    { 'ibhagwan/fzf-lua' },
  },
  config = function()
    require('dashboard').setup({
      config = {
        project = {
          enable = true,
          limit = 8,
          action = function(path)
            require('fzf-lua').files({ cwd = path })
          end,
        },
      },
    })
  end,
}
