local M = {}

M.lazy_file_events = { 'BufReadPost', 'BufNewFile', 'BufWritePre' }

function M.lazy_file()
    -- Add support for the LazyFile event
    local Event = require('lazy.core.handler.event')

    Event.mappings.LazyFile = { id = 'LazyFile', event = M.lazy_file_events }
    Event.mappings['User LazyFile'] = Event.mappings.LazyFile
end

---Setup lazy.nvim plugin manager and load all given plugins
---@overload fun(opts: LazyConfig)
M.setup = function(opts)
    local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            'git',
            'clone',
            '--filter=blob:none',
            'https://github.com/folke/lazy.nvim.git',
            '--branch=stable', -- latest stable release
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)

    -- enable LazyFile events, taken from LazyVim
    M.lazy_file()

    -- setup plugins
    require('lazy').setup(opts, {
        change_detection = { notify = false },
        install = { colorscheme = { 'vscode', 'tokyonight', 'default' } },
        performance = {
            rtp = {
                disabled_plugins = {
                    'gzip',
                    'tutor',
                    'tohtml',
                    'matchit',
                    'tarPlugin',
                    'zipPlugin',
                    'matchparen',
                    'netrwPlugin',
                },
            },
        },
    })
end

return M
