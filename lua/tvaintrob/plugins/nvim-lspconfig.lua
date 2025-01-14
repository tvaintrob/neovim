return {
  {
    'artemave/workspace-diagnostics.nvim',
    opts = {
      workspace_files = function()
        local workspace_files = vim.fn.split(vim.fn.system('git ls-files'), '\n')
        return workspace_files
      end,
    },
  },

  {
    'whoissethdaniel/mason-tool-installer.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    opts = {
      auto_update = true,
      run_on_start = true,
      ensure_installed = {
        'shfmt',
        'stylua',
        'lua-language-server',
        'bash-language-server',
      },
    },
  },

  { 'folke/neodev.nvim', ft = 'lua', lazy = true },

  {
    'neovim/nvim-lspconfig',
    event = 'LazyFile',
    dependencies = {
      { 'saghen/blink.cmp' },
      { 'williamboman/mason.nvim', opts = {} },
      {
        'whoissethdaniel/mason-tool-installer.nvim',
        opts_extend = { 'ensure_installed' },
        opts = { ensure_installed = {} },
      },
      {
        'williamboman/mason-lspconfig.nvim',
        opts = {
          handlers = {
            require('tvaintrob.utils.lsp').setup_server,

            ['lua_ls'] = function()
              require('neodev').setup()
              require('tvaintrob.utils.lsp').setup_server('lua_ls')
            end,
          },
        },
        config = function(_, opts)
          require('mason-lspconfig').setup(opts)
        end,
      },
    },
  },
}
