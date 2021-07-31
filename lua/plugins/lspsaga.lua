local saga = require 'lspsaga'
saga.init_lsp_saga {
  --  use_saga_diagnostic_sign = false,
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  code_action_icon = '💡',
  rename_action_keys = {
    quit = '<esc>',
    exec = '<CR>' -- quit can be a table
  }
}
