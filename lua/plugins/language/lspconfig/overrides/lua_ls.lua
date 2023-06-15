local utils = require('plugins.language.lspconfig.utils')

return function()
  require('neodev').setup({ lspconfig = false })
  require('lspconfig').lua_ls.setup(utils.override_with({
    before_init = require('neodev.lsp').before_init,
    settings = {
      Lua = {
        diagnostics = { globals = { 'vim' } },
        workspace = { checkThirdParty = false },
      },
    },
  }))
end
