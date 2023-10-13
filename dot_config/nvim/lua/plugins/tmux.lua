return {
	{
  	"aserowy/tmux.nvim",
		event = "BufEnter",
  	config = function()
			require("tmux").setup()
		end,
	}
}
