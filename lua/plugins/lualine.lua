local function lsp_server_names()
  local servers = vim.lsp.get_active_clients({ bufnr = 0 })
  local names = ''

  for _, server in ipairs(servers) do
    names = names .. ' [' .. server.name .. ']'
  end

  return names
end

return {
  'nvim-lualine/lualine.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = {
    { 'nvim-tree/nvim-web-devicons' },
    { 'arkav/lualine-lsp-progress' },
    { 'SmiteshP/nvim-navic', opts = { lsp = { auto_attach = true } } },
  },
  opts = {
    options = {
      theme = 'auto',
      section_separators = '',
      component_separators = '',
    },
    sections = {
      lualine_c = { 'filename', 'navic', 'lsp_progress' },
      lualine_x = { lsp_server_names, 'encoding', 'fileformat', 'filetype' },
    },
  },
}
