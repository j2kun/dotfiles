-- Configs specific to airblade/vim-gitgutter

-- stage and undo the hunk under the cursor
vim.keymap.set('n', '<Leader>ha', '<Plug>(GitGutterStageHunk)')
vim.keymap.set('n', '<Leader>hr', '<Plug>(GitGutterUndoHunk)')

vim.opt.signcolumn = 'number' 
vim.cmd('highlight clear SignColumn')

vim.g.gitgutter_realtime = 1
vim.g.gitgutter_max_signs = 1000
