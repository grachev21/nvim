-- Загружаем конфигурации по умолчанию для LSP, такие как lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- Подключаем модуль lspconfig для настройки LSP серверов
local lspconfig = require "lspconfig"

-- Пример настройки LSP серверов
local servers = { "html", "cssls", "pyright" } -- Список серверов LSP, которые будут настроены с конфигурацией по умолчанию

local nvlsp = require "nvchad.configs.lspconfig" -- Подключаем конфигурации LSP из nvchad

-- Настраиваем серверы LSP с конфигурацией по умолчанию
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach, -- Функция, вызываемая при присоединении клиента LSP
    on_init = nvlsp.on_init,     -- Функция, вызываемая при инициализации клиента LSP
    capabilities = nvlsp.capabilities, -- Возможности клиента LSP
  }
end

-- Пример настройки отдельного сервера LSP, например, для TypeScript
lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach, -- Функция, вызываемая при присоединении клиента LSP
  on_init = nvlsp.on_init,     -- Функция, вызываемая при инициализации клиента LSP
  capabilities = nvlsp.capabilities, -- Возможности клиента LSP
}


-- Настройка LSP для Tailwind CSS
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

