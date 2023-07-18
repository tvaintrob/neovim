local M = {}

function M.config()
  local cmp = require('cmp')
  local types = require('cmp.types')
  local mapping = require('cmp.config.mapping')

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
  end

  local feedkey = function(key, mode)
    local keys = vim.api.nvim_replace_termcodes(key, true, true, true)
    vim.api.nvim_feedkeys(keys, mode, true)
  end

  local border_opts = {
    border = 'solid',
    winhighlight = 'Normal:RosePineOverlay,FloatBorder:RosePineOverlay,CursorLine:Visual,Search:None',
  }

  cmp.setup({
    preselect = cmp.PreselectMode.Item,
    formatting = { format = require('lspkind').cmp_format({ mode = 'symbol_text' }) },
    snippet = {
      expand = function(args)
        vim.fn['vsnip#anonymous'](args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(border_opts),
      documentation = cmp.config.window.bordered(border_opts),
    },
    mapping = mapping.preset.insert({
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif vim.fn['vsnip#available'](1) == 1 then
          feedkey('<Plug>(vsnip-expand-or-jump)', '')
        elseif has_words_before() then
          cmp.complete()
        else
          fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.fn['vsnip#jumpable'](-1) == 1 then
          feedkey('<Plug>(vsnip-jump-prev)', '')
        end
      end, { 'i', 's' }),
      ['<C-Space>'] = mapping.complete({}),
      ['<C-e>'] = mapping.abort(),
      ['<C-j>'] = mapping(mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Insert }), { 'i', 'c' }),
      ['<C-k>'] = mapping(mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert }), { 'i', 'c' }),
      ['<CR>'] = mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'copilot', group_index = 1 },
      { name = 'nvim_lsp', group_index = 2 },
      { name = 'nvim_lsp_signature_help', group_index = 2 },
      { name = 'path', group_index = 2 },
      { name = 'nvim_lua', group_index = 2 },
      { name = 'vsnip', group_index = 3 },
      { name = 'emoji', group_index = 3 },
    }, {
      { name = 'buffer' },
    }),
  })
end

return M
