local plugin = require('core.pack').register_plugin

plugin({
  'folke/tokyonight.nvim',
  branch = 'main',
  config = function()
    vim.g.tokyonight_style = 'night'
    vim.cmd([[ colorscheme tokyonight ]])
  end,
})

plugin({
  'nvim-lualine/lualine.nvim',
  requires = {
    { 'kyazdani42/nvim-web-devicons', opt = true },
  },
  config = function()
    local function lsp_server_names()
      local servers = vim.lsp.get_active_clients({ bufnr = 0 })
      local names = 'connected servers: '

      for i, server in ipairs(servers) do
        if i == 1 then
          names = names .. server.name
        else
          names = names .. ' | ' .. server.name
        end
      end

      return names
    end

    require('lualine').setup({
      options = {
        theme = 'auto',
        section_separators = '',
        component_separators = '',
      },

      sections = {
        lualine_x = { lsp_server_names, 'encoding', 'fileformat', 'filetype' },
      },
    })
  end,
})
