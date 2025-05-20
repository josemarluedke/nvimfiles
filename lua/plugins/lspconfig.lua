return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      protols = {},
    },

    setup = {
      protols = function(_, opts)
        require("lspconfig").protols.setup({})
      end,
    },
  },
}
