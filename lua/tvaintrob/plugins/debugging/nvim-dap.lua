return {
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio',
            { 'theHamsta/nvim-dap-virtual-text', config = true },
        },
        cmd = {
            'DapShowLog',
            'DapContinue',
            'DapToggleBreakpoint',
            'DapToggleRepl',
            'DapStepOver',
            'DapStepInto',
            'DapStepOut',
            'DapTerminate',
            'DapLoadLaunchJSON',
            'DapRestartFrame',
        },
        keys = {
            {
                '<space>c',
                function()
                    require('dap').continue()
                end,
                desc = 'Continue execution',
            },
            {
                '<space>n',
                function()
                    require('dap').step_over()
                end,
                desc = 'Step over',
            },
            {
                '<space>s',
                function()
                    require('dap').step_into()
                end,
                desc = 'Step into',
            },
            {
                '<space>b',
                function()
                    require('dap').toggle_breakpoint()
                end,
                desc = 'Toggle breakpoint',
            },
        },
        config = function()
            require('dapui').setup()
            local dap = require('dap')
            local dapui = require('dapui')
            local ext_vscode = require('dap.ext.vscode')
            ext_vscode.json_decode = require('json5').parse

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end

            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end

            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end

            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = '@comment.error' })
            vim.fn.sign_define(
                'DapStopped',
                { text = '▶️', texthl = '', linehl = 'PmenuSel', numhl = '' }
            )

            local keymap_restore = {}
            dap.listeners.after['event_initialized']['me'] = function()
                for _, buf in pairs(vim.api.nvim_list_bufs()) do
                    local keymaps = vim.api.nvim_buf_get_keymap(buf, 'n')
                    for _, keymap in pairs(keymaps) do
                        if keymap.lhs == 'K' then
                            table.insert(keymap_restore, keymap)
                            vim.api.nvim_buf_del_keymap(buf, 'n', 'K')
                        end
                    end
                end
                vim.api.nvim_set_keymap(
                    'n',
                    'K',
                    '<Cmd>lua require("dap.ui.widgets").hover(nil, { border = "single" })<CR>',
                    { silent = true }
                )
            end

            dap.listeners.after['event_terminated']['me'] = function()
                for _, keymap in pairs(keymap_restore) do
                    if keymap.rhs then
                        vim.api.nvim_buf_set_keymap(
                            keymap.buffer,
                            keymap.mode,
                            keymap.lhs,
                            keymap.rhs,
                            { silent = keymap.silent == 1 }
                        )
                    elseif keymap.callback then
                        vim.keymap.set(
                            keymap.mode,
                            keymap.lhs,
                            keymap.callback,
                            { buffer = keymap.buffer, silent = keymap.silent == 1 }
                        )
                    end
                end
                keymap_restore = {}
            end
        end,
    },
}
