return {
  'nvim-lualine/lualine.nvim',
  event = 'LazyFile',
  dependencies = {
    'lunarvim/darkplus.nvim',
    'AndreM222/copilot-lualine',
    'nvim-tree/nvim-web-devicons',
    { 'msvechla/yaml-companion.nvim', branch = 'kubernetes_crd_detection' },
  },
  config = function()
    vim.o.showmode = false

    local function lsp_server_names()
      local servers = vim.lsp.get_clients({ bufnr = 0 })
      local server_names = {}

      for _, value in ipairs(servers) do
        table.insert(server_names, value.name)
      end

      table.sort(server_names)
      return '  LSP: ' .. table.concat(server_names, ', ')
    end

    local function yaml_schema()
      local schema = require('yaml-companion').get_buf_schema(0)
      if schema.result[1].name == 'none' then
        return ''
      end
      return schema and '  YAML: ' .. schema.result[1].name
    end

    require('lualine').setup({
      options = {
        theme = 'darkplus',
        icons_enabled = true,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_c = { { 'filename', path = 1 }, 'navic' },
        lualine_x = {
          yaml_schema,
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
