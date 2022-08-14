local plugin = require('core.pack').register_plugin
local require_file = require('core.utils').require_file

plugin({
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  event = 'BufRead',
  after = 'telescope.nvim',
  config = require_file('modules.language-support.treesitter'),
  requires = {
    { 'joosepalviste/nvim-ts-context-commentstring' },
  },
})

plugin({
  'neovim/nvim-lspconfig',
  -- used filetype to lazyload lsp
  -- config your language filetype in here
  ft = {
    'sh',
    'go',
    'vim',
    'lua',
    'css',
    'rust',
    'json',
    'yaml',
    'html',
    'python',
    'dockerfile',
    'typescript',
    'typescriptreact',
    'javascript',
    'javascriptreact',
  },
  after = 'nvim-cmp',
  config = require_file('modules.language-support.lsp'),
  requires = {
    { 'jose-elias-alvarez/null-ls.nvim' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'whoissethdaniel/mason-tool-installer.nvim' },
    { 'folke/lua-dev.nvim', ft = { 'lua' } },
    { 'b0o/schemastore.nvim', ft = { 'json' } },
  },
})
