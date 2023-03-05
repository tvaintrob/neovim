local utils = require('core.utils')
local treesitter = require('plugins.editor.treesitter')

return {
  { 'tpope/vim-repeat', event = { 'BufReadPost', 'BufNewFile' } },
  { 'tpope/vim-commentary', event = { 'BufReadPost', 'BufNewFile' } },
  { 'gpanders/editorconfig.nvim', event = { 'BufReadPost', 'BufNewFile' } },
  { 'windwp/nvim-autopairs', event = { 'BufReadPost', 'BufNewFile' }, config = true },
  { 'kylechui/nvim-surround', event = { 'BufReadPost', 'BufNewFile' }, config = true },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = treesitter.config,
    dependencies = {
      { 'windwp/nvim-ts-autotag' },
      { 'RRethy/nvim-treesitter-endwise' },
      { 'joosepalviste/nvim-ts-context-commentstring' },
      { 'nvim-treesitter/nvim-treesitter-context', opts = { max_lines = -1 } },
    },
  },

  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = { size = 20 },
    cmd = 'ToggleTerm',
    keys = {
      { '<leader>t', '<cmd>ToggleTerm<cr>', mode = { 'n', 't' } },
      { '<leader>vt', '<cmd>ToggleTerm direction=vertical size=100<cr>', mode = { 'n', 't' } },
      { '<leader>lg', utils.delegate('plugins.editor.toggleterm', 'lazygit_toggle', {}) },
    },
  },
}
