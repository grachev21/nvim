require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
vim.wo.number = false

-- Включить перенос строк
vim.o.wrap = true

-- Настроить перенос строк по словам
vim.o.linebreak = true

-- Настроить отступы для переноса строк
vim.o.showbreak = "                           ↪\\ "
