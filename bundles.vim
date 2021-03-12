if !isdirectory(expand("~/.config/nvim/plug/.git"))
  !git clone git://github.com/junegunn/vim-plug.git ~/.config/nvim/plug
        \ && mkdir ~/.config/nvim/autoload
        \ && cp ~/.config/nvim/plug/plug.vim ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')

"--------------------------
" tpope plugins
"--------------------------
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-projectionist'

"--------------------------
" utility
"--------------------------
Plug 'scrooloose/nerdcommenter'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'danro/rename.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jszakmeister/vim-togglecursor'
Plug 'nelstrom/vim-visual-star-search'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'sickill/vim-pasta'
Plug 'AndrewRadev/ember_tools.vim'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'ervandew/supertab'
" Plug 'Quramy/vim-js-pretty-template'
Plug 'gregsexton/MatchTag'
Plug 'godlygeek/tabular',                 { 'for': 'markdown' } " Needed for vim-markdown
Plug 'plasticboy/vim-markdown',           { 'for': 'markdown' }

"--------------------------
" tools to explore the file system
"--------------------------
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"--------------------------
" filetype syntax highlight
"--------------------------
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'joukevandermaas/vim-ember-hbs'

"--------------------------
" color scheme
"--------------------------
Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ajmwagar/vim-deus'
Plug 'haishanh/night-owl.vim'

"--------------------------
" snippets
"--------------------------
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'josemarluedke/ember-vim-snippets'

" Add plugins to &runtimepath
call plug#end()
