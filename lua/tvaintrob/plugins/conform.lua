return {
  'stevearc/conform.nvim',
  cmd = { 'Format', 'ConformInfo' },
  event = { 'BufWritePre' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format({ async = true, lsp_fallback = true })
      end,
      mode = { 'v', 'n' },
      desc = 'Format current buffer',
    },
  },
  opts = {
    formatters_by_ft = {
      sh = { 'shfmt' },
      lua = { 'stylua' },
      query = { 'format-queries' },
    },
  },
  init = function()
    -- configure formatexpr for `gq` operator
    vim.opt.formatexpr = "v:lua.require'conform'.formatexpr()"

    -- create a format command
    vim.api.nvim_create_user_command('Format', function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          ['start'] = { args.line1, 0 },
          ['end'] = { args.line2, end_line:len() },
        }
      end
      require('conform').format({ async = false, lsp_format = 'fallback', range = range })
    end, { range = true })
  end,
}
