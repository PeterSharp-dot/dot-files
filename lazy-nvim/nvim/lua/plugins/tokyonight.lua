return {
  "folke/tokyonight.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    {
      -- use the night style
      style = "night",
      -- disable italic for functions
      styles = {
        functions = {},
      },
      -- Change the "hint" color to the "orange" color, and make the "error" color bright red
      on_colors = function(colors)
        colors.hint = colors.orange
        colors.error = "#ff0000"
        colors.white = "#647da3"
        colors.fg_dark = "#647da3"
      end,
    },
  },
}