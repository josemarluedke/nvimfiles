-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = vim.api.nvim_set_keymap
local opts = { silent = false, noremap = true }

-- Misc
-- map('n', '<leader><space>', ':noh<CR>', opts)
map("n", ";", ":", opts)
map("n", ":E", ":e", opts)
map("n", ":W", ":w", opts)
map("n", ":Q", ":q", opts)

-- Replace
-- map("n", "<leader>s", ":%s//<left>", { noremap = true })
-- map("v", "<leader>s", ":s//<left>", { noremap = true })

-- Better window navigation
-- map('n', '<C-h>', '<C-w>h', opts)
-- map('n', '<C-j>', '<C-w>j', opts)
-- map('n', '<C-k>', '<C-w>k', opts)
-- map('n', '<C-l>', '<C-w>l', opts)

-- Terminal mappings
map("t", "<esc>", "<C-\\><C-n>", opts)
map("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
map("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)
map("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
map("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)

-- Switch between the last two files "\"
map("n", "\\", "<c-^>", opts)

-- " Copy to osx clipboard
-- vnoremap <C-c> "*y<CR><Paste>
-- vnoremap <C-c> "*y<CR>
-- vnoremap y "*y<CR>
-- nnoremap Y "*Y<CR>
--
