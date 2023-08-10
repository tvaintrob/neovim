return {
  'weilbith/nvim-code-action-menu',
  config = function()
    vim.g.code_action_menu_show_action_kind = false
    vim.keymap.set('n', '<leader>ac', '<cmd>CodeActionMenu<cr>', { buffer = true })
  end,
}
