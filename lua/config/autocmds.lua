-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.cmd("hi LineNrAbove guifg=#cc6666 ctermfg=red")
vim.cmd("hi LineNrBelow guifg=#66cc66 ctermfg=green")
vim.cmd("hi Normal ctermbg=none")
vim.cmd("hi SignColumn ctermbg=none")
vim.cmd("hi VertSplit guifg=none guibg=none")
