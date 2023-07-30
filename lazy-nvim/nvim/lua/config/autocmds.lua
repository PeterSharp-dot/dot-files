-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.cmd([[
  augroup BibleFileType
    autocmd!
    autocmd BufRead,BufNewFile *.bible set filetype=bible
    autocmd Syntax bible source ~/.config/nvim/syntax/bible.vim
    autocmd BufRead,BufNewFile *.bible set conceallevel=2
  augroup END
]])

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  command = "setlocal nospell",
})
