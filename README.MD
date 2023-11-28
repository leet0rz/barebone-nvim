# barebone-nvim
barebone-nvim is meant to be the absolute bare minimum (in my opinion) of what you need to launch your own config. 

I tried making it with as much oversight as possible for newer users to see what lets say the Oil plugin looks like and where it starts and where it ends. Hopefully this will give some more understanding in terms of adding your own later, same with settings, remaps, plugin remaps and autocmds below.

![Screenshot](https://i.imgur.com/hb2RNzX.png)

# Why?
People were having issues with kickstart and customizing it and I wanted to try to create something that would fill that spot between complete beginner and kickstart, even more barebone, as a skeleton configuration to get people going. This is still a work in progress, thank you.

# Requirements:
- [Neovim](https://github.com/neovim/neovim) stable or nightly -> check latest neovim releases.
- [Lua-language-server](https://github.com/LuaLS/lua-language-server) (Manually or via mason with `:MasonInstall`) -> The language server needs to be in PATH.
- [Ripgrep](https://github.com/BurntSushi/ripgrep), also recommend installing [fzf](https://github.com/junegunn/fzf)
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
0=============================================================================================0
Remaps:
0=============================================================================================0
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
Plugin remaps:
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
### Modulizing
Try adding a lua folder where your init.lua is, then create a new file and put remaps in that file then require it from your init.lua

### Adding new plugins
Example of how to add a new plugin, remember this goes inside of lazy, which starts on line 26:
```lua
require("lazy").setup({
    {
        -- whatever the github repo tells you to copy and paste goes here usually.
    },
})
```
Try adding a different colorscheme and use the vim.cmd call to change it to something else. use `/` and search for moonlight to see how its been setup in `init.lua`


### Adding new remaps

After that try adding a remap, remember `vim.keymap.set` is in a variable as `rm` just to make it easier to create remaps.
# Thanks for using barebone-nvim!
