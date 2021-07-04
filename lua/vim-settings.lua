vim.cmd('syntax on') -- syntax highlighting
vim.cmd('set iskeyword+=-') -- add '-' as recognized word symbol. e.g  'foo-bar' instead just 'foo'
vim.cmd('set shortmess+=c') -- don't pass messages to |ins-completion-menu|.
vim.cmd('set inccommand=nosplit') -- visual feedback while substituting
vim.cmd('set complete+=kspell') -- auto complete spell words
vim.cmd('set matchpairs+=<:>') -- make < and > to match

vim.o.hidden = true -- allow multiple buffers to be open
vim.o.mouse = 'a' -- enable mouse interaction
vim.o.clipboard = 'unnamedplus' -- use system clipboard by default

-- Tab key actions
vim.o.expandtab = true
vim.o.smarttab = true

--  Highlight text while searching
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

-- Use tab to navigate in list mode
vim.o.list = true
vim.o.listchars = 'trail:»,tab:»-'

-- Use 2 spaces for tab
vim.o.tabstop = TabSize
vim.o.shiftwidth = TabSize
vim.o.softtabstop = TabSize

-- vim.o.encoding = 'utf-8' -- text encoding
vim.wo.wrap = false -- don't wrap text
vim.wo.number = true -- enable numbers on the left
vim.wo.relativenumber = true -- current line is 0
vim.o.title = true -- tab title as file name

-- Enable indentation
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.conceallevel = 2 -- don't break indentation plugin

vim.o.splitright = true -- open vertical split to the right
vim.o.splitbelow = true -- open horizontal split to the bottom
vim.o.emoji = true -- enable emojis

-- Use undofile instead of swap files for history
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv('HOME') .. '/.cache/nvim/undodir/'
vim.o.undofile = true

vim.o.laststatus = 2 -- display the status line always
vim.o.autoread = true -- auto read file changes

-- Faster completion
vim.o.timeoutlen = 500
vim.o.ttimeoutlen = 0
vim.o.updatetime = 300 -- default is 4000 ms which leads to noticeable delays and poor user experience.
vim.o.completeopt = 'menuone,noselect' -- show menu

vim.o.showmode = false -- don't show modes at the bottom, let airline do it
vim.o.showmatch = true -- show matching brackets
vim.o.grepprg = 'rg --vimgrep' -- use rg as default grepper

vim.o.colorcolumn = '80' -- column width with color
vim.o.guifont = Font -- set the gui font

-- Performance tweaks
vim.o.cursorline = false
vim.o.cursorcolumn = false
vim.o.synmaxcol = 180

vim.o.signcolumn = 'yes'

-- vim.o.backspace=indent,eol,start                  -- allow backspacing over everything in insert mode
-- highlight clear SignColumn                      " clear the color for signcolumn
-- vim.o.history=1000                                -- history limit
-- set fillchars+=vert:\▏                          " requires a patched nerd font (try FiraCode)
