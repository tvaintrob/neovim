local utils = require('plugins.language.lspconfig.utils')

local M = {}

local function server_handler(server_name)
  local has_override, override = pcall(require, 'plugins.language.lspconfig.overrides.' .. server_name)
  if has_override then
    override()
  else
    require('lspconfig')[server_name].setup(utils.server_defaults)
  end
end

function M.config()
  require('mason-lspconfig').setup_handlers({ server_handler })
end

return M
