return {
  'Mofiqul/vscode.nvim',
  priority = 1000,
  config = function()
    require('vscode').setup({
      italic_comments = true,
      underline_links = true,
    })
    require('vscode').load()

    vim.api.nvim_set_hl(0, 'CopilotAnnotation', { link = 'CursorLineFold' })
    vim.api.nvim_set_hl(0, 'CopilotSuggestion', { link = 'CursorLineFold' })
  end,
}
