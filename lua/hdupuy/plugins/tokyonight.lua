-- Lua

require("tokyonight").setup({
  style = "night",
  light_style = "day",
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true, bold = true },
    keywords = { italic = true, bold = true },
    string   = { italic = true },
    functions = {},
    variables = {},
    sidebars = "dark",
    floats = "dark",
  },
  sidebars = { "qf", "help" },
  day_brightness = 0.3,
  hide_inactive_statusline = false,
  dim_inactive = false,
  lualine_bold = false,

  -- additional parameters
  background = "#000000",
  foreground = "#FFFFFF",
  highlight = "#FF0000",
  cursor = "#00FF00",
  color_palette = {
    comments = "#0000FF",
    keywords = "#00FF00",
    string = "#FF00FF",
    functions = "#00FFFF",
    variables = "#FFFF00"
  }
})

vim.cmd[[colorscheme oxocarbon]]
