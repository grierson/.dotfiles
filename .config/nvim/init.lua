vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

require("lazy").setup({
	-- Theme
	"p00f/alabaster.nvim",      -- Theme
	'nvim-treesitter/nvim-treesitter', -- AST
	'nvim-treesitter/playground', -- View Treesitter AST
	"HiPhish/nvim-ts-rainbow2", -- Rainbow parens

	-- Git manager
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"sindrets/diffview.nvim",
		},
		config = true
	},
	"lewis6991/gitsigns.nvim", -- Git gutter + hunks

	-- Search
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-live-grep-args.nvim"
		}
	},
	"ThePrimeagen/harpoon",

	-- Project tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		}
	},

	-- LSP + Autocomplete
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = 'v3.x',
		lazy = true,
		config = false
	},

	-- LSP Support
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
		}
	},
	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "L3MON4D3/LuaSnip" }
		},
	},

	-- Basics
	"echasnovski/mini.nvim", -- comments, pair, surround, statusline, leap, whichKey
	"tpope/vim-sleuth", -- Indent

	-- Lisp
	"Olical/conjure",      -- REPL
	"julienvincent/nvim-paredit", -- Parens edit

	-- Misc
	"NoahTheDuke/vim-just", -- Build tool
	"folke/todo-comments.nvim", -- TODO: comments
	"nvim-lua/plenary.nvim", -- Lots of packages use as dep

	-- Progress bar
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
	},

	-- Markdown
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		build = ":call mkdp#util#install()",
	},
})

-- Theme
vim.o.termguicolors = true
vim.o.background = "light"
vim.cmd.colorscheme('alabaster')

-- Options
require('mini.basics').setup()
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.colorcolumn = "80"

-- Plugins
require('mini.trailspace').setup() -- Trailing space
require('mini.comment').setup()    -- Comments - gcc
require('mini.pairs').setup()      -- Auto close
require('mini.surround').setup()   -- add/change/delete surround
require('mini.cursorword').setup() -- Highlight current cursorword
require('mini.jump2d').setup(
	{
		mappings = {
			start_jumping = '',
		},
	}
)                                 -- Quick jump anywhere - <CR> <follow letters>
require('mini.bracketed').setup() -- Bracket movement
require('mini.splitjoin').setup() -- gS split or join args
require('mini.starter').setup()   -- Starter screen
require('mini.sessions').setup()  -- Sessions
-- Move code
require('mini.move').setup({
	mappings = {
		up = '<S-up>',
		down = '<S-down>'
	}
})

-- Status line
require('mini.statusline').setup({
	set_vim_settings = false
})
vim.opt.laststatus = 3


require("nvim-paredit").setup()  -- parens edit
require("neo-tree").setup()      -- File tree
require("todo-comments").setup() -- Highlight TODO: comments
require("fidget").setup()        -- Progress bar
require("neogit").setup({})      -- Git manager
require("gitsigns").setup({})    -- Git gutter

-- LSP setup
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require('lspconfig').lua_ls.setup(lua_opts)
		end,
	}
})

-- Autocompletion config
local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({ select = false }),

		-- Navigate between snippet placeholder
		['<C-f>'] = cmp_action.luasnip_jump_forward(),
		['<C-b>'] = cmp_action.luasnip_jump_backward(),

		-- Scroll up and down in the completion documentation
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
	})
})


-- Treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"vimdoc",
		"lua",
		"clojure",
		"json",
		"terraform",
		"dockerfile",
		"markdown",
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

-- Telescope
local telescope = require("telescope")
local actions = require("telescope.actions")
telescope.setup({
	defaults = {
		layout_strategy = "vertical",
		mappings = {
			i = {
				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
			},
			n = {
				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
			}
		}
	},
	pickers = {
		buffers = {
			mappings = {
				i = {
					["<c-d>"] = "delete_buffer",
				}
			}
		}
	},
	extensions = {
		live_grep_args = {
			auto_quoting = true,
		}
	}
})
--telescope.load_extension('fzf')
telescope.load_extension('live_grep_args')
telescope.load_extension('harpoon')

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

-- Project Tree
nmap_leader('t', '<cmd>Neotree focus right<cr>', 'Focus tree')
nmap_leader('T', '<cmd>Neotree toggle right<cr>', 'Toggle tree')

-- Git
nmap_leader('g', '<cmd>Neogit<cr>', 'Git')

-- LSP
nmap_leader("la", "<cmd>lua vim.lsp.buf.code_action()<cr>", "Action")
nmap_leader("lf", "<cmd>lua vim.lsp.buf.format()<cr>", "Format")
nmap_leader("lr", "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename")
nmap_leader("ls", "<cmd>Telescope lsp_document_symbols symbols=function,variable<cr>", "Symbol")
nmap_leader("ld", "<cmd>Telescope diagnostics<cr>", "Diagnostic")

-- LSP workspace
nmap_leader("wf", "<cmd>Neotree reveal<cr>", "File")
nmap_leader("ws", "<cmd>Telescope lsp_workspace_symbols symbols=function,variable<cr>", "Symbol")

-- Search
nmap_leader("sf", "<cmd>Telescope find_files<cr>", "File")
nmap_leader("sh", "<cmd>Telescope help_tags<cr>", "Help")
nmap_leader("sw", "<cmd>Telescope grep_string<cr>", "Word")
nmap_leader("sg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", "Grep")
nmap_leader("sd", "<cmd>Telescope diagnostic<cr>", "Diagnostics")
nmap_leader("sn", "<cmd>TodoTelescope<cr>", "Note")
nmap_leader("sr", "<cmd>Telescope resume<cr>", "Resume")
nmap_leader("sq", "<cmd>Telescope quickfix<cr>", "Quickfix")
nmap_leader("sc", "<cmd>Telescope commands<cr>", "Commands")

-- Git hunks
nmap_leader("hs", "<cmd>Gitsigns stage_hunk<cr>", "Stage")
nmap_leader("hr", "<cmd>Gitsigns reset_hunk<cr>", "Reset")
nmap_leader("hp", "<cmd>Gitsigns preview_hunk<cr>", "Preview")
vim.keymap.set('n', '[h', "<cmd>Gitsigns prev_hunk<cr>", { desc = "Hunk" })
vim.keymap.set('n', ']h', "<cmd>Gitsigns next_hunk<cr>", { desc = "Hunk" })

-- Buffers
nmap_leader("b", "<cmd>Telescope buffers theme=dropdown ignore_current_buffer=true previewer=false<cr>", "Buffer")

-- Quickfix
nmap_leader("q", "<cmd>:copen<cr>", "Focus quickfix")
nmap_leader("Q", "<cmd>:cclose<cr>", "Toggle quickfix")

-- Registers
nmap_leader("r", "<cmd>Telescope registers<cr>", "Registers")

-- Marks + Fenpoon
nmap_leader("m", "<cmd>Telescope harpoon marks<cr>", "Harpoons")
nmap_leader("M", "<cmd>:lua require('harpoon.mark').add_file()<cr>", "Harpoon")

-- Jump
local mini_jump2d = require('mini.jump2d')
vim.keymap.set({ "n", "v" }, "<cr>", function() return mini_jump2d.start(mini_jump2d.builtin_opts.single_character) end,
	{})

local miniclue = require('mini.clue')
miniclue.setup({
	triggers = {
		-- Leader triggers
		{ mode = 'n', keys = '<Leader>' },
		{ mode = 'x', keys = '<Leader>' },
		{ mode = 'n', keys = '<LocalLeader>' },

		-- Built-in completion
		{ mode = 'i', keys = '<C-x>' },

		-- `g` key
		{ mode = 'n', keys = 'g' },
		{ mode = 'x', keys = 'g' },

		-- Marks
		{ mode = 'n', keys = "'" },
		{ mode = 'n', keys = '`' },
		{ mode = 'x', keys = "'" },
		{ mode = 'x', keys = '`' },

		-- Registers
		{ mode = 'n', keys = '"' },
		{ mode = 'x', keys = '"' },
		{ mode = 'i', keys = '<C-r>' },
		{ mode = 'c', keys = '<C-r>' },

		-- Window commands
		{ mode = 'n', keys = '<C-w>' },

		-- `z` key
		{ mode = 'n', keys = 'z' },
		{ mode = 'x', keys = 'z' },

		-- `Bracketed` key
		{ mode = 'n', keys = '[' },
		{ mode = 'n', keys = ']' },
		{ mode = 'x', keys = '[' },
		{ mode = 'x', keys = ']' },
	},

	clues = {
		{ mode = 'n', keys = '<Leader>w', desc = '+Buffers' },
		{ mode = 'n', keys = '<Leader>s', desc = '+Search' },
		{ mode = 'n', keys = '<Leader>l', desc = '+LSP' },
		{ mode = 'n', keys = '<Leader>h', desc = '+Hunk' },
		-- Enhance this by adding descriptions for <Leader> mapping groups
		miniclue.gen_clues.builtin_completion(),
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows(),
		miniclue.gen_clues.z(),
	},
})
