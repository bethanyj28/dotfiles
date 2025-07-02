return {
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({
        notify = false,
        auto_format = true,
        auto_lint = true,
        linter = "golangci-lint",
        linter_flags = {},
        lint_prompt_style = "qf",
        formatter = "goimports",
        maintain_cursor_pos = false,
        test_flags = { "-v" },
        test_timeout = "30s",
        test_env = {},
        test_popup = true,
        test_popup_auto_leave = false,
        test_popup_width = 80,
        test_popup_height = 10,
        test_open_cmd = "edit",
        tags_name = "json",
        tags_options = { "json=omitempty" },
        tags_transform = "snakecase",
        tags_flags = { "-skip-unexported" },
        quick_type_flags = { "--just-types" },
      })

      local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          require("go.format").goimport()
        end,
        group = format_sync_grp,
      })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
  },
}
