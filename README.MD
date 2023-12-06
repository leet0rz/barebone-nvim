# barebone-nvim
barebone-nvim is meant to be the absolute bare minimum (in my opinion) of what
you need to launch your own config. This configuration is mostly boilerplate
code that you do not have to edit, you can when you get your bearings.

I tried making it with as much oversight as possible for newer users to see what
is what. Give it a try, open the `init.lua` file and scroll through. Hopefully
this will give some more understanding in terms of adding your own later.

![Screenshot](https://i.imgur.com/U0dQGnz.png)

# Why?
In our discord some users were having troubles understanding kickstart and I
wanted to try to create something that would fill that spot between complete
beginner and kickstart, have it act like a skeleton configuration to get people
going. This is still a work in progress, thank you.

# Requirements:
- [Neovim](https://github.com/neovim/neovim) stable or nightly -> check latest
  neovim releases.
- [Lua-language-server](https://github.com/LuaLS/lua-language-server) (Recommend
  manual installation, otherwise use mason with `:MasonInstall
  lua-language-server`) -> The language server needs to be in PATH.
- [Ripgrep](https://github.com/BurntSushi/ripgrep), also recommend installing
  [fzf](https://github.com/junegunn/fzf)
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

Recommend using [zig](https://ziglang.org/download/) as a compiler for
treesitter

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
Remaps for plugins:
0=============================================================================================0
Lazy:
Space + l: Open Lazy

Telescope:
Space + ff: find files
Space + fg: live grep

Oil:
Space + o: run Oil
Enter: open file/folder
-: Go to parent folder

Commenting:
' - comment one or more lines
```

# Further developing your configuration
### Modulizing
Try adding a lua folder where your init.lua is, then create a new file and put
remaps in that file then require it from your init.lua. Basically removing all
the remap configuration, placing it in `[THIS IS WHERE YOUR INIT.LUA
IS]/lua/remaps.lua` and then placing the command `require("remaps")` where your
remaps used to be. 

### Adding new plugins
[This](https://github.com/leet0rz/barebone-nvim/blob/main/init.lua#L127-L132) is
a plugin and here is an example of how to add a new plugin, remember this goes
inside of lazy, which starts on line 126:
```lua
require("lazy").setup({
    {
        -- whatever the github repo tells you to copy and paste goes here usually.
    },
})
```
Try adding a different colorscheme and use the vim.cmd call to change it to
something else. use `/` and search for moonlight to see how its been setup in
`init.lua`

### Adding new language servers
[This](https://github.com/leet0rz/barebone-nvim/blob/main/init.lua#L270-L291)
would be considered lua's language server call and config.
[here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
is a list of supported language server via lspconfig's repo, look them up before
trying to add a new server. Adding a new one would look something like this:
```lua
lspconfig.YOURSERVER.setup({
   on_attach = custom_attach,
   capabilities = capabilities
   COPY PASTE SERVER SETTINGS HERE
})
```
Just make sure its within the confines lpsconfig's `config = function()` and
`end`. Remember "lspconfig" is a variable: `local lspconfig =
require('lspconfig')`, on_attach is usually self-defined options or rules you
would like to apply to that language server while capabilities is just
additional capabilities from each of the servers.

### Adding new remaps
If you can think of a remap you would like, try adding a remap: Remember
`vim.keymap.set` is in a variable as `rm` just to make it easier to create
remaps. These are located beneath settings at the top of the `init.lua` file.
# Thanks for using barebone-nvim!
