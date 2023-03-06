local utils = require('plugins.language.lspconfig.utils')

return function()
  require('neodev').setup({ lspconfig = false })
  require('lspconfig').lua_ls.setup(utils.override_with({
    before_init = require('neodev.lsp').before_init,
    settings = {
      Lua = {
        telemetry = { enable = false },
        runtime = { version = 'LuaJIT' },
        diagnostics = { globals = { 'vim' } },
        workspace = {
          library = vim.api.nvim_get_runtime_file('', true),
          checkThirdParty = false,
        },
      },
    },
  }))
end
