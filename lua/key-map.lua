local map = vim.api.nvim_set_keymap
local opts = {silent = false, noremap = true}

vim.g.mapleader = ','

-- NvimTree
map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', opts)
map('n', '<leader>m', '<cmd>NvimTreeToggle<CR>', opts) -- to be removed
map('n', '<leader>n', '<cmd>NvimTreeFindFile<CR>', opts)

-- LSP
map('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'gs', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>',
    opts)
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', 'ca', '<cmd>Lspsaga code_action<CR>', opts)
map('n', '<C-p>', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
map('n', '<C-n>', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
map('n', '<leader>r', '<cmd>lua require("lspsaga.rename").rename()<CR>', opts)

-- scroll down hover doc or scroll in definition preview
map('n', '<Down>',
    '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>', opts)
-- scroll up hover doc
map('n', '<Up>',
    '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>', opts)

-- Telescope
map('n', '<Leader>f', '<cmd>Telescope find_files<CR>', opts)
map('n', '<Leader>g', '<cmd>Telescope live_grep<CR>', opts)
map('n', 't', '<cmd>Telescope find_files<CR>', opts)

-- Misc
map('n', '<leader><space>', ':noh<CR>', opts)
map('n', ';', ':', opts)
map('n', ':E', ':e', opts)
map('n', ':W', ':w', opts)
map('n', ':Q', ':q', opts)

-- BarBar
map('n', '<C-s>', '<cmd>BufferPick<CR>', opts)

-- Replace
map('n', '<leader>s', ':%s//<left>', {noremap = true})
map('v', '<leader>s', ':s//<left>', {noremap = true})

-- Better window navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Terminal mappings
map('t', '<esc>', '<C-\\><C-n>', opts)
map('t', '<C-h>', '<C-\\><C-n><C-w>h', opts)
map('t', '<C-j>', '<C-\\><C-n><C-w>j', opts)
map('t', '<C-k>', '<C-\\><C-n><C-w>k', opts)
map('t', '<C-l>', '<C-\\><C-n><C-w>l', opts)

-- Switch between the last two files
map('n', '<leader><leader>', '<c-^>', opts)

--  Indent lines
map('n', '<', '<<', opts)
map('n', '>', '>>', opts)
map('n', '<', '><gv', opts)
map('n', '>', '>>gv', opts)

-- " Copy to osx clipboard
-- vnoremap <C-c> "*y<CR><Paste>
-- vnoremap <C-c> "*y<CR>
-- vnoremap y "*y<CR>
-- nnoremap Y "*Y<CR>
