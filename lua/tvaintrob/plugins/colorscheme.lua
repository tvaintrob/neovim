return {
  'Mofiqul/vscode.nvim',
  priority = 1000,
  config = function()
    local vscode = require('vscode')

    vscode.setup({
      italic_comments = true,
      underline_links = true,
      group_overrides = {
        CursorLine = { bg = '#303030' },
        NeoTreeCursorLine = { bg = '#303030' },
      },
    })

    vscode.load()
  end,
}
