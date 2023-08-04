local utils = require('plugins.language.lspconfig.utils')

return function()
  require('lspconfig').jsonls.setup(utils.override_with({
    settings = {
      json = {
        validate = { enable = true },
        schemas = require('schemastore').json.schemas(),
      },
    },
  }))
end
