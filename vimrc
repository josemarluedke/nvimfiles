" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ---------------------------------------------------------------------------
" Macros
" ---------------------------------------------------------------------------
silent! runtime macros/matchit.vim

" ---------------------------------------------------------------------------
" Plugins
" ---------------------------------------------------------------------------

silent! runtime bundles.vim

" ---------------------------------------------------------------------------
" General
" ---------------------------------------------------------------------------

filetype plugin indent on
let mapleader = "\\"
let g:mapleader = "\\"
syntax enable

" do not create backup, swap file, use git for version managment
set nobackup
set nowritebackup
set noswapfile

" This means that you can have unwritten changes to a file and open a new file
" using :e, without being forced to write or undo your changes first.
set hidden

set history=1000  "store lots of :cmdline history

" Powerline
let g:Powerline_symbols = 'fancy'

" Markdown
let g:vim_markdown_folding_disabled=1

" Closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx"

" Set character encoding to use in vim
set encoding=utf-8

" Let vim know what encoding we use in our terminal
set termencoding=utf-8

" Add '-' as recognized word symbol. e.g dw delete all 'foo-bar' instead just 'foo'
set iskeyword+=-

" Show matching brackets
set showmatch

" Make < and > match as well
set matchpairs+=<:>

" Use 256 colors in vim
set t_Co=256

" ---------------------------------------------------------------------------
" UI
" ---------------------------------------------------------------------------

set title				 " make your xterm inherit the title from Vim
set encoding=utf-8
set autoindent
set smartindent
set showmode     " show current mode down the bottom
set showcmd      " show incomplete cmds down the bottom
set hidden			 " hides buffers instead of closing them
set wildmenu
set wildmode=list:longest
set wildcharm=<TAB> " Autocmpletion hotkey
set visualbell
set cursorline	 " highlight current line
set ttyfast
set backspace=indent,eol,start  "allow backspacing over everything in insert mode
set laststatus=2 " display the status line always
set nonumber
set relativenumber " show relative numbers
set splitbelow
set splitright
set novisualbell " Mute error bell

" some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

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

" Open new tab
nmap <silent><leader>to :tabnew .<CR>

" Replace
nmap <leader>s :%s//<left>
vmap <leader>s :s//<left>

" Disable directions key navigation
noremap <up>    :echoerr 'Use K to go up'<CR>
noremap <down>  :echoerr 'Use J to go down'<CR>
noremap <left>  :echoerr 'Use H to go left'<CR>
noremap <right> :echoerr 'Use L to go right'<CR>
" Disable it in insert mode
"inoremap <up>    <ESC>:echoerr 'Use K to go up'<CR>
"inoremap <down>  <ESC>:echoerr 'Use J to go down'<CR>
"inoremap <left>  <ESC>:echoerr 'Use H to go left'<CR>
"inoremap <right> <ESC>:echoerr 'Use L to go right'<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>rv :so $MYVIMRC<CR>

nmap :E :e
nmap :W :w

" \a to Silver Searcher (search in files)
nnoremap <leader>a :Ag!<space>
nnoremap <leader>f :CtrlP<cr>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

"Key mapping for textmate-like indentation
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" turn search highlight off
nnoremap <leader><space> :noh<cr>

" Windows switch
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" ---------------------------------------------------------------------------
" Tabularize
" ---------------------------------------------------------------------------

nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

" ---------------------------------------------------------------------------
" Ruby/Rails
" ---------------------------------------------------------------------------

map <leader>gv :CtrlP app/views<cr>
map <leader>gc :CtrlP app/controllers<cr>
map <leader>gm :CtrlP app/models<cr>
map <leader>gh :CtrlP app/helpers<cr>
map <leader>gl :CtrlP lib<cr>
map <leader>gp :CtrlP public<cr>
map <leader>gs :CtrlP public/stylesheets<cr>
map <leader>ga :CtrlP app/assets<cr>

" Skip to Model, View or Controller
map <Leader>m :Rmodel
map <Leader>v :Rview
map <Leader>c :Rcontroller

" Execute current buffer as ruby
map <S-r> :w !ruby<CR>

" View routes or Gemfile in large split
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft :split Gemfile<cr>

" Rspec.vim mappings
map <Leader>rt :call RunCurrentSpecFile()<CR>
map <Leader>rs :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>

" ---------------------------------------------------------------------------
" Plugins
" ---------------------------------------------------------------------------

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
silent! nmap <silent> <Leader>] :NERDTreeToggle<CR>

"-------------------------
" NERDCommenter mappings
if has("gui_macvim") && has("gui_running")
  map <D-/> <plug>NERDCommenterToggle<CR>
  imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i
else
  map <leader>/ <plug>NERDCommenterToggle<CR>
  imap <leader>/ <Esc><plug>NERDCommenterToggle<CR
endif

"-------------------------
" Tagbar
map <leader>l :TagbarToggle <cr>
let g:tagbar_autofocus=1

" Generate ctags for all bundled gems as well
map <leader>rtg :!ctags --extra=+f --languages=-javascript --exclude=.git --exclude=log -R * `rvm gemdir`/gems/* `rvm gemdir`/bundler/gems/*<CR><C-M>

" Use only current file to autocomplete from tags
" set complete=.,t
set complete=.,w,b,u,t,i

"-------------------------
" DelimitMate

" Delimitmate place cursor correctly n multiline objects e.g.
" if you press enter in {} cursor still be
" in the middle line instead of the last
let delimitMate_expand_cr = 1

" Delimitmate place cursor correctly in singleline pairs e.g.
" if x - cursor if you press space in {x} result will be { x } instead of { x}
let delimitMate_expand_space = 1

let delimitMate_matchpairs = "(:),[:],{:}"

" ---------------------------------------------------------------------------
" Functions
" ---------------------------------------------------------------------------

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
		" Only strip whitespace if isn't a slim, haml or emblem file
		if &filetype =~ 'slim' || &filetype =~ 'haml' || &filetype =~ 'emblem'
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
" GUI
" ---------------------------------------------------------------------------

" colorscheme
color railscasts

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
    set guifont=Monospace\ Bold\ 12
  endif

  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif

  if has("gui_win32") || has("gui_win32s")
    set guifont=Consolas:h12
  endif
else
	"dont load csapprox if there is no gui support - silences an annoying warning
	let g:CSApprox_loaded = 1

	"set railscasts colorscheme when running vim in gnome terminal
	if $COLORTERM == 'gnome-terminal'
		set term=gnome-256color
	else
		if $TERM == 'xterm'
			set term=xterm-256color
		else
			colorscheme molokai
		endif
	endif
endif

" listchars only for slim and haml files
autocmd BufNewFile,BufRead *.slim,*.haml,*.emblem setlocal list listchars=extends:>,precedes:<,eol:¬

" ---------------------------------------------------------------------------
" Column color
" ---------------------------------------------------------------------------

set colorcolumn=80
highlight ColorColumn guibg=#1e1e1e
highlight clear SignColumn

" ---------------------------------------------------------------------------
" Load custom configs
" ---------------------------------------------------------------------------

if filereadable(expand("$HOME/") . '.vimrc.local')
  source ~/.vimrc.local
endif
