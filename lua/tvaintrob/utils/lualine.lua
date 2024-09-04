local M = {}

function M.lsp_server_names()
  local servers = vim.lsp.get_clients({ bufnr = 0 })
  local server_names = {}

  for _, value in ipairs(servers) do
    table.insert(server_names, value.name)
  end

  table.sort(server_names)
  if #server_names > 0 then
    return '  LSP: ' .. table.concat(server_names, ', ')
  else
    return ''
  end
end

function M.yaml_schema()
  local schema = require('yaml-companion').get_buf_schema(0)
  if schema.result[1].name == 'none' then
    return ''
  end
  return schema and '  YAML: ' .. schema.result[1].name
end

return M
