return {
	{
		"github/copilot.vim",
		lazy = false,
	},
	{
		"folke/todo-comments.nvim", -- TODO: hello
		opts = {}
	},
	"tpope/vim-sleuth", -- Indent
	{
		"NoahTheDuke/vim-just",
		ft = { 'just' },
	},
	{
		'tigion/nvim-asciidoc-preview',
		ft = { 'asciidoc' },
	},
	{
		"rest-nvim/rest.nvim",
		ft = { 'http' },
		keys = {
			{
				"<leader>h",
				"<cmd>lua require('rest-nvim').run()<cr>",
				{ "n" },
				desc = "HTTP"
			},
		}
	}
}
