local M = {}

M.kind_icons = {
  Text = ' ',
  Method = ' ',
  Function = ' ',
  Constructor = ' ',
  Field = ' ',
  Variable = ' ',
  Class = ' ',
  Interface = ' ',
  Module = ' ',
  Property = ' ',
  Unit = ' ',
  Value = ' ',
  Enum = ' ',
  Keyword = ' ',
  Snippet = ' ',
  Color = ' ',
  File = ' ',
  Reference = ' ',
  Folder = ' ',
  EnumMember = ' ',
  Constant = ' ',
  Struct = ' ',
  Event = ' ',
  Operator = ' ',
  TypeParameter = ' ',
}

---Format the completion item for nvim-cmp
---@param _ cmp.Entry
---@param item vim.CompletedItem
---@return vim.CompletedItem
function M.format_item(_, item)
  local ok, result = pcall(function()
    return (M.kind_icons[item.kind] or '') .. item.kind
  end)

  item.kind = (ok and result) or item.kind
  return item
end

---Send input keys to nvim
---@param key string
---@param mode string
function M.feedkey(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

return M
