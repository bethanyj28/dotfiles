return {
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("barbar").setup({
        animation = true,
        insert_at_start = true,
        maximum_padding = 1,
        maximum_length = 30,
        semantic_letters = true,
        letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
        no_name_title = nil,
      })

      -- Buffer navigation
      vim.keymap.set("n", "<leader>bp", "<Cmd>BufferPrevious<CR>", { desc = "Previous buffer" })
      vim.keymap.set("n", "<leader>bn", "<Cmd>BufferNext<CR>", { desc = "Next buffer" })
      
      -- Buffer management
      vim.keymap.set("n", "<leader>bc", "<Cmd>BufferClose<CR>", { desc = "Close buffer" })
      vim.keymap.set("n", "<leader>bC", "<Cmd>BufferCloseAllButCurrent<CR>", { desc = "Close all but current" })
      vim.keymap.set("n", "<leader>bP", "<Cmd>BufferPin<CR>", { desc = "Pin buffer" })
      
      -- Buffer reordering
      vim.keymap.set("n", "<leader>b<", "<Cmd>BufferMovePrevious<CR>", { desc = "Move buffer left" })
      vim.keymap.set("n", "<leader>b>", "<Cmd>BufferMoveNext<CR>", { desc = "Move buffer right" })
      
      -- Go to buffer by number
      vim.keymap.set("n", "<leader>1", "<Cmd>BufferGoto 1<CR>", { desc = "Go to buffer 1" })
      vim.keymap.set("n", "<leader>2", "<Cmd>BufferGoto 2<CR>", { desc = "Go to buffer 2" })
      vim.keymap.set("n", "<leader>3", "<Cmd>BufferGoto 3<CR>", { desc = "Go to buffer 3" })
      vim.keymap.set("n", "<leader>4", "<Cmd>BufferGoto 4<CR>", { desc = "Go to buffer 4" })
      vim.keymap.set("n", "<leader>5", "<Cmd>BufferGoto 5<CR>", { desc = "Go to buffer 5" })
      vim.keymap.set("n", "<leader>6", "<Cmd>BufferGoto 6<CR>", { desc = "Go to buffer 6" })
      vim.keymap.set("n", "<leader>7", "<Cmd>BufferGoto 7<CR>", { desc = "Go to buffer 7" })
      vim.keymap.set("n", "<leader>8", "<Cmd>BufferGoto 8<CR>", { desc = "Go to buffer 8" })
      vim.keymap.set("n", "<leader>9", "<Cmd>BufferGoto 9<CR>", { desc = "Go to buffer 9" })
      vim.keymap.set("n", "<leader>0", "<Cmd>BufferLast<CR>", { desc = "Go to last buffer" })
      
      -- Magic buffer-picking mode
      vim.keymap.set("n", "<leader>bb", "<Cmd>BufferPick<CR>", { desc = "Pick buffer" })
    end,
    version = "^1.0.0",
  },
}