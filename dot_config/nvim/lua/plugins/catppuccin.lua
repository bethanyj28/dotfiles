return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavor = "mocha",
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
