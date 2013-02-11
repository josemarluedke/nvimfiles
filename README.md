# Great vimfiles for Ruby/Rails development

Support for Rails, Git, RVM, Sparkup, Haml, Slim, Sass, CoffeeScript, Markdown and Jade with nice colour schemes.

## Requirements

Vim 7.3 or better Tested on MacOS

## Quick Install

	curl https://raw.github.com/josemarluedke/vimfiles/master/install.sh -o - | sh

## Usage


### Basic Mappings

The leader is mapped to \


#### In Normal mode (Esc)

`\p` - File browser (NerdTree)

`\f` - Find in Files (Command-t)

`\a` - Search in files (Ack)

`\Space` - Remove search highlighting

`Command + /` (with gui) and `\/` (without gui) - Toggle comments (NERD Commenter)

`\m` - Jump to model

`\v` - Jump to view

`\gm` - Find in app/models

`\gc` - Find in app/controller

`\gv` - Find in app/views

`\gr` - Open routes in split

`\gg` - Open Gemfile in split


#### In Insert mode (i)

`<tab>` - auto complete or expand snippet

See .vimrc for more.


## Installation

Note: If you are using RVM make sure you use system ruby before installation.
    
    rvm use system

Note: If you already have Vim installed ensure it has support for Ruby:

    vim --version | grep ruby

You should see `+ruby,` if you see `-ruby` you need to reinstall Vim with Ruby support

### Install Vim (if not already installed)

#### MacOS: MacVim / Vim 

    brew install macvim --override-system-vim --enable-clipboard

Add `/usr/local/bin` before `/usr/bin` in your `$PATH` so you use the version of
vim installed by Homebrew, not the one that comes with MacOS.

By installing Vim in this way MacVim and regular Vim are exactly the same.

#### Ubuntu: gVim / Vim

*Server*

    apt-get install vim-nox

*Desktop*

    apt-get install vim-gnome

#### GNU/Linux from source

If you have an old GNU/Linux distro which does not have Vim 7.3 or better in its repos then install from source.

The configure options below leave out any GUI related features as I have only compiled Vim on a server.

Vim source is in a hg (Mercurial) repository so you need to install the hg
client first, e.g.  `sudo apt-get install mercurial`.

    hg clone https://vim.googlecode.com/hg/ vim
    cd vim/vim73
    ./configure
    ./configure --with-features=huge --enable-cscope --enable-pythoninterp --enable-rubyinterp --enable-perlinterp --enable-multibyte
    make
    sudo make install

This installs Vim to `/usr/local/bin,` check this is in your `$PATH` before `/usr/bin` which may contain an older system version of Vim.

If you get an error `no terminal library found` install `libncurses5-dev`.

### Install these vimfiles

Note: You will already have a `~/.vim` folder, either delete or move it.

    mv ~/.vim ~/.vim.old
    git clone https://github.com/josemarluedke/vimfiles ~/.vim
    cd ~/.vim
    rake install

or run:

    curl https://raw.github.com/josemarluedke/vimfiles/master/install.sh -o - | sh

#### To update to the latest vimfiles

    cd ~/.vim
    rake update

#### Install Dependacies

*MacOS*

    brew install ack
    brew install ctags

Alternative to Ack

	brew install the_silver_searcher

More info [here](https://github.com/ggreer/the_silver_searcher).

Note: MacOS comes with the BSD version of ctags which is not compatible.

*Ubuntu*

    sudo apt-get install exuberant-ctags
    sudo apt-get install ack-grep
    sudo ln -s /usr/bin/ack-grep /usr/local/bin/ack

## Thanks for inspiration

- [@krisleech](https://github.com/krisleech) for him [vimfiles](https://github.com/krisleech/vimfiles/)
- [@wongyouth](https://github.com/wongyouth) for him [vimfiles](https://github.com/wongyouth/vimfiles)
- [@dcrec1](https://github.com/dcrec1) for [strip trailing whitespace](https://github.com/akitaonrails/vimfiles/commit/b9299f3570653ea70870a7b208eccd553523bddb)
