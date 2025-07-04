return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      window = {
        layout = 'float',
        width = 0.8,
        height = 0.8,
      },
      mappings = {
        complete = {
          detail = 'Use @<Tab> or /<Tab> for options.',
          insert = '<Tab>',
        },
        close = {
          normal = 'q',
          insert = '<C-c>'
        },
        reset = {
          normal = '<C-r>',
          insert = '<C-r>'
        },
        submit_prompt = {
          normal = '<CR>',
          insert = '<C-s>'
        },
      },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      local select = require("CopilotChat.select")
      
      chat.setup(opts)
      
      -- Telescope integration for UI selection
      local telescope = require("telescope")
      telescope.load_extension("ui-select")
      
      -- Key mappings
      vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChat<cr>", { desc = "CopilotChat - Open chat window" })
      vim.keymap.set("n", "<leader>cm", "<cmd>CopilotChatModels<cr>", { desc = "CopilotChat - Select model" })
      vim.keymap.set("n", "<leader>cp", "<cmd>CopilotChatPrompts<cr>", { desc = "CopilotChat - Select prompts" })
      vim.keymap.set("n", "<leader>ce", "<cmd>CopilotChatExplain<cr>", { desc = "CopilotChat - Explain code" })
      vim.keymap.set("n", "<leader>cr", "<cmd>CopilotChatReview<cr>", { desc = "CopilotChat - Review code" })
      vim.keymap.set("n", "<leader>cf", "<cmd>CopilotChatFix<cr>", { desc = "CopilotChat - Fix code" })
      vim.keymap.set("n", "<leader>co", "<cmd>CopilotChatOptimize<cr>", { desc = "CopilotChat - Optimize code" })
      vim.keymap.set("n", "<leader>cd", "<cmd>CopilotChatDocs<cr>", { desc = "CopilotChat - Generate docs" })
      vim.keymap.set("n", "<leader>cq", function()
        local input = vim.fn.input("Quick Chat: ")
        if input ~= "" then
          chat.ask(input, { selection = select.buffer })
        end
      end, { desc = "CopilotChat - Quick chat" })
      
      -- Visual mode mappings
      vim.keymap.set("v", "<leader>cc", "<cmd>CopilotChat<cr>", { desc = "CopilotChat - Open chat with selection" })
      vim.keymap.set("v", "<leader>ce", "<cmd>CopilotChatExplain<cr>", { desc = "CopilotChat - Explain selection" })
      vim.keymap.set("v", "<leader>cr", "<cmd>CopilotChatReview<cr>", { desc = "CopilotChat - Review selection" })
      vim.keymap.set("v", "<leader>cf", "<cmd>CopilotChatFix<cr>", { desc = "CopilotChat - Fix selection" })
      vim.keymap.set("v", "<leader>co", "<cmd>CopilotChatOptimize<cr>", { desc = "CopilotChat - Optimize selection" })
    end,
  },
}
