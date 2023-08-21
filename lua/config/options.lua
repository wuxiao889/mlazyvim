-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.cmd("hi LineNrAbove guifg=#cc6666 ctermfg=red")
vim.cmd("hi LineNrBelow guifg=#66cc66 ctermfg=green")
vim.cmd("hi Normal ctermbg=none")
vim.cmd("hi SignColumn ctermbg=none")
vim.cmd("hi VertSplit guifg=bg guibg=bg")

vim.g.mapleader = ","

vim.opt.wrap = true
vim.opt.ignorecase = false
vim.opt.swapfile = false
