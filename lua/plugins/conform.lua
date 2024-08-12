return {
  "stevearc/conform.nvim",
  opts = {

    log_level = vim.log.levels.DEBUG,
    -- add your config here
    formatters_by_ft = {
      go = {
        "gofmt",
        "goimports",
        -- "goimports-reviser",
      },
      graphql = {
        "prettier",
      },
    },
    format_on_save = function(bufnr)
      return { async = true, timeout_ms = 5000, lsp_fallback = true }
    end,
  },
}
