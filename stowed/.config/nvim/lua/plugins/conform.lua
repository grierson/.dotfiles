return {
  'stevearc/conform.nvim',
  ft = { 'yaml' },
  opts = {
    formatters_by_ft = {
      yaml = { "yamlfix" }
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  }
}
