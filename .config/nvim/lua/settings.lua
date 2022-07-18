
vim.g.mapleader = ","

-- Tabs = 2 spaces
vim.opt.expandtab = true   -- tabs are spaces
vim.opt.shiftwidth = 2     -- number of visual spaces per shift
vim.opt.softtabstop = 2    -- number of spaces in tab when editing
vim.opt.tabstop = 2        -- number of visual spaces per TAB


-- Misc UI config
vim.opt.background = "dark"
vim.opt.clipboard = "unnamed"  -- use system clipboard
vim.opt.cursorline = true      -- highlight current line
vim.opt.hlsearch = false       -- don't highlight searches after done
vim.opt.termguicolors = true   -- enable terminal GUI colors, required for NeoSolarized


--- Backup preferences
vim.opt.backup = true
vim.opt.backupdir = "~/.cache/nvim/backup"
vim.opt.backupskip = "~/.cache/*"
vim.opt.directory = "~/.cache/nvim/swap"
vim.opt.undodir = "~/.cache/nvim/undo"
vim.opt.undofile = true   -- Maintain undo history between sessions
vim.opt.writebackup = true
