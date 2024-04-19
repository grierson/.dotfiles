return {
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
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
