return {
	-- Theme
	"p00f/alabaster.nvim",      -- Theme
	'nvim-treesitter/nvim-treesitter', -- AST
	'nvim-treesitter/playground', -- View Treesitter AST
	"HiPhish/nvim-ts-rainbow2", -- Rainbow parens

	-- LSP + Autocomplete
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	-- LSP Support
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
		}
	},

	-- Autocompletion
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{
		"hrsh7th/nvim-cmp",
	},
	{ 'saadparwaiz1/cmp_luasnip' },

	-- Copilot
	{
		"github/copilot.vim",
		lazy = false,
	},


	-- Formatters
	'stevearc/conform.nvim',

	-- Basics
	"tpope/vim-sleuth", -- Indent

	-- Lisp
	"Olical/conjure", -- REPL

	-- Misc
	"NoahTheDuke/vim-just", -- Build tool
	"folke/todo-comments.nvim", -- TODO: comments
	"nvim-lua/plenary.nvim", -- Lots of packages use as dep

	-- asciidoc
	{
		'tigion/nvim-asciidoc-preview',
		ft = { 'asciidoc' },
		-- opts = {},
	},
	-- Rest
	"rest-nvim/rest.nvim",

	-- F#
	{
		"ionide/Ionide-vim",
		ft = "fsharp",
		dependencies = {
			"neovim/nvim-lspconfig"
		}
	}
}
