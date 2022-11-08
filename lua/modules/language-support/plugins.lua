local plugin = require('core.pack').register_plugin

plugin({
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  config = function()
    require('modules.language-support.treesitter')
  end,
  requires = {
    { 'joosepalviste/nvim-ts-context-commentstring' },
    { 'windwp/nvim-autopairs' },
    { 'windwp/nvim-ts-autotag' },
    { 'RRethy/nvim-treesitter-endwise' },
    { 'nvim-treesitter/nvim-treesitter-context' },
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
  config = function()
    require('modules.language-support.lsp')
  end,
  requires = {
    { 'folke/neodev.nvim' },
    { 'b0o/schemastore.nvim' },
    { 'nvim-lua/plenary.nvim' },
    { 'jose-elias-alvarez/null-ls.nvim' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'whoissethdaniel/mason-tool-installer.nvim' },
    { 'hrsh7th/cmp-nvim-lsp' },
  },
})
