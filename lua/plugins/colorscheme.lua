return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        falvour = 'mocha',
        styles = {
          keywords = { 'bold' },
          types = { 'italic', 'bold' },
        },
        integrations = {
          mason = true,
          neotree = true,
          treesitter_context = true,
        },
      })

      vim.cmd.colorscheme('catppuccin')
    end,
  },
}
