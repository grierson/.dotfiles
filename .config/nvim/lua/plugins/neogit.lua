return {
	"NeogitOrg/neogit",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"sindrets/diffview.nvim",
	},
	config = function()
		require("neogit").setup()
	end,
	keys = {
		{
			"<leader>g",
			"<cmd>Neogit<cr>",
			{ desc = "Neogit" },
		},
	},
}
