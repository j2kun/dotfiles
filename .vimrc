" Author: Jeremy Kun
" Repository: github.com/j2kun/dotfiles


"""" General settings """"

set nocompatible
execute pathogen#infect()
syntax enable
set background=dark
set autoindent
set backspace=indent,eol,start
colorscheme solarized
filetype plugin on
set autochdir

" Allow project-specific vimrc files
set exrc

" Global config
let mapleader=","
inoremap jk <ESC>

" remove annoying defaults
nnoremap Q <SPACE>

" Default spacing
set tabstop=4           " number of visual spaces per TAB
set shiftwidth=4        " number of visual spaces per shift
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces

" Misc UI Config
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching brackets
set incsearch           " search as characters are entered
set updatetime=250

" relative and absolute numbers
set number relativenumber

" relative numbers for focus + normal mode, absolute for all others
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"""" Movement, selection, search, and formatting """"

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

" align text in current paragraph
nnoremap <leader>gq vipgq

" reformat the entire buffer
" nnoremap <leader>=b mfgggqG`f
nnoremap <leader>=b :FormatCode<CR>


" Select next quickfix line
nnoremap <leader>n <C-W><C-J><CR>

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Sort and dedupe current paragraph by line
nnoremap <leader>s vip:sort u<CR>

" Go to the end of the import list
nnoremap <leader>i G?import<CR>

"""" Files and buffers """"

" edit vimrc and load vimrc bindings
nnoremap <leader>ve :vsp $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>

" Backup file preferences
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
set undofile   " Maintain undo history between sessions
set undodir=/tmp/

" use system clipboard
set clipboard=unnamed

" clean up whitespace
fun! StripTrailingWhitespace()
    " Only strip if the b:noStripWhitespace variable isn't set
    if exists('b:noStripWhitespace')
        return
    endif
    %s/\s\+$//e
endfun
autocmd BufWritePre * call StripTrailingWhitespace()

" Ensure latex uses ftplugin/tex.vim for all .tex files
let g:tex_flavor = 'latex'

"""" Plugins """"

" Ctrl-P
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|venv'
if executable('ag')
  " Use ag in CtrlP for listing files. Respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " let g:ctrlp_use_caching = 0
endif

" Gitgutter
nmap <Leader>ha <Plug>(GitGutterStageHunk)
nmap <Leader>hr <Plug>(GitGutterUndoHunk)
nmap <Leader>gb :Gbrowse<CR>
vmap <Leader>gb :Gbrowse<CR>
let g:gitgutter_realtime = 1

" Gundo
nnoremap <leader>u :GundoToggle<CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pycodestyle']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'
let g:syntastic_mode_map = { 'passive_filetypes': ['tex'] }

" vim-session
let g:session_default_overwrite = 1
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
let g:session_autosave_periodic = 1
let g:session_autosave_silent = 1

" ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips', '~/.vim/bundle/vim-snippets/UltiSnips']

" you complete me
" prevent autocomplete verbose statusline info
set shortmess+=c

"""" Local config """"

if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" prevent project-specific vimrc files from doing unsafe things
set secure
