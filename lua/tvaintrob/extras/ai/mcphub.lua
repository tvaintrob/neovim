return {
    {
        'ravitemer/mcphub.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        cmd = 'MCPHub',
        build = 'npm install -g mcp-hub@latest', -- Installs required mcp-hub npm module
        config = function()
            require('mcphub').setup({
                auto_approve = true,
            })
        end,
    },
}
