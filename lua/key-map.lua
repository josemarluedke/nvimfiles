local map = vim.api.nvim_set_keymap

vim.g.mapleader = ','

map('n', '<leader>m', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- LSP
map('n', 'K', ':Lspsaga hover_doc<CR>', {noremap = true, silent = true})
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>',
    {noremap = true, silent = true})
map('n', 'gs', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>',
    {noremap = true, silent = true})
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>',
    {noremap = true, silent = true})
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>',
    {noremap = true, silent = true})
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>',
    {noremap = true, silent = true})
map('n', 'ca', ':Lspsaga code_action<CR>', {noremap = true, silent = true})
map('n', '<C-p>', ':Lspsaga diagnostic_jump_prev<CR>',
    {noremap = true, silent = true})
map('n', '<C-n>', ':Lspsaga diagnostic_jump_next<CR>',
    {noremap = true, silent = true})
map('n', '<leader>r', '<cmd>lua require("lspsaga.rename").rename()<CR>',
    {noremap = true, silent = true})

-- scroll down hover doc or scroll in definition preview
map('n', '<Down>',
    '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>',
    {noremap = true, silent = true})
-- scroll up hover doc
map('n', '<Up>',
    '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>',
    {noremap = true, silent = true})

-- Telescope
map('n', '<Leader>f', ':Telescope find_files<CR>',
    {noremap = true, silent = true})
map('n', '<Leader>g', ':Telescope live_grep<CR>',
    {noremap = true, silent = true})
map('n', 't', ':Telescope find_files<CR>', {noremap = true, silent = true})

-- Misc
map('n', '<leader><space>', ':noh<CR>', {noremap = true, silent = true})
