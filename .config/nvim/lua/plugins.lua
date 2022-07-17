local Plug = vim.fn['plug#']

vim.call('plug#begin', vim.fn.stdpath("data") .. '/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'honza/vim-snippets'
Plug 'knubie/vim-kitty-navigator'
Plug 'lervag/vimtex'

-- gs to start function arg swap mode
Plug 'machakann/vim-swap'
Plug 'mechatroner/rainbow_csv'
Plug 'overcache/NeoSolarized'
Plug 'preservim/nerdtree'
Plug 'simrat39/rust-tools.nvim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

Plug 'neovim/nvim-lspconfig'

-- autocompletion, with spearate plugins for each source
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-calc'
Plug 'kdheepak/cmp-latex-symbols'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'

-- vsnip snippets for lots of languages
Plug 'rafamadriz/friendly-snippets'

-- Fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
-- Allows Telescope to use neovim builtins, like `vim.lsp.buf.code_action()`
Plug 'nvim-telescope/telescope-ui-select.nvim'

vim.call('plug#end')
