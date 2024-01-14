return {
  "NeogitOrg/neogit",
  lazy = false,
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    "ibhagwan/fzf-lua",
    "sindrets/diffview.nvim",
  },
  keys = {
    {
      "<leader>g", "<cmd>Neogit<cr>", desc = "Neogit",
    },
  },
}
