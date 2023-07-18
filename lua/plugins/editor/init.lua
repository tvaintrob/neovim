local utils = require('core.utils')
local nvim_cmp = require('plugins.editor.nvim_cmp')
local treesitter = require('plugins.editor.treesitter')

return {
  { 'tpope/vim-repeat', event = { 'BufReadPost', 'BufNewFile' } },
  { 'tpope/vim-commentary', event = { 'BufReadPost', 'BufNewFile' } },
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

  {
    'zbirenbaum/copilot.lua',
    config = function()
      require('copilot').setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },

  {
    'hrsh7th/nvim-cmp',
    version = false,
    event = 'InsertEnter',
    config = nvim_cmp.config,
    dependencies = {
      { 'hrsh7th/vim-vsnip' },
      {
        'onsails/lspkind-nvim',
        config = function()
          require('lspkind').init({
            symbol_map = {
              Copilot = '',
            },
          })
        end,
      },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-vsnip' },
      { 'hrsh7th/cmp-emoji' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },
      {
        'zbirenbaum/copilot-cmp',
        config = function()
          require('copilot_cmp').setup()
          vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', { fg = '#6CC644' })
        end,
      },
    },
  },
}
