return {
  "rest-nvim/rest.nvim",
  ft = { 'http' },
  keys = {
    {
      "<leader>h",
      "<cmd>lua require('rest-nvim').run()<cr>",
      { "n" },
      desc = "HTTP"
    },
  }
}
