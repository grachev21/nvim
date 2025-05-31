-- Определение локальной таблицы options
local options = {

  -- Настройки базовой темы
  base46 = {
    theme_toggler = false, -- Отключает переключатель темы
    theme = "onedark",     -- тема по умолчанию
    hl_add = {},           -- дополнительные настройки подсветки
    hl_override = {},      -- переопределение настроек подсветки
    integrations = {},     -- интеграции
    changed_themes = {},   -- измененные темы
    transparency = true,   -- прозрачность
  },

  -- Настройки пользовательского интерфейса
  ui = {
    cmp = {
      icons_left = false, -- только для не-atom стилей!
      style = "default", -- стиль: default/flat_light/flat_dark/atom/atom_colored
      format_colors = {
        tailwind = false, -- будет работать для css lsp тоже
        icon = "󱓻", -- иконка
      },
    },

    telescope = { style = "borderless" }, -- стиль: borderless / bordered

    statusline = {
      enabled = true,    -- включена ли строка состояния
      theme = "default", -- тема: default/vscode/vscode_colored/minimal
      -- default/round/block/arrow separators работают только для темы строки состояния по умолчанию
      -- round и block будут работать только для минимальной темы
      separator_style = "default", -- стиль разделителя
      order = nil,                 -- порядок элементов
      modules = nil,               -- модули
    },

    -- ленивая загрузка, когда есть 1+ буферов
    tabufline = {
      enabled = true,                                      -- включена ли строка вкладок
      lazyload = true,                                     -- ленивая загрузка
      order = { "treeOffset", "buffers", "tabs", "btns" }, -- порядок элементов
      modules = nil,                                       -- модули
    },
  },

  -- Настройки стартового экрана
  nvdash = {
    load_on_startup = true, -- загружать ли при старте
    header = {
      "                            ",
      "     ▄▄         ▄ ▄▄▄▄▄▄▄   ",
      "   ▄▀███▄     ▄██ █████▀    ",
      "   ██▄▀███▄   ███           ",
      "   ███  ▀███▄ ███           ",
      "   ███    ▀██ ███           ",
      "   ███      ▀ ███           ",
      "   ▀██ █████▄▀█▀▄██████▄    ",
      "     ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀   ",
      "                            ",
      "     Powered By  eovim    ",
      "                            ",
    },

    buttons = {
      { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
      { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
      { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
      { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
      { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },

      { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

      {
        txt = function()
          local stats = require("lazy").stats()
          local ms = math.floor(stats.startuptime) .. " ms"
          return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
        end,
        hl = "NvDashFooter",
        no_gap = true,
      },

      { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
    },
  },

  -- Настройки терминала
  term = {
    winopts = { number = false, relativenumber = false },               -- опции окна
    sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 }, -- размеры
    float = {
      relative = "editor",                                              -- относительно редактора
      row = 0.3,                                                        -- строка
      col = 0.25,                                                       -- колонка
      width = 0.5,                                                      -- ширина
      height = 0.4,                                                     -- высота
      border = "single",                                                -- граница
    },
  },

  lsp = { signature = true }, -- настройки LSP

  cheatsheet = {
    theme = "grid",                                                     -- тема: simple/grid
    excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- исключенные группы
  },

  mason = { pkgs = {}, skip = {} }, -- настройки Mason

  colorify = {
    enabled = true, -- включена ли цветовая подсветка
    mode = "virtual", -- режим: fg, bg, virtual
    virt_text = "󱓻 ", -- виртуальный текст
    highlight = { hex = true, lspvars = true }, -- подсветка
  },
}

-- Загрузка конфигурации chadrc
local status, chadrc = pcall(require, "chadrc")
-- Возвращение объединенной таблицы options и chadrc
return vim.tbl_deep_extend("force", options, status and chadrc or {})
