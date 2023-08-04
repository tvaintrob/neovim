local M = {}

-- util function to delegate the call of a function in a module to a later time
function M.delegate(module, fn, opts)
  local r = function()
    require(module)[fn](opts)
  end

  return r
end

return M
