return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.keymap = {
        preset = "enter",
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
      }
      opts.appearance = opts.appearance or {}
      opts.appearance.kind_icons = vim.tbl_extend("keep", {
        Color = "██",
      }, LazyVim.config.icons.kinds)

      opts.completion = {
        ghost_text = { enabled = true },
        menu = { border = "single" },
        documentation = { window = { border = "single" } },
      }
      opts.signature = { window = { border = "single" } }
    end,
  },
}
