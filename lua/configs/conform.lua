local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    html = { "prettier" },
    css = { "prettier" },
    javascript = { "prettier" },
  },

  format_on_save = {
    timeout_ms = 5000,
    lsp_fallback = true,
  },

  formatters = {
    prettier = {
      command = "prettier",
    },
  },
}

require("conform").setup(options)
