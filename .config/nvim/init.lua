vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.tabstop = 4

-- Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- Theme
vim.o.termguicolors = true
vim.o.background = "light"
vim.cmd.colorscheme('alabaster')
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.colorcolumn = "80"
vim.opt.laststatus = 3

require("todo-comments").setup() -- Highlight TODO: comments
require("rest-nvim").setup({})
require("ionide").setup({
	on_attach = function(client, bufnr)
		vim.lsp.codelens.refresh()
	end,
	capabilities = capabilities
})

require("conform").setup({
	formatters_by_ft = {
		markdown = { "deno_fmt" },
		yaml = { "yamlfix" },
		cs = { "csharpier" }
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

-- LSP setup
local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
		vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
		vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
		vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
		vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
		vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
		vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
		vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
	end
})

local default_setup = function(server)
	lspconfig[server].setup({
		capabilities = lsp_capabilities,
	})
end

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		"terraformls",
		"yamlls",
		"dockerls",
		"clojure_lsp",
		"html",
		"tsserver",
		"marksman",
		"lua_ls",
		"omnisharp",
	},
	handlers = { default_setup },
})

local cmp = require('cmp')

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({ select = false }),

		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
	}),
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
})

-- Treesitter
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

-- Plugin dev
local ok, plenary_reload = pcall(require, "plenary.reload")
local reloader = require
if ok then
	reloader = plenary_reload.reload_module
end

P = function(v)
	print(vim.inspect(v))
	return v
end

RELOAD = function(...)
	return reloader(...)
end

R = function(name)
	RELOAD(name)
	return require(name)
end

-- Keymaps
local nmap_leader = function(suffix, rhs, desc)
	vim.keymap.set('n', '<Leader>' .. suffix, rhs, { desc = desc })
end

local nmap_localleader = function(suffix, rhs, desc)
	vim.keymap.set('n', '<LocalLeader>' .. suffix, rhs, { desc = desc })
end

nmap_localleader("h", "<cmd>lua require('rest-nvim').run()<cr>", "HTTP")

-- LSP
nmap_leader("la", "<cmd>lua vim.lsp.buf.code_action()<cr>", "Action")
nmap_leader("lf", "<cmd>lua require('conform').format({lsp_fallback = true})<cr>", "Format")
nmap_leader("lr", "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename")

-- Quickfix
nmap_leader("q", "<cmd>:copen<cr>", "Focus quickfix")
nmap_leader("Q", "<cmd>:cclose<cr>", "Toggle quickfix")
