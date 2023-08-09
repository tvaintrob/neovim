return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    -- local builtin = require('telescope.builtin')

    telescope.setup({
      defaults = {
        prompt_prefix = '🔎  ',
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
          fuzzy = false,
          override_file_sorter = true,
          override_generic_sorter = true,
          case_mode = 'ignore_case',
        },
      },
    })

    -- load telescope extensions
    telescope.load_extension('fzf')
  end,
}
