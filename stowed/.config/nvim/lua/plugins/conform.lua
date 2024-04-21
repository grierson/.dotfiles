return {
  'stevearc/conform.nvim',
  ft = { 'yaml', 'cs' },
  opts = {
    formatters_by_ft = {
      yaml = { "yamlfix" },
      cs = { "csharpier" }
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  }
}
