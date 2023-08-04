local M = {}

function M.project_files()
  local opts = {} -- define here if you want to define something
  vim.fn.system('git rev-parse --is-inside-work-tree')
  if vim.v.shell_error == 0 then
    require('telescope.builtin').git_files(opts)
  else
    require('telescope.builtin').find_files(opts)
  end
end

function M.config()
  local actions = require('telescope.actions')
  require('telescope').setup({
    defaults = {
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
        case_mode = 'smart_case',
        override_file_sorter = true,
        override_generic_sorter = true,
      },
    },
  })

  require('telescope').load_extension('fzf')
end

return M
