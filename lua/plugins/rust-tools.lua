return {
  'simrat39/rust-tools.nvim',
  config = function()
    require('rust-tools').setup({
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { buffer = bufnr })
        end,
      },
    })
  end,
}
