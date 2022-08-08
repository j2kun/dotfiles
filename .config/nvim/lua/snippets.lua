-- Configuration for vim-vsnip

-- Jump forward or backward in the snippet's fillable fields
vim.keymap.set({'i', 's'}, '<C-j>', function()
  return vim.fn['vsnip#jumpable'](1) == 1 and '<Plug>(vsnip-jump-next)' or '<C-j>'
end, { expr = true })

vim.keymap.set({'i', 's'}, '<C-k>', function()
  return vim.fn['vsnip#jumpable'](-1) == 1 and '<Plug>(vsnip-jump-prev)' or '<C-k>'
end, { expr = true })
