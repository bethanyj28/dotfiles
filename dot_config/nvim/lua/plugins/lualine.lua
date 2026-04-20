return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "catppuccin" },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = false,
          theme = "catppuccin-mocha",
          component_separators = "|",
          section_separators = "",
        },
      })
    end,
  },
}
