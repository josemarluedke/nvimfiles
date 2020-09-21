" Use Vim settings, rather then Vi settings (much better!).
set nocompatible

" Plugins
silent! runtime bundles.vim

" ---------------------------------------------------------------------------
" General
" ---------------------------------------------------------------------------

filetype plugin indent on
let mapleader = ","
let g:mapleader = ","
syntax enable
set autoread
set timeoutlen=500 ttimeoutlen=0 " Avoid delays

" do not create backup, swap file, use git for version management
set nobackup
set nowritebackup
set noswapfile

" This means that you can have unwritten changes to a file and open a new file
" using :e, without being forced to write or undo your changes first.
set hidden

set history=1000  "store lots of :cmdline history

" Set character encoding to use in vim
set encoding=utf-8
set termencoding=utf-8

" Add '-' as recognized word symbol. e.g dw delete all 'foo-bar' instead just 'foo'
set iskeyword+=-

" Show matching brackets
set showmatch
set matchpairs+=<:> " Make < and > to match

" Use 256 colors in vim
set t_Co=256

" Spell
autocmd FileType gitcommit setlocal spell
autocmd FileType markdown setlocal spell
set complete+=kspell

" Copy to osx clipboard
vnoremap <C-c> "*y<CR><Paste>
vnoremap <C-c> "*y<CR>
vnoremap y "*y<CR>
nnoremap Y "*Y<CR>

" ---------------------------------------------------------------------------
" UI
" ---------------------------------------------------------------------------

set title        " make your xterm inherit the title from Vim
set autoindent
set smartindent
set showmode     " show current mode down the bottom
set showcmd      " show incomplete cmds down the bottom
set hidden       " hides buffers instead of closing them
set wildmenu
set wildmode=list:longest
set wildcharm=<TAB> " Autocmpletion hotkey
set visualbell t_vb=
set cursorline   " highlight current line
set ttyfast
set backspace=indent,eol,start  "allow backspacing over everything in insert mode
set laststatus=2 " display the status line always
set nonumber
set relativenumber number " show relative numbers
set splitbelow
set splitright
set list
set completeopt=longest,menuone
" set listchars=trail:·

" some stuff to get the mouse going in term
set mouse=a
if !has('nvim')
  set ttymouse=xterm2
endif

" ---------------------------------------------------------------------------
" Text Formatting
" ---------------------------------------------------------------------------

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab!

set nowrap
set textwidth=79
set formatoptions=n

" ---------------------------------------------------------------------------
" Mappings
" ---------------------------------------------------------------------------

" Remap ; to :
nnoremap ; :

" Open new tab
nmap <silent><leader>t :tabnew<CR>

" Replace
nmap <leader>s :%s//<left>
vmap <leader>s :s//<left>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>rv :so $MYVIMRC<CR>

nmap :E :e
nmap :W :w

if exists(':tnoremap')
  tnoremap <C-H> <C-\><C-N><C-W>h
  tnoremap <C-J> <C-\><C-N><C-W>j
  tnoremap <C-K> <C-\><C-N><C-W>k
  tnoremap <C-L> <C-\><C-N><C-W>l

  " Use Esc to enter normal mode in term
  tnoremap <Esc> <C-\><C-n>
endif

" Workaround for Neovim
if has('nvim')
  nmap <BS> <C-W>h
endif

" bind K to grep word under cursor
nnoremap <silent> K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
vnoremap <silent> K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Show the path of the current file
nnoremap <Leader>e :echo expand('%')<CR>

" Map t to FZF's Files
nnoremap <silent> t :Files<cr>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

"Key mapping for textmate-like indentation
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Align blocks of text and keep them selected
vmap < <gv
vmap > >gv

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" turn search highlight off
nnoremap <leader><space> :noh<cr>

" Format json strings
com! FormatJSON %!python -m json.tool

" ---------------------------------------------------------------------------
" Ember
" ---------------------------------------------------------------------------

map <leader>ec :FZF app/components<cr>
map <leader>et :FZF app/templates<cr>
map <leader>em :FZF app/models<cr>
map <leader>eh :FZF app/helpers<cr>
map <leader>eo :FZF app/routes<cr>
map <leader>es :FZF app/services<cr>
map <leader>ep :topleft :split package.json<cr>

" ---------------------------------------------------------------------------
" Golang configs
" ---------------------------------------------------------------------------

" For .go files, use tabs instead of spaces
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=2 shiftwidth=2 nolist

let g:go_fmt_command = "goimports"
let g:go_addtags_transform = "snakecase"
let g:go_def_mapping_enabled = 0

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
let g:go_highlight_generate_tags = 1
let g:go_highlight_string_spellcheck = 2
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

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
set laststatus=2
let g:airline_theme = "palenight"
 " let g:airline_theme = 'base16_nord'
let g:airline_powerline_fonts = 0
let g:airline_symbols = { 'linenr': '␤ ', 'branch': '⎇ ' }
let g:airline_inactive_collapse=0
let g:airline#extensions#branch#enabled = 1
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
" Autosave
" ---------------------------------------------------------------------------

" Strip trailing whitespaces then save all files on focus lost
autocmd FocusLost * :call <SID>StripTrailingWhitespaces() | silent! wa

" ---------------------------------------------------------------------------
" GUI
" ---------------------------------------------------------------------------

" colorscheme
if !exists("g:gui_oni")
  if has('nvim')
    set background=dark
    colorscheme palenight
    " colorscheme onedark
    " colorscheme challenger_deep
    let g:neodark#background = '#202020'
    let g:palenight_terminal_italics=1
  else
    " color onedark
    color OceanicNext
  endif
endif

if has("gui_running")
  set guioptions-=T " no toolbar set guioptions-=m " no menus
  set guioptions-=r " no scrollbar on the right
  set guioptions-=R " no scrollbar on the right
  set guioptions-=l " no scrollbar on the left
  set guioptions-=b " no scrollbar on the bottom
  set guioptions-=L "no scrollbar on the nerdtree"

  set guitablabel=%M%t

  if has("gui_gnome")
    set term=gnome-256color
    set guifont=Ubuntu\ Mono\ 12
  endif

  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
  endif

  if has("gui_win32") || has("gui_win32s")
    set guifont=Consolas:h12
  endif
else
  set novisualbell " Mute error bell

  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif
endif

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
" https://github.com/neoclide/coc.nvim
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
vmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)

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
