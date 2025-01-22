-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = augroup,
--   callback = function()
--     vim.lsp.buf.format { async = false }
--   end,
-- })
return {
  -- Настройка плагина conform.nvim для форматирования кода
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- Событие, при котором будет выполняться форматирование (перед сохранением буфера)
    config = function()
      require "configs.conform" -- Подключаем конфигурацию для conform.nvim
    end,
  },

  -- Примеры настройки других плагинов, раскомментируйте их, если хотите увидеть их работу
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults() -- Загружаем конфигурации по умолчанию для LSP
      require "configs.lspconfig" -- Подключаем дополнительные конфигурации для LSP
    end,
  },

  -- Настройка плагина mason.nvim для управления LSP серверами и инструментами
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server", -- LSP сервер для Lua
        "stylua", -- Форматтер для Lua
        "html-lsp", -- LSP сервер для HTML
        "css-lsp", -- LSP сервер для CSS
        "prettier", -- Форматтер для CSS и HTML
        "pyright", -- LSP сервер для Python
        -- "isort", -- Форматтер для Python (закомментировано)
        -- "black", -- Форматтер для Python (закомментировано)
        "tailwindcss-language-server", -- LSP сервер для Tailwind CSS
      },
    },
  },

  -- Настройка плагина nvim-treesitter для синтаксического анализа
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        enable = true,
        disable = {},
      },
      indent = {
        enable = true,
        disable = {},
      },
      autotag = {
        enable = true,
      },
      ensure_installed = {
        "vim", -- Поддержка Vim
        "lua", -- Поддержка Lua
        "vimdoc", -- Поддержка Vimdoc
        "html", -- Поддержка HTML
        "css", -- Поддержка CSS
        "python", -- Поддержка Python
        "javascript", -- Поддержка JavaScript
        "markdown", -- Поддержка Markdown
        "markdown_inline", -- Поддержка встроенного Markdown
        "tsx",
      },
    },
  },

  -- Настройка плагина dressing.nvim для улучшения интерфейса выбора
  {
    "stevearc/dressing.nvim",
    lazy = false, -- Отключаем ленивую загрузку
    opts = {},
  },

  -- Настройка плагина markdown.nvim для работы с Markdown
  -- {
  --   "MeanderingProgrammer/markdown.nvim",
  --   lazy = false, -- Отключаем ленивую загрузку
  --   name = "render-markdown", -- Имя плагина, необходимо только если у вас есть другой плагин с именем markdown.nvim
  --   dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- Зависимости, если вы используете mini.nvim suite
  --   -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- Зависимости, если вы используете standalone mini plugins
  --   -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- Зависимости, если вы предпочитаете nvim-web-devicons
  --   config = function()
  --     require("render-markdown").setup {} -- Настройка плагина markdown.nvim
  --   end,
  -- },

  -- Настройка плагина gtranslate.nvim для перевода текста
  {
    "kraftwerk28/gtranslate.nvim",
    lazy = false, -- Отключаем ленивую загрузку
    opts = {},
  },

  -- Установка плагина nvim-cmp для автодополнения
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require "configs.cmp"
    end,
  },
  -- Установка плагина lspkind
  -- {
  --   "onsails/lspkind-nvim",
  --   lazy = false, -- Отключаем ленивую загрузку
  -- },

  -- Установка плагина nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    lazy = false, -- Отключаем ленивую загрузку
  },
  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      require("leap").add_default_mappings(true)
    end,
  },
  -- Добавьте плагин nvim-snippets
  {
    "garymjr/nvim-snippets",
    after = "nvim-cmp",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load {}
    end,
  },
}
