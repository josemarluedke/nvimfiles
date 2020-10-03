" Plugins
silent! runtime bundles.vim

" ---------------------------------------------------------------------------
" General
" ---------------------------------------------------------------------------

filetype plugin indent on                       " enable indentations
syntax enable                                   " enable syntax  highlighting
set termguicolors                               " Opaque Background
set mouse=a                                     " enable mouse interaction
" set clipboard+=unnamedplus                      " use system clipboard by default
set expandtab smarttab                          " tab key actions
set incsearch ignorecase smartcase hlsearch     " highlight text while searching
set list listchars=trail:»,tab:»-               " use tab to navigate in list mode
set fillchars+=vert:\▏                          " requires a patched nerd font (try FiraCode)
set tabstop=2 shiftwidth=2 softtabstop=2        " use 2 spaces for tab
set nowrap                                      " don't wrap text
set encoding=utf-8                              " text encoding
set number                                      " enable numbers on the left
set relativenumber                              " current line is 0
set title                                       " tab title as file name
set autoindent smartindent                      " enable indentation
set conceallevel=2                              " set this so we wont break indentation plugin
set splitright                                  " open vertical split to the right
set splitbelow                                  " open horizontal split to the bottom
set emoji                                       " enable emojis
set history=1000                                " history limit
set backspace=indent,eol,start                  " allow backspacing over everything in insert mode
set undofile                                    " enable persistent undo
set undodir=/tmp                                " undo temp file directory
set nobackup nowritebackup noswapfile           " do not create backup, swap file, use git for version management
set inccommand=nosplit                          " visual feedback while substituting
set laststatus=2                                " display the status line always
set autoread                                    " auto read file changes
set timeoutlen=500 ttimeoutlen=0                " avoid delays
set iskeyword+=-                                " add '-' as recognized word symbol. e.g  'foo-bar' instead just 'foo'
set complete+=kspell                            " auto complete spell words
set updatetime=300                              " default is 4000 ms which leads to noticeable delays and poor user experience.
set shortmess+=c                                " don't pass messages to |ins-completion-menu|.
set noshowmode                                  " don't show modes at the bottom, let airline do it
set hidden                                      " hides buffers instead of closing them
set backspace=indent,eol,start                  " allow backspacing over everything in insert mode
set completeopt=longest,menuone                 " show menu even if there is only one item
set showmatch                                   " show matching brackets
set matchpairs+=<:>                             " make < and > to match
set grepprg=rg\ --vimgrep                       " use rg as default grepper
set colorcolumn=80                              " column width with color
highlight clear SignColumn                      " clear the color for signcolumn

" performance tweaks
set nocursorline
set nocursorcolumn
set synmaxcol=180

" Spell: enable spell only if file type is normal text
let spellable = ['markdown', 'gitcommit', 'txt', 'text', 'liquid', 'rst']
autocmd BufEnter * if index(spellable, &ft) < 0 | set nospell | else | set spell | endif

" ---------------------------------------------------------------------------
" Mappings
" ---------------------------------------------------------------------------

let mapleader = ","

" Remap ; to :
nnoremap ; :
nmap :E :e
nmap :W :w
nmap :Q :q

" Open new tab
nmap <silent><leader>t :tabnew<CR>

" Replace
nmap <leader>s :%s//<left>
vmap <leader>s :s//<left>

" Copy to osx clipboard
vnoremap <C-c> "*y<CR><Paste>
vnoremap <C-c> "*y<CR>
vnoremap y "*y<CR>
nnoremap Y "*Y<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>rv :source $MYVIMRC<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Terminal mappings
tnoremap <C-h> <C-\><C-N><C-W>h
tnoremap <C-j> <C-\><C-N><C-W>j
tnoremap <C-k> <C-\><C-N><C-W>k
tnoremap <C-l> <C-\><C-N><C-W>l
" Use Esc to enter normal mode in term
tnoremap <Esc> <C-\><C-n>

" Move selected line / block of text in visual mode
" shift + k to move up
xnoremap K :move '<-2<CR>gv-gv
" shift + j to move down
xnoremap J :move '>+1<CR>gv-gv

" bind F to grep word under cursor
nnoremap <silent> F :Ag <C-R><C-W><CR>
vnoremap <silent> F :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Show the path of the current file
nnoremap <Leader>e :echo expand('%')<CR>

" Map t to FZF's Files
nnoremap <silent> t :Files<cr>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Indent lines
nmap < <<
nmap > >>
vmap < <gv
vmap > >gv

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" turn search highlight off
nnoremap <leader><space> :noh<cr>

" Format json strings
com! FormatJSON %!python -m json.tool

" ---------------------------------------------------------------------------
" Golang configs
" ---------------------------------------------------------------------------

" Enhanced Go syntax highlighting
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
" let g:go_highlight_generate_tags = 1
let g:go_highlight_string_spellcheck = 2
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_function_calls = 1

" For .go files, use tabs instead of spaces
autocmd BufNewFile,BufRead *.go,*.go.tpl setlocal noexpandtab tabstop=2 shiftwidth=2 nolist

" ---------------------------------------------------------------------------
" Syntax highlight for unsual filetypes
" ---------------------------------------------------------------------------

au BufRead,BufNewFile nginx.conf if &ft == '' | setfiletype nginx | endif
au BufRead,BufNewFile Dockerfile.dev if &ft == '' | setfiletype Dockerfile | endif
au BufRead,BufNewFile *.go.tpl set filetype=gotexttmpl

" ---------------------------------------------------------------------------
" Plugins
" ---------------------------------------------------------------------------

"-------------------------
" FZF
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let g:fzf_preview_window = 'right:50%'
let $FZF_DEFAULT_OPTS='--reverse --color=bg+:-1'
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**'"

"-------------------------
" NERDTree
let NERDTreeShowBookmarks = 0
let NERDChristmasTree = 1
let NERDTreeWinPos = "left"
let NERDTreeHijackNetrw = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeWinSize = 30
let NERDTreeChDirMode = 2
let NERDTreeDirArrows = 1
let NERDTreeMinimalUI=1

silent! nmap <silent> <Leader>m :NERDTreeToggle<CR>
silent! nmap <silent> <leader>f :NERDTreeFind<cr>

"-------------------------
" NERDCommenter

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

map <leader>/ <plug>NERDCommenterToggle<CR>

"-------------------------
" Airline
let g:airline_theme = "palenight"
 " let g:airline_theme = 'base16_nord'
let g:airline_powerline_fonts = 0
let g:airline_symbols = { 'linenr': '␤ ', 'branch': '⎇ ' }
let g:airline_inactive_collapse=0
let g:airline#extensions#branch#enabled = 1 " enable branch extention
let g:airline#extensions#ale#enabled = 1 " enable ale extention
let g:airline_mode_map = {
      \ 'n' : 'N',
      \ 'i' : 'I',
      \ 'R' : 'REPLACE',
      \ 'v' : 'VISUAL',
      \ 'V' : 'V-LINE',
      \ 'c' : 'CMD   ',
      \ '': 'V-BLCK',
      \ }

" Sparkup
" Enable sparkup in handlebars files
autocmd FileType handlebars runtime! ftplugin/html/sparkup.vim
autocmd FileType html.handlebars runtime! ftplugin/html/sparkup.vim

"-------------------------
" Markdown
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_fenced_languages = [
  \ 'js=javascript',
  \ 'ts=typescript=ts',
  \ 'rb=ruby',
  \ 'hbs=handlebars'
  \ ]

"-------------------------
" ALE Linting
let g:ale_disable_lsp = 1 " Let Coc manage LSP
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1

let g:ale_fixers = {
\  'javascript': ['prettier'],
\  'json': ['prettier'],
\  'typescript': ['prettier'],
\  'graphql': ['prettier'],
\  'go': ['goimports', 'gofmt'],
\  'yaml': ['prettier'],
\  'scss': ['prettier'],
\  'css': ['prettier'],
\  'elixir': ['mix_format'],
\  'terraform': ['terraform']
\}

"-------------------------
" vim-js-pretty-template

" Allow for named template literals to be highlighted
" in a different syntax than the main buffer.
function EnableTemplateLiteralColors()
  " list of named template literal tags and their syntax here
  call jspretmpl#register_tag('hbs', 'handlebars')
  call jspretmpl#register_tag('gql', 'graphql')

  autocmd FileType javascript JsPreTmpl
  autocmd FileType typescript JsPreTmpl
endfunction

call EnableTemplateLiteralColors()

" ---------------------------------------------------------------------------
" Strip trailing whitespace
" ---------------------------------------------------------------------------
"
function! <SID>StripTrailingWhitespaces()
  " Don't try to strip whitespace in non buffers
  if (!empty(&buftype))
    return
  endif

  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

"
" ---------------------------------------------------------------------------
" Autosave
" ---------------------------------------------------------------------------

" Strip trailing whitespaces then save all files on focus lost
autocmd FocusLost * :call <SID>StripTrailingWhitespaces() | silent! wa

" ---------------------------------------------------------------------------
" Add support to go to file in JS without file extention
" ---------------------------------------------------------------------------
augroup suffixes
  autocmd!
  let associations = [
    \ ["javascript", ".js,.ts,.json,.jsx,.graphql"],
    \ ["typescript", ".js,.ts,.json,.jsx,.graphql"]]

  for ft in associations
    execute "autocmd FileType " . ft[0] . " setlocal suffixesadd=" . ft[1]
  endfor
augroup END


" ---------------------------------------------------------------------------
" GUI
" ---------------------------------------------------------------------------

" colorscheme
set background=dark
colorscheme palenight
" colorscheme challenger_deep
" colorscheme onedark
let g:neodark#background = '#202020'
let g:palenight_terminal_italics=1

" listchars only for slim and haml files
autocmd BufNewFile,BufRead *.slim,*.haml,*.emblem setlocal list listchars=extends:>,precedes:<,eol:¬

" ---------------------------------------------------------------------------
" SuperTab & Auto Complete
" ---------------------------------------------------------------------------
let g:SuperTabDefaultCompletionType = "<c-n>"

function! s:AcceptAutoCompleteOrReturnNewline()
  if pumvisible()
    return "\<C-y>"
  else
    return "\<C-g>u\<CR>"
  endif
endfunction
inoremap <silent> <CR> <C-r>=<SID>AcceptAutoCompleteOrReturnNewline()<CR>

" ---------------------------------------------------------------------------
" coc.nvim
" ---------------------------------------------------------------------------

" Default Extensions:
let g:coc_global_extensions = [
      \ "coc-tsserver",
      \ "coc-go",
      \ "coc-json",
      \ "coc-html",
      \ "coc-css",
      \ "coc-highlight",
      \ "coc-snippets",
      \ "coc-emmet",
      \ "coc-yaml",
      \ "coc-pairs",
      \ "coc-tailwindcss",
      \ "coc-ember",
      \ "coc-git",
      \ "coc-yank"]

" Use <c-space> for trigger completion.
imap <silent><expr> <c-space> coc#refresh()

" Use <space> + y to show the list of yank
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use K for show documentation in preview window
nmap <silent> K :call <SID>show_documentation()<CR>

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>F <Plug>(coc-format-selected)
nmap <leader>F <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Coc Multiline Cursor
nmap <expr> <silent> <c-d> <SID>select_current_word()
function! s:select_current_word()
  if !get(g:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc

" ---------------------------------------------------------------------------
" Load custom configs
" ---------------------------------------------------------------------------

if filereadable(expand("$HOME/") . '.vimrc.local')
  source ~/.vimrc.local
endif

" ---------------------------------------------------------------------------
" Load folder specific settings and disable unsafe commands
" ---------------------------------------------------------------------------
set exrc
set secure
