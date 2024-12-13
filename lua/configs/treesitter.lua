local ts = require "nvim-treesitter.configs"

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "css",
    "html",
    "javascript",
    "typescript",
    "tsx",
  },
  autotag = {
    enable = true,
  },
}

