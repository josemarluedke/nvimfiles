local saga = require('lspsaga')
saga.init_lsp_saga({
  border_style = 'rounded',
  rename_action_quit = '<esc>',
  finder_action_keys = {
    open = '<CR>',
    quit = '<esc>',
  },
})
