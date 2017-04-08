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
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-projectionist'

"--------------------------
" utility
"--------------------------
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neocomplete.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'danro/rename.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'josemarluedke/airline-tabline-folder-formatter.vim'
Plug 'vim-scripts/Gist.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'jszakmeister/vim-togglecursor'
Plug 'josemarluedke/vim-rspec'
Plug 'nelstrom/vim-visual-star-search'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'sickill/vim-pasta'
Plug 'AndrewRadev/ember_tools.vim'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neoyank.vim'
Plug 'junegunn/goyo.vim'

"--------------------------
" tools to explore the file system
"--------------------------
Plug 'corntrace/bufexplorer'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/ctags.vim'
Plug 'mileszs/ack.vim'
Plug 'epmatsw/ag.vim'
Plug 'vim-scripts/BufOnly.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

"--------------------------
" filetype syntax highlight
"--------------------------
Plug 'vim-ruby/vim-ruby'
Plug 'solarnz/thrift.vim', { 'for': 'thrift' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'joukevandermaas/vim-ember-hbs', { 'for': 'handlebars' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'hail2u/vim-css3-syntax'
Plug 'elixir-lang/vim-elixir'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'barboza/vim-cucumber-string-highlight'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': ['jsx', 'javascript'] }
Plug 'evanmiller/nginx-vim-syntax'
Plug 'ekalinin/Dockerfile.vim'
Plug 'leafgarland/typescript-vim'

" TypeScript
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Quramy/tsuquyomi'

"--------------------------
" color scheme
"--------------------------
Plug 'endel/vim-github-colorscheme'
Plug 'tomasr/molokai'
Plug 'daylerees/colour-schemes', { 'rtp': 'vim' }
Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/seoul256.vim'

"--------------------------
" snippets
"--------------------------
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'josemarluedke/ember-vim-snippets'

" Add plugins to &runtimepath
call plug#end()
