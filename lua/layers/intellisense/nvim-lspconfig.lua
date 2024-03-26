return {
  'neovim/nvim-lspconfig',
  event = 'LazyFile',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'whoissethdaniel/mason-tool-installer.nvim',
    'folke/neodev.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'ray-x/lsp_signature.nvim',
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup()

    require('mason-tool-installer').setup({
      ensure_installed = {
        -- language servers
        'gopls',
        'css-lsp',
        'html-lsp',
        'htmx-lsp',
        'json-lsp',
        'ruff-lsp',
        'basedpyright',
        'rust-analyzer',
        'lua-language-server',
        'bash-language-server',
        'yaml-language-server',
        'typescript-language-server',
        'dockerfile-language-server',
        'tailwindcss-language-server',

        -- formatters
        'stylua',
        'prettier',
        'prettierd',
        'goimports',

        -- debug adapters,
        'delve',
        'debugpy',
      },
    })

    require('neodev').setup()
    require('mason-lspconfig').setup_handlers({
      function(server_name)
        require('lspconfig')[server_name].setup({
          capabilities = require('cmp_nvim_lsp').default_capabilities(),
        })
      end,
    })

    -- Setup keymaps only when a server is attached
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, noremap = true }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ac', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      end,
    })
  end,
}
