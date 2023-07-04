return {
	-- add indentation guides
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require('indent_blankline').setup {
				char = '┊',
				show_trailing_blankline_indent = false,
			}
		end,
	},
	-- bulk comment
	{
		"numToStr/Comment.nvim",
		config = function()
			require('Comment').setup()
		end,
	},
}
