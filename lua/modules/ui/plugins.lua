require('modules.ui.config')
local plugin = require('core.pack').register_plugin

plugin({
  'folke/tokyonight.nvim',
  branch = 'main',
  config = function()
    vim.g.tokyonight_style = 'night'
    vim.g.tokyonight_lualine_bold = true

    vim.cmd([[
      augroup MyColors
        autocmd!
        autocmd ColorScheme * highlight LineNr guifg=#5081c0   | highlight CursorLineNR guifg=#FFba00
      augroup END
    ]])
    vim.cmd([[ colorscheme tokyonight ]])
  end,
})

plugin({
  'stevearc/dressing.nvim',
  requires = { 'muniftanjim/nui.nvim' },
  config = function()
    require('dressing').setup({})
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
