return {
  { 'someone-stole-my-name/yaml-companion.nvim', lazy = true },
  { 'nvim-tree/nvim-web-devicons', lazy = true },
  {
    'nvim-lualine/lualine.nvim',
    event = 'LazyFile',
    dependencies = { 'lunarvim/darkplus.nvim' },
    init = function()
      vim.opt.showmode = false
    end,
    opts = {
      options = {
        theme = 'darkplus',
        icons_enabled = true,
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
      },
      sections = {
        lualine_c = { { 'filename', path = 1 }, 'navic' },
        lualine_x = {
          require('tvaintrob.utils.lualine').yaml_schema,
          require('tvaintrob.utils.lualine').lsp_server_names,
          'encoding',
          'filetype',
        },
      },
    },
  },
}
