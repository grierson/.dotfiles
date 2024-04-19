return {
    "p00f/alabaster.nvim", -- Theme
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme('alabaster')
        vim.o.termguicolors = true
        vim.o.background = "light"
        vim.api.nvim_command("hi! CursorLine guifg=NONE guibg=" .. "#c9c9c9")
    end
}
