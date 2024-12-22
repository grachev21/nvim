require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- init.lua или mappings.lua

-- Настройка сочетаний клавиш для vim-bookmarks
vim.g.bookmark_auto_save = 1
vim.g.bookmark_auto_save_file = vim.fn.expand "~/.config/nvim/bookmarks"

local map = vim.keymap.set

-- Создание метки
map("n", "<leader>ma", "<Plug>BookmarkToggle", { desc = "Toggle bookmark" })

-- Переход к следующей метке
map("n", "<leader>mn", "<Plug>BookmarkNext", { desc = "Go to next bookmark" })

-- Переход к предыдущей метке
map("n", "<leader>mp", "<Plug>BookmarkPrev", { desc = "Go to previous bookmark" })

-- Просмотр всех меток
map("n", "<leader>ml", "<Plug>BookmarkListAll", { desc = "Show all bookmarks" })
