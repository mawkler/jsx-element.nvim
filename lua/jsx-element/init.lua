local M = {}

--- @class jsx-element.options.keymaps
--- @field enable? boolean Create keymaps
--- @field jsx_element? string Keymap to use for for `i`/`a` (text-object) and `]`/`[` (motion)

--- @class jsx-element.options
--- @field keymaps? jsx-element.options.keymaps Create keymaps

--- @class jsx-element.default_options
local default_options = {
  keymaps = {
    enable = true,
    jsx_element = 't',
  },
}

--- @param opts jsx-element.default_options
local function create_keymaps(opts)
  local augroup = vim.api.nvim_create_augroup('TreesitterTextobjects', {})
  local jsx_filetypes = { 'typescriptreact', 'javascript', 'javascriptreact' }
  local keymaps = {
    [opts.keymaps.jsx_element] = { node = 'jsx_element', name = 'JSX element' },
  }

  require('jsx-element.keymap').filetype_keymaps(keymaps, jsx_filetypes, augroup)
end

--- @param options jsx-element.options
function M.setup(options)
  local opts = vim.tbl_deep_extend('force', default_options, options or {})

  if opts.keymaps.enable then
    create_keymaps(opts)
  end
end

return M
