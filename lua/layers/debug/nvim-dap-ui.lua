return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
  },

  config = function()
    require('dapui').setup()
    local dap = require('dap')
    local dapui = require('dapui')

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
    vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = '', numhl = '' })

    vim.keymap.set('n', '<leader>dd', require('dap').continue)
    vim.keymap.set('n', '<leader>dso', require('dap').step_over)
    vim.keymap.set('n', '<leader>dsi', require('dap').step_into)
    vim.keymap.set('n', '<leader>dsO', require('dap').step_out)
    vim.keymap.set('n', '<leader>db', require('dap').toggle_breakpoint)
  end,
}
