return {
	"NeogitOrg/neogit",
	lazy = false,
	opts = {},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"sindrets/diffview.nvim",
	},
	keys = {
		{
			"<leader>g", "<cmd>Neogit<cr>", desc = "Neogit",
		},
	},
}
