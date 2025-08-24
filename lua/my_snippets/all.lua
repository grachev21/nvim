local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {

  -- Пример сниппета для "Hello, World!" в Lua
  s("hw_xxxx", {
    t 'print("Hello, #fff ',
    i(1, "World"),
    t '!")',
  }),

  s("css_color_light_primary_color", { t "#3498db" }),
  s("css_color_light_secondary_color", { t "#2ecc71" }),
  s("css_color_light_accent_color", { t "#e74c3c" }),
  s("css_color_light_background_color", { t "#f8f9fa" }),
  s("css_color_light_text_color", { t "#333333" }),
  s("css_color_light_text_inverse", { t "#ffffff" }),
  s("css_color_light_border_color", { t "#e0e0e0" }),
  s("css_color_light_error_color", { t "#ff5252" }),
  s("css_color_light_success_color", { t "#4caf50" }),
  s("css_color_light_warning_color", { t "#ff9800" }),

  s("css_color_dark_primary_color", { t "#aec06800" }),
  s("css_color_dark_secondary_color", { t "#2ecc71" }),
  s("css_color_dark_accent_color", { t "#e74c3c" }),
  s("css_color_dark_background_color", { t "#f8f9fa" }),
  s("css_color_dark_text_color", { t "#333333" }),
  s("css_color_dark_text_inverse", { t "#ffffff" }),
  s("css_color_dark_border_color", { t "#e0e0e0" }),
  s("css_color_dark_error_color", { t "#ff5252" }),
  s("css_color_dark_success_color", { t "#4caf50" }),
  s("css_color_dark_warning_color", { t "#ff9800" }),

  -- Пример сниппета для функции Lua
  s("func", {
    t "local function ",
    i(1, "name"),
    t "(",
    i(2, "args"),
    t ")",
    t { "", "\t" },
    i(3, "-- body"),
    t { "", "end" },
  }),
}
