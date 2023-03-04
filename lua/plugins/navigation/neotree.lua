local M = {}

function M.config()
  require('neo-tree').setup({
    close_if_last_window = true,
    default_component_configs = { indent = { padding = 1, indent_size = 4 } },
    window = { position = 'float' },
    filesystem = {
      follow_current_file = true,
      window = {
        mappings = {
          ['^'] = 'navigate_up',
          ['I'] = 'toggle_hidden',
        },
      },
    },
  })
end

return M
