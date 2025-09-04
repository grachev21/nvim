local lspconfig = require "lspconfig"

local servers = {
  "html",
  "cssls",
  "emmet_ls",
  "ts_ls", -- JavaScript/TypeScript
  "jsonls",
  "emmet_ls",
  "jedi_language_server", -- Добавляем Jedi LSP
}

local nvlsp = require "nvchad.configs.lspconfig"

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- Специфическая настройка для Jedi Language Server
lspconfig.jedi_language_server.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  settings = {
    jedi = {
      completion = {
        disableSnippets = false,
      },
      diagnostics = {
        enable = true,
      },
      workspace = {
        extraPaths = {},
      },
    },
  },
}

lspconfig.html.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "html", "htmldjango" },
}

lspconfig.cssls.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      },
    },
    scss = {
      validate = true,
    },
  },
}

lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
}

lspconfig.tailwindcss.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
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
