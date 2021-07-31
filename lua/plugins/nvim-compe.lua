-- Lua config
require'compe'.setup {
  source = {
    path = {kind = '   (Path)'},
    buffer = {kind = '   (Buffer)'},
    calc = {kind = '   (Calc)'},
    vsnip = {kind = '   (Snippet)'},
    nvim_lsp = {kind = '   (LSP)'},
    nvim_lua = false,
    spell = {kind = '   (Spell)', filetypes = {'markdown', 'text'}},
    tags = false,
    vim_dadbod_completion = true,
    ultisnips = {kind = '   (Snippet)'},
    treesitter = {kind = '  '},
    emoji = {kind = ' ﲃ  (Emoji)', filetypes = {'markdown', 'text'}}
    -- for emoji press : (idk if that in compe tho)
  }
}

-- Tab navigation
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-n>'
    -- elseif vim.fn.call("vsnip#available", {1}) == 1 then
    --   return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t '<Tab>'
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-p>'
    -- elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    --   return t "<Plug>(vsnip-jump-prev)"
  else
    return t '<S-Tab>'
  end
end

vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_complete()', {expr = true})
vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.tab_complete()', {expr = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
