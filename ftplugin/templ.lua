vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == 'templ'
    end,
  })
end, { silent = true, noremap = true, buffer = true })
