local M = {}

---@param preposition 'inner' | 'outer'
---@param node 'string'
---@return string
local function textobject_cmd(preposition, node)
  return ('<cmd>TSTextobjectSelect @%s.%s<CR>'):format(node, preposition)
end

---@param direction 'next' | 'prev'
---@param node 'string'
---@return string
local function goto_cmd(direction, node)
  local pascal_cased_direction = direction == 'next' and 'Next' or 'Previous'
  return ('<cmd>TSTextobjectGoto%sStart @%s.outer<CR>'):format(pascal_cased_direction, node)
end

---@param event vim.api.keyset.create_autocmd.callback_args
---@param keys table<string, { node: string, name?: string }> `name` is the name used in the keymap description
local function textobject_map(event, keys)
  ---@param desc string
  local function opts(desc)
    return { desc = desc, buffer = event.buf }
  end

  for key, mapping in pairs(keys) do
    local n, xo = 'n', { 'x', 'o' }
    local node = mapping.node
    local name = mapping.name or mapping.node

    vim.keymap.set(xo, 'i' .. key, textobject_cmd('inner', node), opts(('Inside %s'):format(name)))
    vim.keymap.set(xo, 'a' .. key, textobject_cmd('outer', node), opts(('Around %s'):format(name)))
    vim.keymap.set(n, ']' .. key, goto_cmd('next', node), opts(('Go to next %s'):format(name)))
    vim.keymap.set(n, '[' .. key, goto_cmd('prev', node), opts(('Go to previous %s'):format(name)))
  end
end

--- Creates treesitter textobject keymaps for `filetypes`
---@param filetypes string | string[]
---@param keys table<string, { node: string, name?: string }> `name` is the name used in the keymap description
---@param augroup string|integer
function M.filetype_keymaps(keys, filetypes, augroup)
  vim.api.nvim_create_autocmd('FileType', {
    pattern = filetypes,
    group = augroup,
    callback = function(event)
      textobject_map(event, keys)
    end,
  })
end

return M
