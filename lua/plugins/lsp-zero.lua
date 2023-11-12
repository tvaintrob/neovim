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
          schemaStore = { enable = false, url = '' },
          schemas = require('schemastore').yaml.schemas(),
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
      },
      window = {
        completion = cmp.config.window.bordered(surface_opts),
        documentation = cmp.config.window.bordered(surface_opts),
      },
      formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        format = require('lspkind').cmp_format({
          mode = 'symbol_text', -- show only symbol annotations
          preset = 'codicons',
          maxwidth = 50, -- prevent the popup from showing more than provided characters
          ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
        }),
      },
    })
  end,
}
