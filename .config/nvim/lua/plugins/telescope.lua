return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	dependencies = {
		"nvim-telescope/telescope-live-grep-args.nvim"
	},
	keys = {
		{ "<leader>ls", "<cmd>Telescope lsp_document_symbols symbols=function,variable<cr>",                    desc = "Symbol" },
		{ "<leader>ld", "<cmd>Telescope diagnostics<cr>",                                                       desc = "Diagnostic" },
		{ "<leader>ws", "<cmd>Telescope lsp_workspace_symbols symbols=function,variable<cr>",                   desc = "Symbol" },
		{ "<leader>sf", "<cmd>Telescope find_files<cr>",                                                        desc = "File" },
		{ "<leader>sh", "<cmd>Telescope help_tags<cr>",                                                         desc = "Help" },
		{ "<leader>sw", "<cmd>Telescope grep_string<cr>",                                                       desc = "Word" },
		{ "<leader>sg", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",         desc = "Grep" },
		{ "<leader>sd", "<cmd>Telescope diagnostic<cr>",                                                        desc = "Diagnostics" },
		{ "<leader>sn", "<cmd>TodoTelescope<cr>",                                                               desc = "Note" },
		{ "<leader>sr", "<cmd>Telescope resume<cr>",                                                            desc = "Resume" },
		{ "<leader>sq", "<cmd>Telescope quickfix<cr>",                                                          desc = "Quickfix" },
		{ "<leader>sc", "<cmd>Telescope commands<cr>",                                                          desc = "Commands" },
		{ "<leader>r",  "<cmd>Telescope registers<cr>",                                                         desc = "Registers" },
		{ "<leader>b",  "<cmd>Telescope buffers theme=dropdown ignore_current_buffer=true previewer=false<cr>", desc = "Buffer" }
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
