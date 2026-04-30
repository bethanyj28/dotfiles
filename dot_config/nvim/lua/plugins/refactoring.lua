return {
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      -- load refactoring Telescope extension
      require("telescope").load_extension("refactoring")

      vim.keymap.set(
        { "n", "x" },
        "<leader>rr",
        function() require("telescope").extensions.refactoring.refactors() end
      )
    end,
  },
}
