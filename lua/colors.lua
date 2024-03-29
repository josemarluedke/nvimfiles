vim.go.t_Co = '256'
vim.go.termguicolors = true
vim.go.background = 'dark'
vim.cmd('let g:deus_termcolors=256')

-- vim.g.sonokai_style = 'andromeda'
vim.g.sonokai_enable_italic = 1
-- vim.g.edge_style = 'aura'
vim.g.edge_enable_italic = 1

-- vim.g.rose_pine_variant = 'dawn'
vim.g.rose_pine_variant = 'moon'

vim.cmd('colorscheme ' .. Colorscheme)

vim.cmd([[ command! Dark set background=dark ]])
vim.cmd([[ command! Light set background=light ]])
