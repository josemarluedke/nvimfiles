local saga = require('lspsaga')
saga.setup({
  border_style = 'rounded',
  rename_action_quit = '<esc>',
  finder_action_keys = {
    open = '<CR>',
    quit = '<esc>',
  },
})
