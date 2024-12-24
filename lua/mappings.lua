require "nvchad.mappings"
local opts = { noremap = true, silent = true }
-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("v", "<leader>te", ":Translate English<CR>", opts)
map("v", "<leader>tr", ":Translate Russian<CR>", opts)
map("n", "<leader>ln", ":e /home/grachev/Disk/notes/<CR>", opts)
-- init.lua или mappings.lua

-- Настройка сочетаний клавиш для vim-bookmarks
vim.g.bookmark_auto_save = 1
vim.g.bookmark_auto_save_file = vim.fn.expand "~/.config/nvim/bookmarks"

-- Настройка сочетаний клавиш для vim-bookmarks
vim.g.bookmark_auto_save = 1
vim.g.bookmark_auto_save_file = vim.fn.expand "~/.config/nvim/bookmarks"
