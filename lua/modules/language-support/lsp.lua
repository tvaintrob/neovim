local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local mason_tool_install = require('mason-tool-installer')
local null_ls = require('null-ls')
local lsp_config = require('lspconfig')

mason.setup({})
mason_lspconfig.setup({})
mason_tool_install.setup({
  auto_update = true,
  run_on_start = true,
  ensure_installed = {
    -- ensure lsp servers installed
    'gopls',
    'pyright',
    'css-lsp',
    'html-lsp',
    'json-lsp',
    'rust-analyzer',
    'vim-language-server',
    'lua-language-server',
    'yaml-language-server',
    'bash-language-server',
    'dockerfile-language-server',
    'typescript-language-server',

    -- ensure formatters installed
    'black',
    'isort',
    'shfmt',
    'stylua',
    'prettier',
    'goimports',
    'prettierd',

    -- ensure linters installed
    'eslint_d',
    'hadolint',
    'golangci-lint',
  },
})

null_ls.setup({
  debug = true,
  sources = {
    null_ls.builtins.code_actions.eslint_d,

    null_ls.diagnostics.hadolint,
    null_ls.diagnostics.shellcheck,
    null_ls.diagnostics.golangci_lint,

    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.black.with({ args = { '-' } }),
  },
})

-- handle lsp client attach, setup keymaps
local common_on_attach = function(_, bufnr)
  local keymap = vim.api.nvim_buf_set_keymap
  local opts = { silent = true, noremap = true }

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  keymap(bufnr, 'n', '<leader>ac', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', opts)
  keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', opts)
  keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end

-- handle lsp server initialization
local common_setup_handler = function(server_name)
  local handlers = {
    ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'single' }),
    ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'single' }),
  }

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
  if status_ok then
    capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
  else
    vim.notify('cmd-nvim-lsp not loaded', vim.log.levels.WARN)
  end

  local default_opts = {
    handlers = handlers,
    on_attach = common_on_attach,
    capabilities = capabilities,
  }

  local server_overrides = {
    yamlls = {
      settings = {
        yaml = {
          completion = true,
          schemas = { kubernetes = '*.yaml' },
          schemaStore = { enable = true, url = 'https://www.schemastore.org/api/json/catalog.json' },
        },
      },
    },
    jsonls = { settings = { json = { schemas = require('schemastore').json.schemas() } } },
    sumneko_lua = require('lua-dev').setup(default_opts),
  }

  local server_opts = vim.tbl_extend('force', default_opts, server_overrides[server_name] or {})
  lsp_config[server_name].setup(server_opts)
end

mason_lspconfig.setup_handlers({ common_setup_handler })
