return {
  { 'windwp/nvim-autopairs', event = 'InsertEnter', opts = {} },
  {
    'saghen/blink.cmp',
    version = '*',
    dependencies = {
      { 'rafamadriz/friendly-snippets' },
      { 'xzbdmw/colorful-menu.nvim', opts = {}, lazy = true },
    },
    opts = {
      keymap = {
        preset = 'none',
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<C-j>'] = { 'select_next', 'fallback' },
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },
        ['<Tab>'] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          'snippet_forward',
          'fallback',
        },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      },
      appearance = {
        nerd_font_variant = 'mono',
        use_nvim_cmp_as_default = true,
      },
      sources = {
        cmdline = {},
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      completion = {
        documentation = {
          window = { border = 'rounded' },
          auto_show = true,
          auto_show_delay_ms = 0,
        },
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
        menu = {
          border = 'rounded',
          max_height = 50,
          draw = {
            -- We don't need label_description now because label and label_description are already
            -- conbined together in label by colorful-menu.nvim.
            columns = { { 'label', gap = 4 }, { 'kind_icon', 'kind', gap = 1 } },
            components = {
              label = {
                text = function(ctx)
                  return require('colorful-menu').blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require('colorful-menu').blink_components_highlight(ctx)
                end,
              },
            },
          },
        },
      },
    },
  },
}
