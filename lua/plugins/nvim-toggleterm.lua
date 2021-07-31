require('toggleterm').setup {
  size = Term.size,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = Term.shade,
  shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  persist_size = true,
  direction = Term.direction,
  close_on_exit = true, -- close the terminal window when the process exits
  insert_mappings = false,
  shell = Term.shell,
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_win_open'
    -- see :h nvim_win_open for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = Term.floatBorder,
    -- width = <value>,
    -- height = <value>,
    winblend = 3,
    highlights = {border = 'Normal', background = 'Normal'}
  }
}
