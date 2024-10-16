return {
  {
    "Olical/conjure",
    ft = { "clojure" },
  },
  {
    "julienvincent/nvim-paredit",
    ft = { "clojure", "fennel", "scheme" },
    config = function()
      require("nvim-paredit").setup()
      vim.cmd([[
        let g:conjure#filetype#scheme = "conjure.client.guile.socket"
        let g:conjure#client#guile#socket#pipename = "guile-repl.socket"
      ]])
    end,
    keys = {
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
