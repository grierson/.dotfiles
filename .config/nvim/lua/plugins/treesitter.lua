return {
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			{ "HiPhish/nvim-ts-rainbow2" }, -- Rainbow parens
		},
		config = function()
			-- vim.o.foldmethod = 'expr'
			-- vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"vimdoc",
					"lua",
					"clojure",
					"json",
					"yaml",
					"terraform",
					"dockerfile",
					"markdown",
					"bash",
				},
				auto_install = true,
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
				rainbow = {
					enable = true,
					query = 'rainbow-parens',
					strategy = require 'ts-rainbow.strategy.global'
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						node_incremental = '<TAB>',
						node_decremental = '<S-TAB>',
					},
				}
			})
		end,
	},
}
