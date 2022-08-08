local api = vim.api

-- Clear empty space at the end of lines
-- Individual files that want to omit this behvaior can re-define and clear the augroup
-- in the corresponding ftplugin/<filetype>.lua
local trimGroup = api.nvim_create_augroup("TrimEndOfLineWhitespace", { clear = true })
api.nvim_create_autocmd("BufWritePre", {
  command = ":%s/\\s\\+$//e",
  group = trimGroup,
})
