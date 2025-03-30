local M = {}

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

    -- add support for `LazyFile` events from LazyVim
    require('tvaintrob.utils.lazyfile').setup()

    -- setup plugins
    require('lazy').setup(opts, {
        change_detection = { notify = false },
        install = { colorscheme = { 'vscode' } },
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
