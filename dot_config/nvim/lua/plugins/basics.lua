return {
	-- add indentation guides
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require('ibl').setup {
				indent = {
					char = '┊',
				}
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
