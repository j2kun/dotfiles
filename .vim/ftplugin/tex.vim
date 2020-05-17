set noautoindent
filetype indent off
set updatetime=1000
autocmd CursorHoldI,CursorHold,BufLeave,FocusLost silent! wall
set tw=79
set spell spelllang=en_us

let g:vimtex_imaps_leader = '@'
let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'process',
    \ 'background' : 1,
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk.pl',
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

" no need for this, as I run latexmk in the CLI with
" auto-run on file change.
let g:vimtex_compiler_latexmk = {'callback' : 0}

inoremap <C-r> \mathbb{R}
inoremap <C-z> \mathbb{Z}
