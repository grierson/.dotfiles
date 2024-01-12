return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	dependencies = {
		"nvim-telescope/telescope-live-grep-args.nvim"
	},
	keys = {
		{ "ls", "<cmd>Telescope lsp_document_symbols symbols=function,variable<cr>",            "Symbol" },
		{ "ld", "<cmd>Telescope diagnostics<cr>",                                               "Diagnostic" },
		{ "ws", "<cmd>Telescope lsp_workspace_symbols symbols=function,variable<cr>",           "Symbol" },
		{ "sf", "<cmd>Telescope find_files<cr>",                                                "File" },
		{ "sh", "<cmd>Telescope help_tags<cr>",                                                 "Help" },
		{ "sw", "<cmd>Telescope grep_string<cr>",                                               "Word" },
		{ "sg", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", "Grep" },
		{ "sd", "<cmd>Telescope diagnostic<cr>",                                                "Diagnostics" },
		{ "sn", "<cmd>TodoTelescope<cr>",                                                       "Note" },
		{ "sr", "<cmd>Telescope resume<cr>",                                                    "Resume" },
		{ "sq", "<cmd>Telescope quickfix<cr>",                                                  "Quickfix" },
		{ "sc", "<cmd>Telescope commands<cr>",                                                  "Commands" },
		{ "r",  "<cmd>Telescope registers<cr>",                                                 "Registers" },
		{ "b", "<cmd>Telescope buffers theme=dropdown ignore_current_buffer=true previewer=false<cr>",
			"Buffer" }
	},
	config = function()
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
		telescope.load_extension('live_grep_args')
	end,

}
