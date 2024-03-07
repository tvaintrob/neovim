return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  event = 'VimEnter',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-lua/popup.nvim' },
    { 'edolphin-ydf/goimpl.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    -- local builtin = require('telescope.builtin')

    telescope.setup({
      defaults = {
        prompt_prefix = '🔎 ',
        selection_caret = '❯ ',
        mappings = {
          i = {
            ['<esc>'] = actions.close,
            ['<c-j>'] = actions.move_selection_next,
            ['<c-k>'] = actions.move_selection_previous,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_file_sorter = true,
          override_generic_sorter = true,
        },
      },
    })

    -- load telescope extensions
    telescope.load_extension('fzf')
    telescope.load_extension('goimpl')

    -- keymaps
    vim.keymap.set('n', '<c-p>', '<cmd>Telescope find_files<cr>')
    vim.keymap.set('n', '<leader>pf', '<cmd>Telescope live_grep<cr>')
    vim.keymap.set('n', '<leader>ps', '<cmd>Telescope lsp_workspace_symbols<cr>')
    vim.keymap.set('n', '<leader>d', '<cmd>Telescope diagnostics<cr>')
  end,
}
