local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')

-- skip it, if you use another global object
_G.MUtils = {}

vim.g.completion_confirm_key = ''
MUtils.completion_confirm = function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info()['selected'] ~= -1 then
      return vim.fn['compe#confirm'](npairs.esc('<cr>'))
    else
      return npairs.esc('<cr>')
    end
  else
    return npairs.autopairs_cr()
  end
end

if package.loaded['compe'] then
  require('nvim-autopairs.completion.compe').setup({
    map_cr = true, --  map <CR> on insert mode
    map_complete = true, -- it will auto insert `(` after select function or method item
  })
end

npairs.setup({
  check_ts = true,
  ts_config = {
    lua = { 'string' }, -- it will not add pair on that treesitter node
    javascript = { 'template_string' },
    java = false, -- don't check treesitter on java
  },
  disable_filetype = { 'TelescopePrompt', 'vim' },
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())

require('nvim-treesitter.configs').setup({ autopairs = { enable = true } })
local ts_conds = require('nvim-autopairs.ts-conds')

-- press % => %% is only inside comment or string
npairs.add_rules({
  Rule('%', '%', 'lua'):with_pair(ts_conds.is_ts_node({ 'string', 'comment' })),
  Rule('$', '$', 'lua'):with_pair(ts_conds.is_not_ts_node({ 'function' })),
})
