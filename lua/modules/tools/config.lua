local config = {}

function config.telescope()
  if not packer_plugins['plenary.nvim'].loaded then
    vim.cmd([[packadd plenary.nvim]])
    vim.cmd([[packadd popup.nvim]])
    vim.cmd([[packadd telescope-fzf-native.nvim]])
  end

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

function config.neotree()
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

function config.toggleterm()
  require('toggleterm').setup({
    size = 20,
    open_mapping = [[<leader>t]],
  })

  local Terminal = require('toggleterm.terminal').Terminal
  local lazygit = Terminal:new({
    cmd = 'lazygit',
    dir = 'git_dir',
    direction = 'float',
    float_opts = { border = 'single' },
    on_open = function(term)
      vim.cmd('startinsert!')
      vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
    end,
  })

  local function _lazygit_toggle()
    lazygit:toggle()
  end

  vim.keymap.set('n', '<leader>lg', _lazygit_toggle, { noremap = true, silent = true })
end

return config
