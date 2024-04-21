return {
  "theprimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
  config = function()
    require("harpoon"):setup()
  end,
  keys = {
    { "<leader>M", function() require("harpoon"):list():add() end, desc = "Harpoon", },
    {
      "<leader>m",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Harpoon list",
    },
  },
}
