return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = false,
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { '<Leader>t',  "<cmd>Neotree focus right<cr>",  desc = "tree" },
    { '<Leader>T',  "<cmd>Neotree toggle right<cr>", desc = "Toggle tree" },
    { "<Leader>wf", "<cmd>Neotree reveal<cr>",       desc = "File" }
  },
}
