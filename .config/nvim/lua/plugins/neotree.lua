return {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = false,
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup()
	end,
	keys = {
		{ '<Leader>t',  "<cmd>Neotree focus right<cr>" },
		{ '<Leader>T',  "<cmd>Neotree toggle right<cr>" },
		{ "<Leader>wf", "<cmd>Neotree reveal<cr>",      "File" }
	},
}
