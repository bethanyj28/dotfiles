return {
	{
		"ray-x/go.nvim",
		dependencies = {  -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup({
				-- notify: use nvim-notify
				notify = false,
				-- auto commands
				auto_format = true,
				auto_lint = true,
				-- linters: revive, errcheck, staticcheck, golangci-lint
				linter = 'golangci-lint',
				-- linter_flags: e.g., {revive = {'-config', '/path/to/config.yml'}}
				linter_flags = {},
				-- lint_prompt_style: qf (quickfix), vt (virtual text)
				lint_prompt_style = 'qf',
				-- formatter: goimports, gofmt, gofumpt, lsp
				formatter = 'goimports',
				-- maintain cursor position after formatting loaded buffer
				maintain_cursor_pos = false,
				-- test flags: -count=1 will disable cache
				test_flags = {'-v'},
				test_timeout = '30s',
				test_env = {},
				-- show test result with popup window
				test_popup = true,
				test_popup_auto_leave = false,
				test_popup_width = 80,
				test_popup_height = 10,
				-- test open
				test_open_cmd = 'edit',
				-- struct tags
				tags_name = 'json',
				tags_options = {'json=omitempty'},
				tags_transform = 'snakecase',
				tags_flags = {'-skip-unexported'},
				-- quick type
				quick_type_flags = {'--just-types'},
			})
      
      local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          require('go.format').goimport()
        end,
        group = format_sync_grp,
      })
		end,
		event = {"CmdlineEnter"},
		ft = {"go", 'gomod'},
		build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
	}
}
