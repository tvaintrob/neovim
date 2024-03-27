return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
    'mfussenegger/nvim-dap-python',
    'nvim-neotest/nvim-nio',
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
    vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = 'PmenuSel', numhl = '' })

    local debugpy_path = vim.fn.stdpath('data') .. '/mason/packages/debugpy/venv/bin/python'
    require('dap-python').setup(debugpy_path)
  end,
}
