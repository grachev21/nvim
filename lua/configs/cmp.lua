-- Подключаем модуль nvim-cmp для настройки автодополнения
local cmp = require "cmp"
-- Подключаем модуль lspkind для отображения пиктограмм в автодополнении
local lspkind = require "lspkind"

-- Настраиваем nvim-cmp
cmp.setup {
  -- Настройка сниппетов
  snippet = {
    -- Функция для расширения сниппетов
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- Используем luasnip для расширения сниппетов
    end,
  },

  -- Настройка сопоставлений клавиш
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4), -- Прокрутка документации вверх
    ['<C-f>'] = cmp.mapping.scroll_docs(4), -- Прокрутка документации вниз
    ['<C-Space>'] = cmp.mapping.complete(), -- Запуск автодополнения
    ['<C-e>'] = cmp.mapping.close(), -- Закрытие окна автодополнения
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace, -- Подтверждение выбора с заменой текущего текста
      select = true, -- Автоматически выбирать первый элемент в списке
    }),
  }),

  -- Настройка источников автодополнения
  sources = cmp.config.sources({
    { name = 'nvim_lsp' }, -- Использование LSP в качестве источника автодополнения
    { name = 'buffer' }, -- Использование текущего буфера в качестве источника автодополнения
  }),

  -- Настройка форматирования автодополнения
  formatting = {
    -- Форматирование с использованием lspkind для отображения пиктограмм
    format = lspkind.cmp_format({
      with_text = false, -- Не отображать текст рядом с пиктограммами
      maxwidth = 50, -- Максимальная ширина отображаемого текста
    })
  }
}

