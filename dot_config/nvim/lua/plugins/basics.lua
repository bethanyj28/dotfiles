return {
  -- add indentation guides
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup({
        indent = {
          char = "┊",
        },
      })
    end,
  },
}
