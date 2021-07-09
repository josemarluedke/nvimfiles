local M = {}

local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = ' ',
    selection_caret = ' ',
    color_devicons = true,
    set_env = {['COLORTERM'] = 'truecolor'},

    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<CR>'] = actions.select_default + actions.center,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous
      }
    }
  }
}

M.ag = function(folder)
  require('telescope.builtin').live_grep({search_dirs = {folder}})
end

vim.cmd [[command! -nargs=1 -complete=dir Ag lua require'plugins.telescope'.ag(<f-args>)]]

return M
