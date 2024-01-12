return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	config = function()
		require("gitsigns").setup()
	end,
	keys = {
		{
			"<leader>hr",
			"<cmd>Gitsigns reset_hunk<cr>",
			{ desc = "Reset hunk" },
		},
		{
			"<leader>hp",
			"<cmd>Gitsigns preview_hunk<cr>",
			{ desc = "Preview hunk" },
		},
		{
			"[h",
			"<cmd>Gitsigns prev_hunk<cr>",
			{ desc = "Prev hunk" },
		},
		{
			"]h",
			"<cmd>Gitsigns next_hunk<cr>",
			{ desc = "Next hunk" },
		},
	}
}
