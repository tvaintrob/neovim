return {
  { 'MunifTanjim/nui.nvim', lazy = true },
  {
    'folke/noice.nvim',
    event = 'LazyFile',
    opts = {
      notify = { enabled = false },
      cmdline = { enabled = false },
      messages = { enabled = false },
      popupmenu = { enabled = false },
      presets = { lsp_doc_border = true },
      lsp = {
        hover = { enabled = true },
        progress = { enabled = true },
        signature = { enabled = true },
        override = {
          ['cmp.entry.get_documentation'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        },
      },
      views = {
        mini = {
          position = {
            row = -2,
          },
        },
      },
    },
  },
}
