require('modules.ui.config')
local plugin = require('core.pack').register_plugin

plugin({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      require('rose-pine').setup({ dark_variant = 'moon' })
      vim.cmd([[ colorscheme rose-pine ]])
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
        { 'arkav/lualine-lsp-progress' },
    },
    config = function()
      local function lsp_server_names()
        local servers = vim.lsp.get_active_clients({ bufnr = 0 })
        local names = ''

        for _, server in ipairs(servers) do
          names = names .. ' [' .. server.name .. ']'
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
              lualine_c = { 'filename', 'lsp_progress' },
              lualine_x = { lsp_server_names, 'encoding', 'fileformat', 'filetype' },
          },
      })
    end,
})
