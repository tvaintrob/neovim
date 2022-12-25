local M = {}

M.telescope_project_files = function(args)
  local telescope_builtins = require('telescope.builtin')
  local ok = pcall(telescope_builtins.git_files, args)

  if not ok then
    telescope_builtins.find_files(args)
  end
end

M.format_buffer = function(bufnr)
  -- check if lsp is connected
  if not next(vim.lsp.get_active_clients({ bufnr = bufnr })) then
    vim.api.nvim_feedkeys('gg=G``', 'n', false)
  else
    -- local filter = function(client)
    --   return client.name == 'null-ls'
    -- end
    local filter = function(client)
      return client.name ~= 'tsserver'
    end

    vim.lsp.buf.format({ bufnr = bufnr, filter = filter, timeout_ms = 2000 })
  end
end

return M
