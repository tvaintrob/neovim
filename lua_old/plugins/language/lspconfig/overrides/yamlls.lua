local utils = require('plugins.language.lspconfig.utils')

return function()
  local cfg = require('yaml-companion').setup({
    lspconfig = utils.override_with({
      settings = {
        yaml = {
          validate = false,
          keyOrdering = false,
          schemaStore = { enable = false },
          schemas = require('schemastore').yaml.schemas(),
        },
      },
    }),
  })

  require('lspconfig').yamlls.setup(cfg)

  -- require('lspconfig').yamlls.setup(utils.override_with({
  --   settings = {
  --     yaml = {
  --       validate = false,
  --       keyOrdering = false,
  --       schemaStore = { enable = false },
  --       schemas = require('schemastore').yaml.schemas(),
  --     },
  --   },
  -- }))
end
