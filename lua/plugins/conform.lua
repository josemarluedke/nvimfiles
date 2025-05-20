return {
  "stevearc/conform.nvim",
  enabled = true,

  cmd = { "ConformInfo" },
  event = "BufWritePre",
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    log_level = vim.log.levels.DEBUG,
    -- add your config here
    formatters_by_ft = {
      go = {
        "gofumpt",
        "goimports_reviser",
      },
      graphql = {
        "prettier",
      },
      typescript = {
        "eslint",
        "prettier",
      },
      javascript = {
        "eslint",
      },
      handlebars = {
        "prettier",
      },
      ["typescript.glimmer"] = {
        "eslint",
        "prettier",
      },
      ["javascript.glimmer"] = {
        "eslint",
        "prettier",
      },
    },
    format_on_save = function(bufnr)
      return { async = true, timeout_ms = 1000, lsp_fallback = true }
    end,

    formatters = {
      goimports_reviser = {
        command = "goimports-reviser",
        args = {
          "-imports-order",
          "std,project,company,general,blanked,dotted",
          "-company-prefixes",
          "github.com/nrfta,github.com/neighborly",
          "-rm-unused",
          "-format",
          "$FILENAME",
        },
        stdin = false,
      },
    },
  },
}
