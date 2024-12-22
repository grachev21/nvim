-- custom/configs/null-ls.lua
local null_ls = require "null-ls"

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.prettier.with {
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "json",
        "css",
        "scss",
        "less",
        "html",
        "vue",
        "svelte",
      },
    },
  },
}
