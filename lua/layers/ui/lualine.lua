return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'lunarvim/darkplus.nvim',
    'AndreM222/copilot-lualine',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    vim.o.showmode = false

    local function lsp_server_names()
      local servers = vim.lsp.get_active_clients({ bufnr = 0 })
      local server_names = {}

      for _, value in ipairs(servers) do
        table.insert(server_names, value.name)
      end

      return '  LSP: ' .. table.concat(server_names, ', ')
    end

    require('lualine').setup({
      options = {
        theme = 'darkplus',
        icons_enabled = true,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_c = { 'filename', 'navic' },
        lualine_x = {
          lsp_server_names,
          'encoding',
          {
            'copilot',
            show_colors = true,
            show_loading = true,
          },
          'filetype',
        },
      },
    })
  end,
}
