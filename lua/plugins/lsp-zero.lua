local surface_opts = {
  border = 'solid',
  winhighlight = 'Float:Pmenu,Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
}

return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = {
    { 'neovim/nvim-lspconfig' },
    { 'folke/neodev.nvim' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'L3MON4D3/LuaSnip' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'onsails/lspkind.nvim' },
    { 'b0o/schemastore.nvim' },
  },
  config = function()
    require('neodev').setup({
      override = function(_, library)
        library.enabled = true
        library.plugins = true
      end,
    })

    local cmp = require('cmp')
    local cmptypes = require('cmp.types')
    local lspzero = require('lsp-zero')
    local lspconfig = require('lspconfig')

    lspconfig.util.default_config.handlers = {
      ['textDocument/hover'] = vim.lsp.with(
        vim.lsp.handlers.hover,
        { border = 'single', winhighlight = surface_opts.winhighlight }
      ),
      ['textDocument/signatureHelp'] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        { border = 'single', winhighlight = surface_opts.winhighlight }
      ),
    }

    local lsp = lspzero.preset('recommended')

    lsp.on_attach(function(_, bufnr)
      lsp.default_keymaps({ buffer = bufnr })
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = true })
      vim.keymap.set('n', '<leader>d', function()
        vim.diagnostic.open_float({ scope = 'line', border = 'single' })
      end, { buffer = true })
    end)

    lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
    lspconfig.jsonls.setup({
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
          validate = { enable = true },
        },
      },
    })

    lspconfig.yamlls.setup({
      settings = {
        yaml = {
          schemas = {
            kubernetes = '*.yaml',
            ['http://json.schemastore.org/github-workflow'] = '.github/workflows/*',
            ['http://json.schemastore.org/github-action'] = '.github/action.{yml,yaml}',
            ['http://json.schemastore.org/ansible-stable-2.9'] = 'roles/tasks/*.{yml,yaml}',
            ['http://json.schemastore.org/prettierrc'] = '.prettierrc.{yml,yaml}',
            ['http://json.schemastore.org/kustomization'] = 'kustomization.{yml,yaml}',
            ['http://json.schemastore.org/ansible-playbook'] = '*play*.{yml,yaml}',
            ['http://json.schemastore.org/chart'] = 'Chart.{yml,yaml}',
            ['https://json.schemastore.org/dependabot-v2'] = '.github/dependabot.{yml,yaml}',
            ['https://json.schemastore.org/gitlab-ci'] = '*gitlab-ci*.{yml,yaml}',
            ['https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json'] = '*api*.{yml,yaml}',
            ['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = '*docker-compose*.{yml,yaml}',
            ['https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json'] = '*flow*.{yml,yaml}',
          },
        },
      },
    })

    lspconfig.gopls.setup({
      settings = {
        gopls = {
          gofumpt = true,
        },
      },
    })

    lspconfig.htmx.setup({ filetypes = { 'html', 'javascriptreact', 'typescriptreact', 'templ' } })

    lspconfig.tsserver.setup({
      commands = {
        OrganizeImports = {
          function()
            vim.lsp.buf.execute_command({
              command = '_typescript.organizeImports',
              arguments = { vim.api.nvim_buf_get_name(0) },
              title = '',
            })
          end,
          description = 'Organize Imports',
        },
      },
    })

    lspconfig.tailwindcss.setup({
      init_options = {
        userLanguages = {
          templ = 'html',
        },
      },
      filetypes = {
        'templ',
        'aspnetcorerazor',
        'astro',
        'astro-markdown',
        'blade',
        'clojure',
        'django-html',
        'htmldjango',
        'edge',
        'eelixir',
        'elixir',
        'ejs',
        'erb',
        'eruby',
        'gohtml',
        'gohtmltmpl',
        'haml',
        'handlebars',
        'hbs',
        'html',
        'html-eex',
        'heex',
        'jade',
        'leaf',
        'liquid',
        'markdown',
        'mdx',
        'mustache',
        'njk',
        'nunjucks',
        'php',
        'razor',
        'slim',
        'twig',
        'css',
        'less',
        'postcss',
        'sass',
        'scss',
        'stylus',
        'sugarss',
        'javascript',
        'javascriptreact',
        'reason',
        'rescript',
        'typescript',
        'typescriptreact',
        'vue',
        'svelte',
      },
    })

    lsp.skip_server_setup({ 'rust_analyzer' })
    lsp.setup()

    cmp.setup({
      sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'luasnip' },
      },
      mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmptypes.cmp.SelectBehavior.Select }),
        ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmptypes.cmp.SelectBehavior.Select }),
        ['<Tab>'] = cmp.mapping(function(fallback)
          local suggestion = require('copilot.suggestion')
          if suggestion.is_visible() then
            suggestion.accept()
          else
            fallback()
          end
        end, { 'i' }),
      },
      window = {
        completion = cmp.config.window.bordered(surface_opts),
        documentation = cmp.config.window.bordered(surface_opts),
      },
      formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        format = require('lspkind').cmp_format({
          mode = 'symbol_text',
          preset = 'codicons',
          maxwidth = 50,
          ellipsis_char = '...',
        }),
      },
    })
  end,
}
