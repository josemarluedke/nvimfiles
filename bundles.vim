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
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'danro/rename.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'jszakmeister/vim-togglecursor'
Plug 'nelstrom/vim-visual-star-search'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'sickill/vim-pasta'
Plug 'AndrewRadev/ember_tools.vim'
Plug 'Shougo/denite.nvim'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'ervandew/supertab'

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
" vim-go must be before vim-polyglot
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sheerun/vim-polyglot'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'hail2u/vim-css3-syntax'
Plug 'barboza/vim-cucumber-string-highlight'
Plug 'jparise/vim-graphql'

"--------------------------
" color scheme
"--------------------------
Plug 'endel/vim-github-colorscheme'
Plug 'tomasr/molokai'
Plug 'daylerees/colour-schemes', { 'rtp': 'vim' }
Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'dracula/vim'
Plug 'junegunn/seoul256.vim'
Plug 'mhartington/oceanic-next'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

"--------------------------
" snippets
"--------------------------
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'josemarluedke/ember-vim-snippets'

" Add plugins to &runtimepath
call plug#end()
