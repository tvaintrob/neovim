return {
  'luckasRanarison/tailwind-tools.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  opts = {
    conceal = {
      enabled = true,
      min_length = 100,
    },
    custom_filetypes = { 'go' },
  },
}
