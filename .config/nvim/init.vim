" required to allow nvim to work with python3 inside a virtualenv
let g:python3_host_prog=$HOME."/.config/nvim/venv/bin/python3"

" Completion menu options
set completeopt=noinsert,menu,menuone,noselect

" Lua modules loaded by require('FOO') are in lua/FOO.lua
lua << EOF
require('plugins')
require('treesitter')
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
set notermguicolors     " disable terminal GUI colors
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
nnoremap <leader>fs <cmd>Telescope grep_string<cr>
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

" Snippets
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

" vim-rooter
" for files not in a project, chroot to the directory containing the file
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_targets = '*.py,*.java,*.proto,BUILD'

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

if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif
