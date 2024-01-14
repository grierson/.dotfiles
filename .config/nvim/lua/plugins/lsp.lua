return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require('lspconfig')
      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "terraformls",
          "yamlls",
          "dockerls",
          "docker_compose_language_service",
          "clojure_lsp",
          "html",
          "tsserver",
          "lua_ls",
          "omnisharp",
        },
        handlers = {
          function(server)
            lspconfig[server].setup({
              capabilities = lsp_capabilities,
            })
          end,
        },
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = { buffer = event.buf }

          vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
          vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
          vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
          vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
          vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
          vim.keymap.set('n', 'gr', '<cmd>FzfLua lsp_references<cr>', opts)
          vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
          vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
        end
      })
    end,
    keys = {
      { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",                        "Action" },
      { "<leader>lf", "<cmd>lua require('conform').format({lsp_fallback = true})<cr>", "Format" },
      { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",                             "Rename" }
    }
  },
}
