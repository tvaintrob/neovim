local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local mason_tool_install = require('mason-tool-installer')
local null_ls = require('null-ls')

require('neodev').setup({})
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
    'gofumpt',
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
    null_ls.builtins.diagnostics.golangci_lint,

    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.prismaFmt,
    null_ls.builtins.formatting.buf,
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
  keymap(bufnr, 'n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
  keymap(bufnr, 'n', '<leader>ac', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  keymap(bufnr, 'n', '<leader>d', '<cmd>lua vim.diagnostic.open_float({ scope = "line", border = "single" })<CR>', opts)
  keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
end

-- handle lsp server initialization
local common_setup_handler = function(server_name)
  local handlers = {
    ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'single' }),
    ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'single' }),
  }

  local default_opts = {
    handlers = handlers,
    on_attach = common_on_attach,
    capabilities = vim.lsp.protocol.make_client_capabilities(),
  }

  local function organize_imports()
    local params = {
      command = '_typescript.organizeImports',
      arguments = { vim.api.nvim_buf_get_name(0) },
      title = '',
    }
    vim.lsp.buf.execute_command(params)
  end

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
    tsserver = { commands = { OrganizeImports = { organize_imports } } },
  }

  local server_opts = vim.tbl_extend('force', default_opts, server_overrides[server_name] or {})
  lsp_config[server_name].setup(server_opts)
end

mason_lspconfig.setup_handlers({ common_setup_handler })
