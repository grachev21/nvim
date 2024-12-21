-- -- Подключаем модуль nvim-cmp для настройки автодополнения
-- local cmp = require "cmp"
-- -- Подключаем модуль lspkind для отображения пиктограмм в автодополнении
-- local lspkind = require "lspkind"
--
-- -- Настраиваем nvim-cmp
-- cmp.setup {
--   -- Настройка сниппетов
--   snippet = {
--     -- Функция для расширения сниппетов
--     expand = function(args)
--       require("luasnip").lsp_expand(args.body) -- Используем luasnip для расширения сниппетов
--     end,
--   },
--
--   -- Настройка сопоставлений клавиш
--   mapping = cmp.mapping.preset.insert {
--     ["<C-d>"] = cmp.mapping.scroll_docs(-4), -- Прокрутка документации вверх
--     ["<C-f>"] = cmp.mapping.scroll_docs(4), -- Прокрутка документации вниз
--     ["<C-Space>"] = cmp.mapping.complete(), -- Запуск автодополнения
--     ["<C-e>"] = cmp.mapping.close(), -- Закрытие окна автодополнения
--     ["<CR>"] = cmp.mapping.confirm {
--       behavior = cmp.ConfirmBehavior.Replace, -- Подтверждение выбора с заменой текущего текста
--       select = true, -- Автоматически выбирать первый элемент в списке
--     },
--   },
--
--   -- Настройка источников автодополнения
--   sources = cmp.config.sources {
--     { name = "nvim_lsp" }, -- Использование LSP в качестве источника автодополнения
--     { name = "buffer" }, -- Использование текущего буфера в качестве источника автодополнения
--   },
--
--   -- Настройка форматирования автодополнения
--   formatting = {
--     -- Форматирование с использованием lspkind для отображения пиктограмм
--     format = lspkind.cmp_format {
--       with_text = false, -- Не отображать текст рядом с пиктограммами
--       maxwidth = 50, -- Максимальная ширина отображаемого текста
--     },
--   },
-- }
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
local cmp = require "cmp"

cmp.setup {
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<S-CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
  }),
}
