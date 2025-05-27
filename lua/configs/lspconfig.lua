require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { "html", "cssls" }

local nvlsp = require "nvchad.configs.lspconfig"

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.pylsp.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  settings = {
    pylsp = {
      plugins = {
        jedi = {
          enabled = true,
          extra_dummies = "",
        },
      },
    },
  },
}

lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
}

lspconfig.tailwindcss.setup {
  on_attach = require("nvchad.configs.lspconfig").on_attach,
  on_init = require("nvchad.configs.lspconfig").on_init,
  capabilities = require("nvchad.configs.lspconfig").capabilities,
  settings = {
    tailwindCSS = {
      validate = true,
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwindDirective = "error",
        invalidVariant = "error",
        recommendedVariantOrder = "warning",
      },
    },
  },
}
