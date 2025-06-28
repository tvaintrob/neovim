local function lsp_server_names()
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

local function yaml_schema()
    local schema = require('schema-companion.context').get_buffer_schema().name
    if schema == 'none' then
        return ''
    end
    return schema and '  YAML: ' .. schema
end

return {
    {
        'nvim-lualine/lualine.nvim',
        event = 'LazyFile',
        init = function()
            vim.opt.showmode = false
        end,
        opts = {
            options = {
                icons_enabled = true,
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
            },
            sections = {
                lualine_c = { { 'filename', path = 1 }, 'navic' },
                lualine_x = {
                    yaml_schema,
                    lsp_server_names,
                    'encoding',
                    'filetype',
                },
            },
        },
    },
}
