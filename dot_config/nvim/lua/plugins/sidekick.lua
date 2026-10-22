return {
  "folke/sidekick.nvim",
  opts = {
    -- Next Edit Suggestions need Copilot, which isn't used; keep just the AI CLI integration
    nes = { enabled = false },
    -- Configure CLI integration with tmux backend (tmux is already configured in this dotfiles)
    cli = {
      mux = {
        backend = "tmux",
        enabled = true,
      },
    },
  },
  keys = {
    {
      "<leader>af",
      function()
        require("sidekick.cli").focus()
      end,
      mode = { "n", "x", "i", "t" },
      desc = "Sidekick Switch Focus",
    },
    {
      "<leader>aa",
      function()
        require("sidekick.cli").toggle()
      end,
      desc = "Sidekick Toggle CLI",
      mode = { "n", "v" },
    },
    {
      "<leader>as",
      function()
        require("sidekick.cli").select()
      end,
      desc = "Sidekick Select CLI Tool",
      mode = { "n", "v" },
    },
  },
}
