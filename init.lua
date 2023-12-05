-- Error theme:
vim.cmd('colorscheme habamax')
--0=========================================================================0
-- █▀ █▀▀ ▀█▀ ▀█▀ █ █▄░█ █▀▀ █▀
-- ▄█ ██▄ ░█░ ░█░ █ █░▀█ █▄█ ▄█
--0=========================================================================0

-- Global Settings
vim.g.mapleader = ' '  -- Setting the leader key

-- Keymap Variables
local rm = vim.keymap.set

-- Terminal and Title Settings
vim.opt.title = true
vim.opt.titlestring = '%t'

-- Indentation and Formatting Settings
vim.opt.autoindent = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.tabstop = 4

-- Display Settings
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.lazyredraw = true
vim.opt.mouse = 'a'
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.syntax = 'enable'
vim.opt.timeoutlen = 300
vim.opt.wildmenu = true
vim.opt.wrap = false
vim.opt.completeopt = 'menuone,preview,noselect'
vim.opt.updatetime = 50
vim.opt.scrolloff = 5
vim.opt.signcolumn = 'yes'

-- List and Match Settings
vim.opt.list = true
vim.opt.listchars = { tab = "   ", leadmultispace = '│   ' }
vim.opt.showmatch = true

-- GUI and Encoding Settings
vim.opt.termguicolors = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.encoding = 'utf-8'

-- Search and Case Settings
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.smartindent = true

-- Line Number Settings
vim.opt.number = true

--0=========================================================================0
-- █▀█ █▀▀ █▀▄▀█ ▄▀█ █▀█ █▀
-- █▀▄ ██▄ █░▀░█ █▀█ █▀▀ ▄█
--0=========================================================================0
-- QOL:
-- Search centering
rm('n', 'n', 'nzz')
rm('n', 'N', 'Nzz')
-- Deleting letters going to vim.oid
rm('n', 'x', '"_x')
rm('v', 'x', '"_x')
-- format pasted line.
rm('n', 'p', 'p==')

-- page movement up/down
rm('n', '<C-k>', '<S-Up>zz')
rm('n', '<C-j>', '<S-Down>zz')
rm('v', '<C-k>', '<S-Up>zz')
rm('v', '<C-j>', '<S-Down>zz')
-- Save file
rm('n', '<C-s>', ':w<CR>')
-- Move selected lines with alt arrows like in subl
rm('v', '<A-k>', ":m '<-2<CR>gv=gv")
rm('v', '<A-j>', ":m '>+1<CR>gv=gv")
rm('n', '<A-k>', ':m .-2<cr>==')
rm('n', '<A-j>', ':m .+1<cr>==')
-- vertical split
rm('n', '<leader>+', '<Cmd>vsplit<CR>')
-- horizontal split
rm('n', '<leader>-', '<Cmd>split<CR>')
-- Move in splits with hjkl
rm('n', '<leader>h', '<Cmd>wincmd h<CR>')
rm('n', '<leader>j', '<Cmd>wincmd j<CR>')
rm('n', '<leader>k', '<Cmd>wincmd k<CR>')
rm('n', '<leader>l', '<Cmd>wincmd l<CR>')
rm('t', '<leader>h', '<Cmd>wincmd h<CR>')
rm('t', '<leader>j', '<Cmd>wincmd j<CR>')
rm('t', '<leader>k', '<Cmd>wincmd k<CR>')
rm('t', '<leader>l', '<Cmd>wincmd l<CR>')
-- Resize splits
rm('n', '<S-Left>', '<Cmd>vertical resize -2<CR>')
rm('n', '<S-Right>', '<Cmd>vertical resize +2<CR>')
rm('n', '<S-Up>', '<Cmd>resize -2<CR>')
rm('n', '<S-Down>', '<Cmd>resize +2<CR>')
-- Indent/Unindent selected text with Tab and Shift+Tab
rm('v', '>', '>gv')
rm('v', '<', '<gv')
-- Remove search HL
rm('n', '<leader>h', '<Cmd>nohlsearch<CR>')
--0=========================================================================0
-- █░░ ▄▀█ ▀█ █▄█
-- █▄▄ █▀█ █▄ ░█░
--0=========================================================================0
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim' -- Lazy bootstrap starts here
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)                                -- Ends here, this should be left alone.
--0=========================================================================0
-- █▀█ █░░ █░█ █▀▀ █ █▄░█ █▀   █▀ ▀█▀ ▄▀█ █▀█ ▀█▀   █░█ █▀▀ █▀█ █▀▀
-- █▀▀ █▄▄ █▄█ █▄█ █ █░▀█ ▄█   ▄█ ░█░ █▀█ █▀▄ ░█░   █▀█ ██▄ █▀▄ ██▄
--0=========================================================================0
require("lazy").setup({
    {
        "leet0rz/modified-moonlight.nvim", -- this is the theme
        config = function()
            vim.cmd("colorscheme moonlight") -- this applies the theme
        end
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end
    },
    {
        'terrortylor/nvim-comment',
        config = function()
            -- remaps
            rm('n', "'", ':CommentToggle<CR>')
            rm('v', "'", ':CommentToggle<CR>')
            require('nvim_comment').setup()
        end

    },
    --0=============================================================================================0
    -- ▀█▀ █▀▀ █░░ █▀▀ █▀ █▀▀ █▀█ █▀█ █▀▀
    -- ░█░ ██▄ █▄▄ ██▄ ▄█ █▄▄ █▄█ █▀▀ ██▄
    --0=============================================================================================0
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            -- remaps
            local builtin = require('telescope.builtin')
            rm('n', '<leader>ff', builtin.find_files)
            rm('n', '<leader>fg', builtin.live_grep)
            rm('n', '<leader>fb', builtin.buffers)
            rm('n', '<leader>fh', builtin.help_tags)
            -- telescope's setup
            require('telescope').setup {
                defaults = {
                    sorting_strategy = 'ascending',
                    layout_strategy = 'horizontal',
                    layout_config = {
                        horizontal = {
                            prompt_position = 'top',
                            preview_width = 0.5,
                            results_width = 0.5,
                            height = 0.5,
                            preview_cutoff = 120,
                        }
                    },
                },
            }
        end
    },
    --0=============================================================================================0
    -- █▀█ █ █░░
    -- █▄█ █ █▄▄
    --0=============================================================================================0
    {
        'stevearc/oil.nvim',
        config = function()
            -- remaps
            rm('n', '<leader>o', ':Oil<CR>')
            require('oil').setup({
                default_file_explorer = true,
                keymaps = {
                    ['<C-s>'] = ':w<CR>',
                },
                view_options = { show_hidden = true },
            })
        end
    },
    --0=============================================================================================0
    -- ▀█▀ █▀█ █▀▀ █▀▀ █▀ █░█ █ ▀█▀ ▀█▀ █▀▀ █▀█
    -- ░█░ █▀▄ ██▄ ██▄ ▄█ █▀█ █ ░█░ ░█░ ██▄ █▀▄
    --0=============================================================================================0
    {
        'nvim-treesitter/nvim-treesitter', 
        build = ":TSUpdate",
        config = function()
            -- ENABLES THIS IF USING WINDOWS:
            -- require('nvim-treesitter.install').compilers = { 'zig' }
            require('nvim-treesitter.configs').setup {
                ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query' },
                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,
                -- Automatically install missing parsers when entering buffer
                auto_install = false,
                highlight = {
                    enable = true,
                },
            }
        end
    },
    --0=============================================================================================0
    -- █░░ █░█ ▄▀█ █░░ █ █▄░█ █▀▀
    -- █▄▄ █▄█ █▀█ █▄▄ █ █░▀█ ██▄
    --0=============================================================================================0
    {
    'nvim-lualine/lualine.nvim',
    config = function()
        vim.o.showmode = false
        require('lualine').setup({
            options = {
                icons_enabled = true,
                -- theme = 'dracula',
            },
            -- this part shows full path, helps navigate in Oil.
            sections = {
                lualine_c = { { 'filename', path = 2 } }
            }
        })
    end
    },

    --0=============================================================================================0
    -- █▀▄▀█ ▄▀█ █▀ █▀█ █▄░█
    -- █░▀░█ █▀█ ▄█ █▄█ █░▀█    
    --0=============================================================================================0
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end
    },
    --0=============================================================================================0
    -- █░░ █▀ █▀█
    -- █▄▄ ▄█ █▀▀
    --0=============================================================================================0
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require('lspconfig')
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
            local custom_attach = function(client, bufnr)
                print('Lsp Attached.')
            end
            --0=============================================================================================0
            -- █░░ █░█ ▄▀█
            -- █▄▄ █▄█ █▀█
            --0=============================================================================================0
            lspconfig.lua_ls.setup ({
                on_attach = custom_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            enable = true,
                            -- enable = false,
                        },
                        workspace = {
                            checkThirdParty = false,
                            library = {
                              vim.env.VIMRUNTIME,
                            },
                        },
                        telemetry = { enable = false },
                    },
                },
            })
            -- new server goes here:
            -- lspconfig.SERVER.setup({
            --    on_attach = custom_attach,
            --    capabilities = capabilities
            --    COPY PASTE SERVER SETTINGS HERE
            --})
        end
    },
    --0=============================================================================================0
    -- █▀▀ █▀▄▀█ █▀█
    -- █▄▄ █░▀░█ █▀▀
    --0=============================================================================================0
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
            -- Other:
            'hrsh7th/cmp-path',
        },
        config = function()
            local cmp = require('cmp')
            local cmp_ap = require('nvim-autopairs.completion.cmp')
            local luasnip = require('luasnip')
            luasnip.config.setup {}
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered()
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'path' },
                }),
            })
            -- bracket completion for lua
            cmp.event:on(
                'confirm_done',
                cmp_ap.on_confirm_done()
            )
        end
    },
})
--0=========================================================================0
-- █▀█ █░░ █░█ █▀▀ █ █▄░█ █▀   █▀▀ █▄░█ █▀▄   █░█ █▀▀ █▀█ █▀▀
-- █▀▀ █▄▄ █▄█ █▄█ █ █░▀█ ▄█   ██▄ █░▀█ █▄▀   █▀█ ██▄ █▀▄ ██▄
--0=========================================================================0
--0=========================================================================0
-- ▄▀█ █░█ ▀█▀ █▀█ █▀▀ █▀▄▀█ █▀▄
-- █▀█ █▄█ ░█░ █▄█ █▄▄ █░▀░█ █▄▀
--0=========================================================================0
-- Highlight yanked text for 150ms
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end
})
