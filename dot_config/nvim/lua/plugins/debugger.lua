return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("dapui").setup()
      local dap, dapui = require("dap"), require("dapui")
      vim.keymap.set("n", "<leader>dd", dap.continue)
      vim.keymap.set("n", "<leader>dl", dap.step_over)
      vim.keymap.set("n", "<leader>dj", dap.step_into)
      vim.keymap.set("n", "<leader>dk", dap.step_out)
      vim.keymap.set("n", "<leader>dh", dap.step_back)
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
}
