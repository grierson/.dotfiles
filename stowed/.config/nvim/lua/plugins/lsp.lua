return {
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        yaml = { "yamlfix" },
        markdown = { "prettier" }
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    }
  },
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
      require("mason-lspconfig").setup({
        ensure_installed = {
          "terraformls",
          "yamlls",
          "dockerls",
          "docker_compose_language_service",
          "clojure_lsp",
          "html",
          "lua_ls",
        },
        handlers = {
          function(server)
            lspconfig[server].setup({})
          end,
        },
      })

      vim.highlight.priorities.semantic_tokens = 95

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
      { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",                        desc = "Action" },
      { "<leader>lf", "<cmd>lua require('conform').format({lsp_fallback = true})<cr>", desc = "Format" },
      { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",                             desc = "Rename" }
    }
  },
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    priority = 100,
    dependencies = {
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
      "saadparwaiz1/cmp_luasnip",
      "PaterJason/cmp-conjure"
    },
    config = function()
      vim.opt.completeopt = { "menu", "menuone", "noselect" }
      vim.opt.shortmess:append "c"

      local lspkind = require("lspkind")
      lspkind.init({})

      local cmp = require("cmp")

      cmp.setup({
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "buffer" },
          { name = "conjure" }
        }),
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        formatting = {
          format = lspkind.cmp_format({})
        }
      })
    end
  }
}
