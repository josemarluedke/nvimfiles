Colorscheme = 'deus'
Font = 'FiraCode Nerd Font:h17'
TabSize = 2

DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

Lua = {}
Lua.formatter = 'lua-format'
Lua.formatLineLength = 80

JS_TS = {}
JS_TS.formatter = 'eslint'
JS_TS.linter = 'eslint'

Term = {}
Term.shell = vim.o.shell -- or a string with the path to a shell binary
Term.size = 15
Term.shade = true
Term.direction = 'horizontal' -- horizontal, vertical, window, or float
Term.floatBorder = 'shadow' -- single, double, shadow, or curved
