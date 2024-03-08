-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set = vim.keymap.set

set("i", "jk", "<Esc>", { desc = "jk to escqpe" })
set("i", "kj", "<Esc>", { desc = "kj to escqpe" })

set("n", "<leader>sv", ":luafile ~/.config/nvim/init.lua<Cr>", { desc = "source config" })
set("n", "<leader>ev", ":e $MYVIMRC<Cr>", { desc = "edit config" })
set("n", "<leader>el", ":e ~/.local/share/nvim/lazy/LazyVim/init.lua<Cr>", { desc = "lazyvim config" })
