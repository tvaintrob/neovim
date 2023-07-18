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
  local lspconfig = require('lspconfig')
  local configs = require('lspconfig.configs')

  -- Check if it's already defined for when reloading this file.
  if not configs.up then
    configs.up = {
      default_config = {
        cmd = { 'up', 'xpls', 'serve' },
        filetypes = { 'yaml' },
        root_dir = lspconfig.util.root_pattern('crossplane.yaml'),
      },
    }
  end

  lspconfig.up.setup(utils.server_defaults)
  require('mason-lspconfig').setup_handlers({ server_handler })
end

return M
