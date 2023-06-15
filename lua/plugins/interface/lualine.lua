local M = {}

local function lsp_server_names()
  local servers = vim.lsp.get_active_clients({ bufnr = 0 })
  local names = ''

  for _, server in ipairs(servers) do
    names = names .. ' [' .. server.name .. ']'
  end

  return names
end

function M.config()
  require('lualine').setup({
    options = {
      theme = 'auto',
      section_separators = '',
      component_separators = '',
    },
    sections = {
      lualine_c = { 'filename', require('nvim-navic').get_location, 'lsp_progress' },
      lualine_x = { lsp_server_names, 'encoding', 'fileformat', 'filetype' },
    },
  })
end

return M
