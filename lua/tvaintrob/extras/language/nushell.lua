return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('lspconfig').nushell.setup({})
    end,
  },
}
