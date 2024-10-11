return {
  {
    "Olical/conjure",
    ft = { "clojure" },
  },
  {
    "julienvincent/nvim-paredit",
    ft = { "clojure", "scheme", "lisp", "racket", "fennel" },
    config = function()
      require("nvim-paredit").setup()
    end,
    keys = {
      {
        "<localleader>w",
        function()
          local paredit = require("nvim-paredit")
          paredit.cursor.place_cursor(
            paredit.wrap.wrap_element_under_cursor("( ", ")"),
            { placement = "inner_start", mode = "insert" }
          )
        end,
        desc = "Wrap element insert head"
      },
      {
        "<localleader>W",
        function()
          local paredit = require("nvim-paredit")
          paredit.cursor.place_cursor(
            paredit.wrap.wrap_element_under_cursor("(", ")"),
            { placement = "inner_end", mode = "insert" }
          )
        end,
        "Wrap element insert tail",
      },
      { "<localleader>i",
        function()
          local paredit = require("nvim-paredit")
          paredit.cursor.place_cursor(
            paredit.wrap.wrap_enclosing_form_under_cursor("( ", ")"),
            { placement = "inner_start", mode = "insert" }
          )
        end,
        "Wrap form insert head",
      },
      { "<localleader>I",
        function()
          local paredit = require("nvim-paredit")
          paredit.cursor.place_cursor(
            paredit.wrap.wrap_enclosing_form_under_cursor("(", ")"),
            { placement = "inner_end", mode = "insert" }
          )
        end,
        "Wrap form insert tail",
      }
    }
  }
}
