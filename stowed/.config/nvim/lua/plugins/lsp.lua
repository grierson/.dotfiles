return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        markdown = { "prettier" },
        yaml = { "prettier" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
      format_on_save = { timeout_ms = 500 },
    },
    keys = {
      {
        "<leader>lf",
        function()
          require("conform").format({ async = true })
        end,
        mode = "",
        desc = "Format",
      },
      -- Center Movement
      {
        "J",
        "mzJ`z",
        mode = "n",
        desc = "Center merge"
      },
      {
        "<C-d>",
        "<C-d>zz",
        mode = "n",
        desc = "Scroll Down"
      },
      {
        "<C-u>",
        "<C-u>zz",
        mode = "n",
        desc = "Scroll Up"
      },
      {
        "J",
        "mzJ`z",
        mode = "n",
        desc = "Join center"
      },
      {
        "n",
        "nzzzv",
        mode = "n",
        desc = "Next center"
      },
      {
        "N",
        "Nzzzv",
        mode = "n",
        desc = "Previous center"
      },
      {
        "<leader>p",
        [["_dP]],
        mode = "x",
        desc = "Paste"
      },
      {
        "<leader>y",
        [["+y]],
        mode = { "n", "v" },
        desc = "Clipboard"
      },
      {
        "<leader>S",
        [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
        mode = "n",
        desc = "Substitute word"
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require('lint')

      lint.linters_by_ft = {
        markdown = { 'vale' },
        yaml = { 'yamllint' },
      }

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        callback = function()
          lint.try_lint()
        end
      })
    end
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
      lspconfig.racket_langserver.setup({})
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
      { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Action" },
      { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",      desc = "Rename" }
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
      local ls = require("luasnip")

      cmp.setup({
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "buffer" },
          { name = "conjure" }
        }),
        snippet = {
          expand = function(args)
            ls.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        formatting = {
          format = lspkind.cmp_format({})
        }
      })

      vim.keymap.set({ "i", "s" }, "<S-Down>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<S-Up>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, { silent = true })
    end
  }
}
