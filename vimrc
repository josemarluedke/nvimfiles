"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

silent! runtime bundles.vim

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

"Powerline
let g:Powerline_symbols = 'fancy'

" ---------------------------------------------------------------------------
" UI
" ---------------------------------------------------------------------------

set title
set encoding=utf-8

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

set autoindent
set smartindent
set showmode     "show current mode down the bottom
set showcmd      "show incomplete cmds down the bottom
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start  "allow backspacing over everything in insert mode
set laststatus=2
set number
set relativenumber
set undofile
set incsearch    "find the next match as we type the search
set hlsearch     "hilight searches by default

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

" Ctags path (brew install ctags)
let Tlist_Ctags_Cmd = 'ctags'

" ---------------------------------------------------------------------------
" Text Formatting
" ---------------------------------------------------------------------------

set tabstop=2
set shiftwidth=2
set softtabstop=2

set nowrap
set textwidth=79
set formatoptions=n

" ---------------------------------------------------------------------------
" Status Line
" ---------------------------------------------------------------------------

" path
set statusline=%f
" flags
set statusline+=%m%r%h%w
" git branch
set statusline+=\ %{fugitive#statusline()}
" encoding
set statusline+=\ [%{strlen(&fenc)?&fenc:&enc}]
" rvm
set statusline+=\ %{rvm#statusline()}
" line x of y
set statusline+=\ [line\ %l\/%L]

" Colour
hi StatusLine ctermfg=Black ctermbg=White

" Change colour of statusline in insert mode
au InsertEnter * hi StatusLine ctermbg=DarkBlue
au InsertLeave * hi StatusLine ctermfg=Black ctermbg=White

" ---------------------------------------------------------------------------
" Mappings
" ---------------------------------------------------------------------------

" \a to Ack (search in files)
nnoremap <leader>a :Ack
nnoremap <leader>f :CtrlP<cr>

"Key mapping for textmate-like indentation
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

set hlsearch
" turn search highlight off
nnoremap <leader><space> :noh<cr>

" ---------------------------------------------------------------------------
" Ruby/Rails
" ---------------------------------------------------------------------------

" Skip to Model, View or Controller
map <Leader>m :Rmodel
map <Leader>v :Rview
map <Leader>c :Rcontroller

" Execute current buffer as ruby
map <S-r> :w !ruby<CR>

" View routes or Gemfile in large split
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft :split Gemfile<cr>


" ---------------------------------------------------------------------------
" Plugins
" ---------------------------------------------------------------------------

" NERDTree
let NERDTreeShowBookmarks = 0
let NERDChristmasTree = 1
let NERDTreeWinPos = "left"
let NERDTreeHijackNetrw = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeWinSize = 30
let NERDTreeChDirMode = 2
let NERDTreeDirArrows = 1
silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>

" NERDCommenter mappings
if has("gui_macvim") && has("gui_running")
  map <D-/> <plug>NERDCommenterToggle<CR>
  imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i
else
  map <leader>/ <plug>NERDCommenterToggle<CR>
  imap <leader>/ <Esc><plug>NERDCommenterToggle<CR
endif

" TagList
set tags=./tags;
" Support for https://github.com/ivalkeen/guard-ctags-bundler
set tags+=gems.tags
map <leader>l :TlistToggle <cr>
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 60
" Generate ctags for all bundled gems as well
map <leader>rt :!ctags --extra=+f --languages=-javascript --exclude=.git --exclude=log -R * `rvm gemdir`/gems/* `rvm gemdir`/bundler/gems/*<CR><C-M>

" Use only current file to autocomplete from tags
" set complete=.,t
set complete=.,w,b,u,t,i


" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
		" Only strip whitespace if isn't a slim file
		if &filetype =~ 'slim'
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

"  ---------------------------------------------------------------------------
"  GUI
"  ---------------------------------------------------------------------------

" colorscheme
color solarized

if has("gui_running")
  set guioptions-=T " no toolbar set guioptions-=m " no menus
  set guioptions-=r " no scrollbar on the right
  set guioptions-=R " no scrollbar on the right
  set guioptions-=l " no scrollbar on the left
  set guioptions-=b " no scrollbar on the bottom
  set guioptions-=L "no scrollbar on the nerdtree"

  "tell the term has 256 colors
   set t_Co=256

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
    set enc=utf-8
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
			colorscheme default
		endif
	endif
endif

" listchars only for slim and haml files
autocmd BufNewFile,BufRead *.slim,*.haml setlocal list listchars=extends:>,precedes:<,eol:¬
