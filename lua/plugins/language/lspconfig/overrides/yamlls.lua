local utils = require('plugins.language.lspconfig.utils')

return function()
  require('lspconfig').yamlls.setup(utils.override_with({
    settings = {
      yaml = {
        validate = { enable = false },
        keyOrdering = false,
        schemas = require('schemastore').yaml.schemas(),
      },
    },
  }))
end
