-- Configuration for vim-vsnip

-- Jump forward or backward in the snippet's fillable fields
-- Note this may conflict with the mappings in cmp-nvim, if Tab/S-Tab is used
-- to navigate the menu of completion options.
vim.keymap.set({'i', 's'}, '<Tab>', function()
  return vim.fn['vsnip#jumpable'](1) == 1 and '<Plug>(vsnip-jump-next)' or '<Tab>'
end, { expr = true })

vim.keymap.set({'i', 's'}, '<S-Tab>', function()
  return vim.fn['vsnip#jumpable'](-1) == 1 and '<Plug>(vsnip-jump-prev)' or '<S-Tab>'
end, { expr = true })
