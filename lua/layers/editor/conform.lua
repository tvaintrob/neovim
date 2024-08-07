--- format ft formatters to the way conform wants
--- @param spec table<table, table>
--- @return table<string, table>
local function ft_format(spec)
  local reformattedSpec = {}
  for langs, tools in pairs(spec) do
    if type(langs) == 'string' then
      reformattedSpec[langs] = tools
    elseif type(langs) == 'table' then
      for _, lang in ipairs(langs) do
        reformattedSpec[lang] = tools
      end
    end
  end
  return reformattedSpec
end

return {
  'stevearc/conform.nvim',
  cmd = { 'ConformInfo' },
  event = { 'BufWritePre' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format({ async = true, lsp_fallback = true })
      end,
      mode = { 'v', 'n' },
      desc = 'Format current buffer',
    },
  },

  config = function()
    require('conform').setup({
      formatters_by_ft = ft_format({
        lua = { 'stylua' },
        go = { 'goimports' },
        sql = { 'sqlfmt' },
        query = { 'format-queries' },
        html = { 'prettier' },
        [{ 'json', 'yaml', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'markdown' }] = {
          'prettier',
        },
      }),
    })
  end,
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
