-- required to allow nvim to work with python3 inside a virtualenv
-- Should be set before plugins are loaded
vim.g.python3_host_prog="$HOME" .. "/.config/nvim/venv/bin/python3"

vim.g.mapleader = ","

-- Tabs = 2 spaces
vim.opt.expandtab = true   -- tabs are spaces
vim.opt.shiftwidth = 2     -- number of visual spaces per shift
vim.opt.softtabstop = 2    -- number of spaces in tab when editing
vim.opt.tabstop = 2        -- number of visual spaces per TAB

-- Misc UI config
vim.cmd("colorscheme NeoSolarized")
vim.opt.background = "dark"
vim.opt.clipboard = "unnamed"  -- use system clipboard
vim.opt.completeopt = {"noinsert", "menu", "menuone", "noselect"}
vim.opt.cursorline = true      -- highlight current line
vim.opt.hlsearch = false       -- don't highlight searches after done
vim.opt.number = true          -- enable line numbers in the left margin
vim.opt.relativenumber = true  -- enable relative line numbers in the left margin
vim.opt.termguicolors = true   -- enable terminal GUI colors, required for NeoSolarized

--- Backup preferences
vim.opt.backup = true
vim.opt.backupdir = vim.fn.expand("~/.cache/nvim/backup")
vim.opt.backupskip = vim.fn.expand("~/.cache/*")
vim.opt.directory = vim.fn.expand("~/.cache/nvim/swap")
vim.opt.undodir = vim.fn.expand("~/.cache/nvim/undo")
vim.opt.undofile = true   -- Maintain undo history between sessions
vim.opt.writebackup = true

--- Session management
vim.g.session_autosave = 'yes'
vim.g.session_autoload = 'yes'
vim.g.session_default_to_last = 'yes'
vim.opt.sessionoptions:remove { "buffers" }

-- Ensure latex uses ftplugin/tex.vim for all .tex files
vim.g.tex_flavor = 'latex'
