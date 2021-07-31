vim.g.nvim_tree_quit_on_open = 1 -- closes the tree when you open a file
vim.g.nvim_tree_indent_markers = 1 -- shows indent markers when folders are open
vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
vim.g.nvim_tree_gitignore = 1

vim.g.nvim_tree_special_files = {
  {['README.md'] = 0, Makefile = 0, MAKEFILE = 0}
}
