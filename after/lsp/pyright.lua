local function uv_script_interpreter(script_path)
    local result = vim.system({ 'uv', 'python', 'find', '--script', script_path }, { text = true })
        :wait()
    if result.code == 0 then
        return vim.fn.trim(result.stdout)
    end
end

return {
    before_init = function(_, config)
        local script = vim.api.nvim_buf_get_name(0)
        local python = uv_script_interpreter(script)
        if python then
            config.settings.python.pythonPath = python
        end
    end,
}
