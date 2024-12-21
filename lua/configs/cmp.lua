local cmp = require "cmp"
local lspkind = require "lspkind"
local luasnip = require "luasnip"

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert {
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4), -- Прокрутка документации вверх
    ["<C-f>"] = cmp.mapping.scroll_docs(4), -- Прокрутка документации вниз
    ["<C-Space>"] = cmp.mapping.complete(), -- Запуск автодополнения
    ["<C-e>"] = cmp.mapping.close(), -- Закрытие окна автодополнения
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace, -- Подтверждение выбора с заменой текущего текста
      select = true, -- Автоматически выбирать первый элемент в списке
    },
  },

  sources = cmp.config.sources {
    { name = "nvim_lsp" }, -- Использование LSP в качестве источника автодополнения
    { name = "buffer" }, -- Использование текущего буфера в качестве источника автодополнения
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },

  formatting = {
    format = lspkind.cmp_format {
      with_text = false, -- Не отображать текст рядом с пиктограммами
      maxwidth = 50, -- Максимальная ширина отображаемого текста
    },
  },
}
