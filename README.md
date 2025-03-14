# jsx-element.nvim

JSX/TSX text-objects and motions using Treesitter.

I'm sorry that you're here because that means that you also have to work in React.

## Usage

Use `]t`/`[t` to go to the next/previous JSX/TSX element.

Use `it`/`at` to use JSX/TSX elements as text-objects. For example `dit` for "delete inside tag". This works with self-closing elements:

```
<Checkbox value="checkedA" />
          ╰───── it ─────╯
╰─────────── at ────────────╯
```

It also works with paired elements:

```
<Button variant="text">This is a button</Button>
                       ╰───── it ─────╯
╰───────────────────── at ─────────────────────╯
```

## Installation

With [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  'mawkler/jsx-element.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  ft = { 'typescriptreact', 'javascriptreact', 'javascript' },
  opts = {},
}
```

## Configuration

Default configuration:

```lua
{
  keymaps = {
    enable = true,     -- Create keymaps
    jsx_element = 't', -- Keymap to use for for `i`/`a` (text-object) and `]`/`[` (motion)
  },
}
```
