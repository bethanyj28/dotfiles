return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzy-native.nvim", build = "make" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup {
				defaults = {
					mappings = {
						i = {
							['<C-j>'] = require('telescope.actions').move_selection_next,
							['<C-k>'] = require('telescope.actions').move_selection_previous,
						},
						n = {
							['jk'] = 'close',
						},
					},
				},
			}

			vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
			vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
			vim.keymap.set('n', '<leader>/', function()
				-- You can pass additional configuration to telescope to change theme, layout, etc.
				require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
					winblend = 0,
					previewer = false,
				})
			end, { desc = '[/] Fuzzily search in current buffer]' })

			vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
			vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
			vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
			vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
			vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
			vim.keymap.set('n', '<leader>km', require('telescope.builtin').keymaps, { desc = '[K]eymap [M]enu' })
			vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
			vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
			vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
			vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

			telescope.load_extension('fzy_native')
			telescope.load_extension('ui-select')
		end,
	}
}
