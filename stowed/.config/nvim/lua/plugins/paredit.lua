return {
  "julienvincent/nvim-paredit",
  ft = { "clojure", "scheme", "lisp", "racket", "fennel" },
  config = function()
    require("nvim-paredit").setup()
  end
}
