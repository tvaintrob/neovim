local M = {}

M.require_file = function(file_name)
  return function()
    require(file_name)
  end
end

return M
