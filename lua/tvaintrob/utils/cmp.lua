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
---@param entry cmp.Entry
---@param item vim.CompletedItem
---@return vim.CompletedItem
function M.format_item(entry, item)
  local highlights_info =
    require('colorful-menu').highlights(entry.completion_item, vim.bo.filetype)

  if highlights_info == nil then
    item.abbr = entry.completion_item.label
  else
    item.abbr_hl_group = highlights_info.highlights
    item.abbr = highlights_info.text
  end

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
