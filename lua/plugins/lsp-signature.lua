return {
  'ray-x/lsp_signature.nvim',
  depedenencies = {
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/nvim-cmp' },
  },
  event = 'VeryLazy',
  config = function()
    require('lsp_signature').setup({
      hint_enable = false,
    })
  end,
}
