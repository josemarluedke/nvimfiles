set nocompatible " be iMproved

if !isdirectory(expand("~/.vim/plug/.git"))
  !git clone git://github.com/junegunn/vim-plug.git ~/.vim/plug
        \ && mkdir ~/.vim/autoload
        \ && cp ~/.vim/plug/plug.vim ~/.vim/autoload/plug.vim
endif

call plug#begin('~/.vim/plugged')

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
Plug 'Quramy/vim-js-pretty-template'

"--------------------------
" tools to explore the file system
"--------------------------
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

"--------------------------
" filetype syntax highlight
"--------------------------
" Plug 'nvim-treesitter/nvim-treesitter'
" Polyglot
let g:polyglot_disabled = ['handlebars']
Plug 'sheerun/vim-polyglot'

Plug 'joukevandermaas/vim-ember-hbs'
Plug 'hail2u/vim-css3-syntax'

"--------------------------
" color scheme
"--------------------------
Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'mhartington/oceanic-next'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'drewtempelmeyer/palenight.vim'

"--------------------------
" snippets
"--------------------------
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'josemarluedke/ember-vim-snippets'

" Add plugins to &runtimepath
call plug#end()
