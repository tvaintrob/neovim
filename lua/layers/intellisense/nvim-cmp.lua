return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/vim-vsnip' },
    { 'hrsh7th/cmp-vsnip' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'petertriho/cmp-git' },
  },
  config = function()
    local cmp = require('cmp')
    local cmptypes = require('cmp.types')
    local cmp_kinds = {
      Text = '  ',
      Method = '  ',
      Function = '  ',
      Constructor = '  ',
      Field = '  ',
      Variable = '  ',
      Class = '  ',
      Interface = '  ',
      Module = '  ',
      Property = '  ',
      Unit = '  ',
      Value = '  ',
      Enum = '  ',
      Keyword = '  ',
      Snippet = '  ',
      Color = '  ',
      File = '  ',
      Reference = '  ',
      Folder = '  ',
      EnumMember = '  ',
      Constant = '  ',
      Struct = '  ',
      Event = '  ',
      Operator = '  ',
      TypeParameter = '  ',
    }

    -- setup colors for the popup list
    vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg = 'NONE', strikethrough = true, fg = '#808080' })
    vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg = 'NONE', fg = '#569CD6' })
    vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpIntemAbbrMatch' })
    vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg = 'NONE', fg = '#9CDCFE' })
    vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link = 'CmpItemKindVariable' })
    vim.api.nvim_set_hl(0, 'CmpItemKindText', { link = 'CmpItemKindVariable' })
    vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg = 'NONE', fg = '#C586C0' })
    vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link = 'CmpItemKindFunction' })
    vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg = 'NONE', fg = '#D4D4D4' })
    vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link = 'CmpItemKindKeyword' })
    vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link = 'CmpItemKindKeyword' })

    cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn['vsnip#anonymous'](args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        expandable_indicator = true,
        format = function(_, vim_item)
          local kind = vim_item.kind
          local has_error = pcall(function()
            kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind
          end)

          if not has_error then
            vim_item.kind = kind
          end

          return vim_item
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmptypes.cmp.SelectBehavior.Select }),
        ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmptypes.cmp.SelectBehavior.Select }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if vim.fn['vsnip#available'](1) == 1 then
            require('utils').feedkey('<Plug>(vsnip-expand-or-jump)', '')
          -- elseif require('copilot.suggestion').is_visible() then
          --   require('copilot.suggestion').accept()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function()
          if vim.fn['vsnip#jumpable'](-1) == 1 then
            require('utils').feedkey('<Plug>(vsnip-jump-prev)', '')
          end
        end, { 'i', 's' }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'path' },
      }, {
        { name = 'buffer' },
      }),
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'git' },
      }, {
        { name = 'buffer' },
      }),
    })
  end,
}
