return {
	"ionide/Ionide-vim",
	ft = "fsharp",
	dependencies = {
		"neovim/nvim-lspconfig"
	},
	opts = {
		on_attach = function(client, bufnr)
			vim.lsp.codelens.refresh()
		end,
	}
}
