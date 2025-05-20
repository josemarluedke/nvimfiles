return {
  { "nvim-contrib/nvim-ginkgo" },
  {
    "nvim-neotest/neotest",
    opts = { adapters = { "nvim-ginkgo" } },
  },
}
