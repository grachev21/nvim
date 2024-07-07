require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<C-d>", "<cmd>e /home/grachev/disk/word_list.md<Enter>")
-- vim.keymap.set("n", "<C-,>", "<Cmd>e ~/home/grachev/disk/notes<Enter>")
