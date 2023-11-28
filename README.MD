# barebone-nvim
barebone-nvim is meant to be the absolute bare minimum (in my opinion) of what you need to launch your own config.

![Screenshot](https://i.imgur.com/FCA20w3.png)

# Requirements:
- [neovim](https://github.com/neovim/neovim) stable or nightly -> check latest neovim releases.
- [lua-language-server](https://github.com/LuaLS/lua-language-server) (Manually or via mason with `:MasonInstall`) -> The language server needs to be in PATH.
- [ripgrep](https://github.com/BurntSushi/ripgrep), also recommend installing [fzf](https://github.com/junegunn/fzf)
- A C compiler ([zig](https://ziglang.org/download/) for Windows)

# Installation:
# Linux:
```
git clone https://github.com/leet0rz/barebone-nvim ~/.config/nvim
```

# Windows:
```
git clone https://github.com/leet0rz/barebone-nvim $HOME\AppData\Local\nvim
```
Uncomment the following line under treesitter, inside the init.lua file:

```-- require('nvim-treesitter.install').compilers = { "zig" }```

Recommend using [zig](https://ziglang.org/download/) as a compiler for treesitter

You can also install zig via chocolatey:

```
choco install zig
```

# Plugins:
- modified moonlight.nvim
- nvim-autopairs
- nvim-comment
- telescope.nvim
- oil.nvim
- nvim-treesitter
- lualine.nvim
- mason.nvim
- nvim-lspconfig and friends

# Hotkeys:

### Feel free to rebind any of these to your liking

```
Ctrl + s: Save file
Ctrl + k: Move up 1 page  center screen
Ctrl + j: Move down 1 page and center screen
Alt + k: Move one or more lines up
Alt + J: Move one or more lines up
Space + +: Split right
Space + -: Split down
Space + h/j/k/l: Movement in the splits
Shift + Arrow keys: Resize splits
>: Indent selected text
<: Unindent selected text
Space + h: Remove search highlight


0=============================================================================================0
Lazy:
Space + l: Open Lazy

Telescope:
Space + ff: find files
Space + fg: live grep

Oil:
Space + o: run Oil

Commenting:
' - comment one or more lines
```

# Further developing your configuration
Example of how to add a new config, remember this goes inside of lazy, which starts on line 26:
```lua
require("lazy").setup({
    {
        -- GITHUB LINK GOES HERE:
        'github link goes here',

        -- CONFIGURE YOUR PLUGIN HERE
        config = function()
            require("github")
        end
    },
})
```
Try adding a different colorscheme and use the vim.cmd call to change it to something else. use `/` and search for moonlight to see how its been setup in `init.lua`
# 
