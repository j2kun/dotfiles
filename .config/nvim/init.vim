" required to allow nvim to work with python3 inside a virtualenv
let g:python3_host_prog="/home/j2kun/.config/nvim/venv/bin/python3"

call plug#begin(stdpath('data') . '/plugged')

Plug 'SirVer/ultisnips' 
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'honza/vim-snippets'
Plug 'knubie/vim-kitty-navigator'
Plug 'lervag/vimtex'
" gs to start function arg swap mode
Plug 'machakann/vim-swap'
Plug 'mechatroner/rainbow_csv'
Plug 'neovim/nvim-lspconfig'
Plug 'overcache/NeoSolarized'
Plug 'preservim/nerdtree'
Plug 'simrat39/rust-tools.nvim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

"  autocompletion, with spearate plugins for each source
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
" vsnip snippets for lots of languages
Plug 'rafamadriz/friendly-snippets'
Plug 'hrsh7th/nvim-cmp'

" Fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
" Allows Telescope to use neovim builtins, like `vim.lsp.buf.code_action()`
Plug 'nvim-telescope/telescope-ui-select.nvim'

call plug#end()

" Completion menu options
set completeopt=noinsert,menu,menuone,noselect

lua << EOF
require('language_server')
EOF


" <leader> = ,
let mapleader=","

" faster esc
inoremap jk <ESC>

" Jump to config
nnoremap <leader>ve :vsp $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>

" Tabs = 2 spaces
set tabstop=2           " number of visual spaces per TAB
set shiftwidth=2        " number of visual spaces per shift
set softtabstop=2       " number of spaces in tab when editing
set expandtab           " tabs are spaces

""" Misc UI config
colorscheme NeoSolarized
set background=dark
set cursorline          " highlight current line
set termguicolors       " terminal colors
set nohlsearch          " don't highlight searches after done
" use system clipboard
set clipboard=unnamed

""" Backup preferences
set backup
set backupdir=~/.cache/nvim/backup
set backupskip=~/.cache/*
set directory=~/.cache/nvim/swap
set writebackup
set undofile   " Maintain undo history between sessions
set undodir=~/.cache/nvim/undo

""" Session management
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_default_to_last = 'yes'
" Don't save hidden and unloaded buffers in sessions.
set sessionoptions-=buffers

""" Movement + selection config
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" highlight last inserted text
nnoremap gV `[v`]
" align text in current paragraph
nnoremap <leader>gq vipgq
" Sort and dedupe current paragraph by line
nnoremap <leader>s vip:sort u<CR>
" recommended by vim-stay
set viewoptions=cursor,folds,slash,unix

" relative numbers for focus + normal mode, absolute for all others
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" expand current path in command mode 
cabbr %% <C-R>=expand('%:p:h')<CR>

""" Plugin settings
" Ensure latex uses ftplugin/tex.vim for all .tex files
let g:tex_flavor = 'latex'

" telescope/fuzzy finder
nnoremap <c-p> <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope registers<cr>
nnoremap <leader>fj <cmd>Telescope jump_list<cr>
nnoremap <leader>fo <cmd>Telescope oldfiles<cr>
" to explore picker options, list them all in the fuzzy finder window
nnoremap <leader>fl <cmd>Telescope builtin<cr>
nnoremap <leader>m <cmd>Telescope marks<cr>

" Gitgutter
nmap <Leader>ha <Plug>(GitGutterStageHunk)
nmap <Leader>hr <Plug>(GitGutterUndoHunk)
nmap <Leader>gb :Gbrowse<CR>
vmap <Leader>gb :Gbrowse<CR>
set signcolumn=number
highlight clear SignColumn
let g:gitgutter_realtime = 1
let g:gitgutter_max_signs = 1000

" ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = [stdpath('data') . '/plugged' . '/vim-snippets/UltiSnips']


" vim-rooter
" for files not in a project, chroot to the directory containing the file
let g:rooter_change_directory_for_non_project_files = 'current'

" NERDtree
nnoremap <leader>t :NERDTreeToggle %<CR>
nnoremap <C-t> :NERDTreeToggle %<CR>

" Highlight LSP matches for variable names
autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()

" Vimscript practice
" make word upper case
nnoremap <leader>U viwU
" make word lower case
nnoremap <leader>u viwu
