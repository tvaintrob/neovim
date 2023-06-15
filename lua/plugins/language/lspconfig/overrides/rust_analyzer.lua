local utils = require('plugins.language.lspconfig.utils')

return function()
  require('rust-tools').setup({
    server = {
      on_attach = utils.on_attach,
      handlers = utils.handlers,
    },
  })
end
