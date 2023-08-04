local function lsp_server_names()
  local servers = vim.lsp.get_active_clients({ bufnr = 0 })
  local names = ''

  for _, server in ipairs(servers) do
    names = names .. ' [' .. server.name .. ']'
  end

  return names
end

local function navic_location()
  return require('nvim-navic').get_location()
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'arkav/lualine-lsp-progress',
    'SmiteshP/nvim-navic',
  },
  opts = {
    options = {
      theme = 'auto',
      section_separators = '',
      component_separators = '',
    },
    sections = {
      lualine_c = { 'filename', navic_location, 'lsp_progress' },
      lualine_x = { lsp_server_names, 'encoding', 'fileformat', 'filetype' },
    },
  },
}
