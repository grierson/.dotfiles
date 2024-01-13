return {
	"p00f/alabaster.nvim", -- Theme
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme('alabaster')
		vim.o.termguicolors = true
		vim.o.background = "light"
	end
}
