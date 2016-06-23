set nocompatible " be iMproved

if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
endif

"------------------------------------------------------------
" when in Mac osx vi, if filetype is already off,
" calling filetype off causes a bad exit status
"------------------------------------------------------------
filetype on
filetype off " required by vundle!

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
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'danro/rename.vim'
Bundle 'vim-scripts/loremipsum'
Bundle 'bling/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'vim-scripts/Gist.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'airblade/vim-gitgutter'
Bundle 'alvan/vim-closetag'
Bundle 'Shougo/neocomplete.vim'
Bundle 'jszakmeister/vim-togglecursor'
Bundle 'josemarluedke/vim-rspec'
Bundle 'adinapoli/vim-markmultiple'

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
Bundle 'vim-ruby/vim-ruby'
Bundle 'solarnz/thrift.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'depuracao/vim-rdoc'
Bundle 'nono/vim-handlebars'
Bundle 'slim-template/vim-slim'
Bundle 'oguzbilgic/sexy-railscasts-theme'
Bundle 'jpo/vim-railscasts-theme'
Bundle '29decibel/codeschool-vim-theme'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'elzr/vim-json'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'elixir-lang/vim-elixir'
Plugin 'rust-lang/rust.vim'
Bundle 'barboza/vim-cucumber-string-highlight'
Plugin 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsx'

"--------------------------
" color scheme
"--------------------------
Bundle 'rickharris/vim-blackboard'
Bundle 'altercation/vim-colors-solarized'
Bundle 'endel/vim-github-colorscheme'
Bundle 'tomasr/molokai'
Bundle 'daylerees/colour-schemes', { 'rtp': 'vim' }
Bundle 'blerins/flattown'
Bundle 'chriskempson/base16-vim'
Bundle 'geoffharcourt/one-dark.vim'

"--------------------------
" snipmate
"--------------------------
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
