return {
  "mason-org/mason.nvim",

  opts = { ensure_installed = {
    "goimports",
    "gofumpt",
    -- "glint", -- v1; v2 uses @glint/tsserver-plugin via vtsls
    "graphql-language-service-cli",
  } },
}
