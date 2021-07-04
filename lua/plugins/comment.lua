require('nvim_comment').setup({
  marker_padding = true,
  comment_empty = false,
  line_mapping = 'gcc',
  operator_mapping = 'gcc'
})

vim.api.nvim_set_keymap('n', '<leader>/', ':CommentToggle<CR>',
                        {noremap = true, silent = true})
