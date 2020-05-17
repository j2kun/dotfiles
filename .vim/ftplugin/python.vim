set tabstop=4           " number of visual spaces per TAB
set shiftwidth=4        " number of visual spaces per shift
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces

set formatprg=autopep8\ -

" reformat the entire file using autopep8
nnoremap ,=b gggqGgg
