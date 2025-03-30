local function open_explorer()
    local split_count = #vim.api.nvim_tabpage_list_wins(0)
    if split_count > 1 then
        vim.cmd('Neotree filesystem current reveal')
    else
        vim.cmd('Neotree filesystem float reveal')
    end
end

return {
    { 'MunifTanjim/nui.nvim', lazy = true },
    { 'nvim-lua/plenary.nvim', lazy = true },
    { 'nvim-tree/nvim-web-devicons', lazy = true },
    {
        'nvim-neo-tree/neo-tree.nvim',
        lazy = false,
        branch = 'v3.x',
        keys = { { '-', open_explorer, noremap = true, desc = 'Open file explorer' } },
        init = function()
            -- link nvim-tree to neotree
            vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', { link = 'NvimTreeFolderIcon' })
            vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', { link = 'NvimTreeFolderName' })
            vim.api.nvim_set_hl(0, 'NeoTreeSymbolicLinkTarget', { link = 'NvimTreeSymlink' })
            vim.api.nvim_set_hl(0, 'NeoTreeRootName', { link = 'NvimTreeRootFolder' })
            vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', { link = 'NvimTreeOpenedFolderName' })
            vim.api.nvim_set_hl(0, 'NeoTreeFileNameOpened', { link = 'NvimTreeOpenedFile' })
        end,
        opts = {
            popup_border_style = 'single',
            close_if_last_window = true,
            default_component_configs = { indent = { padding = 1, indent_size = 4 } },
            window = { position = 'float' },
            filesystem = {
                follow_current_file = { enabled = true },
                window = {
                    mappings = {
                        ['^'] = 'navigate_up',
                        ['I'] = 'toggle_hidden',
                    },
                },
            },
        },
    },
}
