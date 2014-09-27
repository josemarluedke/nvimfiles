set nocompatible " be iMproved

if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
endif

"------------------------------------------------------------
" when in Mac osx vi, if filetype is already off,
" calling filetype off causes a bad exit status
"------------------------------------------------------------
filetype on
filetype off " required!

"--------------------
" enable vundle
"--------------------
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

"--------------------------
" tpope plugins
"--------------------------
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rbenv'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-endwise'

"--------------------------
" utility
"--------------------------
Bundle 'edsono/vim-matchit'
Bundle 'Raimondi/delimitMate'
Bundle 'vim-scripts/jsbeautify'
Bundle 'scrooloose/nerdcommenter'
Bundle 'godlygeek/tabular'
Bundle 'mattn/emmet-vim'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'danro/rename.vim'
Bundle 'vim-scripts/loremipsum'
Bundle 'vim-ruby/vim-ruby'
Bundle 'lucapette/vim-ruby-doc'
Bundle 'lucapette/vim-jquery-doc'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-powerline'
Bundle 'skalnik/vim-vroom'
Bundle 'vim-scripts/Gist.vim'
Bundle 'josemarluedke/vim-rspec'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'airblade/vim-gitgutter'

"--------------------------
" tool for explorer
"--------------------------
Bundle 'corntrace/bufexplorer'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/ctags.vim'
Bundle 'mileszs/ack.vim'
Bundle 'epmatsw/ag.vim'
Bundle 'vim-scripts/BufOnly.vim'

"--------------------------
" filetype syntax highlight
"--------------------------
Bundle 'groenewege/vim-less'
Bundle 'kchmck/vim-coffee-script'
Bundle 'plasticboy/vim-markdown'
Bundle 'depuracao/vim-rdoc'
Bundle 'mamut/vim-css-hex'
Bundle 'nono/vim-handlebars'
Bundle 'slim-template/vim-slim'
Bundle 'shmay/vim-emblem'
Bundle 'tpope/vim-haml'
Bundle 'statianzo/vim-jade'
Bundle 'oguzbilgic/sexy-railscasts-theme'
Bundle 'jpo/vim-railscasts-theme'
Bundle '29decibel/codeschool-vim-theme'
Bundle 'puppetlabs/puppet-syntax-vim'

"--------------------------
" color scheme
"--------------------------
Bundle 'rickharris/vim-blackboard'
Bundle 'altercation/vim-colors-solarized'
Bundle 'endel/vim-github-colorscheme'
Bundle 'tomasr/molokai'
Bundle "daylerees/colour-schemes", { "rtp": "vim" }

"--------------------------
" snipmate
"--------------------------
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
