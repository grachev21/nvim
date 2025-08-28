vim.cmd [[
  augroup DjangoTemplates
    autocmd!
    autocmd BufNewFile,BufRead *.html set filetype=htmldjango
  augroup END
]]

-- Установите treesitter для htmldjango
vim.treesitter.language.register("html", "htmldjango")
