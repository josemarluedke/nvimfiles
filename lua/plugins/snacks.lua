return {
  "folke/snacks.nvim",
  opts = {
    terminal = {
      win = {
        -- Change the default window position
        -- Options: "float", "bottom", "top", "left", "right"
        position = "float", -- default is floating

        -- Border style
        border = "rounded",

        -- For floating windows, you can customize:
        relative = "editor",
        row = 0.1, -- 10% from top
        col = 0.1, -- 10% from left
        width = 0.8, -- 80% of editor width
        height = 0.8, -- 80% of editor height

        -- For split windows (if position is "bottom", "top", etc):
        -- height = 0.4, -- 40% of editor height for horizontal splits
        -- width = 0.4, -- 40% of editor width for vertical splits
      },
    },
  },
  keys = {
    -- Add Option+f to toggle terminal (in addition to default Ctrl+/)
    {
      "<M-f>",
      function()
        Snacks.terminal()
      end,
      desc = "Toggle Terminal",
      mode = { "n", "t" },
    },
  },
}
