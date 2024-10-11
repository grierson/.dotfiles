return {
  {
    "HiPhish/rainbow-delimiters.nvim"
  },
  {
    "p00f/alabaster.nvim", -- Theme
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('alabaster')
      vim.o.termguicolors = true
      vim.o.background = "light"
    end
  },
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
          "markdown_inline",
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
    end
  }
}
