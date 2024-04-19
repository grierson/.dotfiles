return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = {
        winopts = {
            width = 1,
            height = 1,
            preview = {
                layout = "vertical",
                vertical = "down:80%",
            }
        }
    },
    keys = {
        { "<leader>sr", "<cmd>FzfLua resume<cr>",                desc = "Resume" },
        { "<leader>sf", "<cmd>FzfLua files<cr>",                 desc = "File" },
        { "<leader>sg", "<cmd>FzfLua live_grep<cr>",             desc = "Grep" },
        { "<leader>sw", "<cmd>FzfLua grep_cword<cr>",            desc = "Word" },
        { "<leader>b",  "<cmd>FzfLua buffers<cr>",               desc = "Buffers" },
        { "<leader>sd", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Diagnostics" },
        { "<leader>sh", "<cmd>FzfLua help_tags<cr>",             desc = "Help" },
        { "<leader>sc", "<cmd>FzfLua commands<cr>",              desc = "Commands" },
        { "<leader>st", "<cmd>FzfLua grep search='TODO'<cr>",    desc = "TODO" },
        { "<leader>b",  "<cmd>FzfLua buffers<cr>",               desc = "Buffer" },
    },
}
