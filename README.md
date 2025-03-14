# jsx-element.nvim

JSX/TSX text-objects and motions.

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
