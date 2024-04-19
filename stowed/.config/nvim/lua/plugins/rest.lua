return {
    "rest-nvim/rest.nvim",
    ft = { 'http' },
    keys = {
        {
            "<localleader>h",
            "<cmd>lua require('rest-nvim').run()<cr>",
            { "n" },
            desc = "HTTP"
        },
    }
}
