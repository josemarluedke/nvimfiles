# Great vimfiles for Ruby/Rails development

Support for Rails, Git, Sparkup, Haml, Slim, Sass, Less, Emblem, JSX, CoffeeScript, Markdown Rdoc, and Jade with nice colour schemes.



## Quick Install

```curl https://raw.github.com/josemarluedke/vimfiles/master/install.sh -o - | sh```

Please check also [install dependacies](#install-dependacies) section.

## Usage


### Basic Mappings

The leader is mapped to \


#### In Normal mode (Esc)

`\]` - File browser (NerdTree)

`\f` - Find in Files (Command-t)

`\a` - Search in files (Silver Searcher)

`\Space` - Remove search highlighting

`Command + /` (with gui) and `\/` (without gui) - Toggle comments (NERD Commenter)

`\m` - Jump to model

`\v` - Jump to view

`\gm` - Find in app/models

`\gc` - Find in app/controller

`\gv` - Find in app/views

`\ga` - Find in app/assets

`\gr` - Open routes in split

`\gg` - Open Gemfile in split

`Command + [` or `Command + ]` - Textmate-like indentation

`\l` - Open tag list (Tagbar)

`<C-h>` `<C-j>` `<C-k>` `<C-l>` - Switching between windows


#### In Insert mode (i)

`<tab>` - auto complete or expand snippet

See .vimrc for more.


## Plugins

### [Rails](https://github.com/tpope/vim-rails)

*Lots* of stuff - get to know this plugin!

`:Rmodel` - jump to model

`:Rview` - jump to view

`:help rails`

### [CoffeeScript](https://github.com/kchmck/vim-coffee-script)

CoffeeScript support

`:CoffeeCompile watch` show compiled js in split


### [Sparkup](https://github.com/rstacruz/sparkup) (`ctrl+e`)

Expand CSS selectors `div.event` in to markup `<div class='event'></div>`

http://net.tutsplus.com/articles/general/quick-tip-even-quicker-markup-with-sparkup/

### [Fugitive](https://github.com/tpope/vim-fugitive)

Git integration

*Lots* of stuff

`:Gstatus` and press `-` to stage file

http://vimcasts.org/episodes/fugitive-vim---a-complement-to-command-line-git/

`:help fugitive`

### [Abolish](https://github.com/tpope/vim-abolish)

Use:

	:%Subvert/facilit{y,ies}/building{,s}/g

Instead:

	:%s/facilities/buildings/g
	:%s/Facilities/Buildings/g
	:%s/FACILITIES/BUILDINGS/g

#### Coercion

Want to turn `fooBar` into `foo_bar`?  Press `crs` (coerce to snake\_case).  MixedCase (`crm`), camelCase (`crc`), snake\_case (`crs`), and UPPER\_CASE (`cru`) are all just 3 keystrokes away.

### [Rename](https://github.com/danro/rename.vim)

Rename the current file

	:rename[!] {newname}

### [Loremipsum](https://github.com/vim-scripts/loremipsum)

Insert a dummy text of a certain length

	:Loremipsum[!] [WORD	COUNT] [PARAGRAPH_TEMPLATE] [PREFIX POSTFIX]

### [Bufexplorer](https://github.com/corntrace/bufexplorer)

With bufexplorer, you can quickly and easily switch between buffers by using the one of the default public interfaces:

	'\be' (normal open)  or
	'\bs' (force horizontal split open)  or
	'\bv' (force vertical split open)

### [Jsbeautify](https://github.com/vim-scripts/jsbeautify) (`\ff`)

Format your javascript souce code.

### [BufOnly](https://github.com/vim-scripts/BufOnly.vim)

`:BufOnly` without an argument will unload all buffers but the current one.

`:BufOnly` with an argument will close all buffers but the supplied buffer name/number.

### [CtrlP](https://github.com/kien/ctrlp.vim) (`\f`)

Find files in your project with minimal keypresses

For example `conadus` would find `controllers/admin/users`

`/f path_or_filename`

`/gf path_or_filename` - restrict to files in current directory


### [Snipmate](https://github.com/garbas/vim-snipmate) (`TAB`)

Snippets, press `TAB` to expand

Examples (in a Ruby file):

`def<tab>`

`.each<tab>`

`.eado<tab>`

`ife<tab>`

### [Gist](https://github.com/vim-scripts/Gist.vim) (`:Gist`)

Gist current file/selection

Requires setting GITHUB_TOKEN and GITHUB_USER Env's


### [Tabular](https://github.com/godlygeek/tabular)

Align stuff

	 \a= :Tabularize /=
	 \a: :Tabularize /:
	 \a:: :Tabularize /:\zs
	 \a, :Tabularize /,
	 \<Bar> :Tabularize /<Bar>

http://vimcasts.org/episodes/aligning-text-with-tabular-vim/

### [Neerd Commenter](https://github.com/scrooloose/nerdcommenter) (`Command + /` or `\/`)

Comment/Uncomment stuff out


### [Ack](https://github.com/mileszs/ack.vim) (`\a`)

Search project for text (aka find in files)

`\a word`

`\a "some words"`

### [Ag](https://github.com/epmatsw/ag.vim) (`:Ag`)

Alternative of Ack, using 'the_silver_searcher' on homebrew.


### [Nerdtree](https://github.com/scrooloose/nerdtree) (`\]`)

Project file browser

`\]` opens file browser

`o` / `x` open and close files/folders

`m` menu to move/delete/copy files/folders

`?` Help

I use nerdtree for creating or moving files, but find command-t quicker for
opening files.

### [Surround](https://github.com/tpope/vim-surround) (`ys`/`cs`/`ds`)

Allows adding/removing/changing of surroundings

I would highly recommend getting to know this plugin, it is very useful.
Especially when you grok text objects.

*Characters*

`ysiw)`    - surround inner word with `()`

`ysiw(`    - surround inner word with `(  )`

In the above example `iw` can be replaced with any text object or motion.

If you find yourself manually adding surroundings, stop and work out the
correct text object or motion.

`cs"'`     - change surrounding from `"` to `'`

`ds`       - delete surrounding

*Tags*

`yss<p>`  - surround line in `<p>` tags

`cst<div>` - change surround tag to `<div>`

### [Solarized](https://github.com/altercation/vim-colors-solarized)

A colour scheme, both light and dark version

`:set background=dark`

`:set background=light`

### [Tagbar](https://github.com/majutsushi/tagbar) (`/l`)

Lists method names, provide auto complete

Run `ctags -R` or `\rt` in project root to generate tags

### [Powerline](https://github.com/Lokaltog/vim-powerline)

Powerline is a utility plugin which allows you to create better-looking, more functional vim statuslines.

See instructions for install the fontpatcher [here](https://github.com/Lokaltog/vim-powerline/tree/develop/fontpatcher).


### [Vundle](https://github.com/gmarik/vundle)

Plugin manager and part of the reason why my vimfiles as so compact

### [Rspec](https://github.com/josemarluedke/vim-rspec)

Run Rspec specs from Vim

`\t` run the full spec file

`\s` run the spec file under the cursor

`\l` rerun the previous spec command

This version of vim-rspec uses iTerm as default terminal. The original version uses the Terminal app.

### [Multiple cursors](http://github.com/terryma/vim-multiple-cursors)

True Sublime Text style multiple selections for Vim

## Installation

### Install Vim (if not already installed)

#### MacOS: MacVim

    brew install macvim --override-system-vim --enable-clipboard

#### Ubuntu: gVim

    apt-get install vim-gnome

### Install these vimfiles

Note: You will already have a `~/.vim` folder, either delete or move it.

    mv ~/.vim ~/.vim.old
    git clone https://github.com/josemarluedke/vimfiles ~/.vim
    cd ~/.vim
    rake install
    ln -s ~/.vim/vimrc ~/.vimrc

or run:

    curl https://raw.github.com/josemarluedke/vimfiles/master/install.sh -o - | sh

#### To update to the latest vimfiles

    cd ~/.vim
    rake update

#### Install Dependacies

###### MacOS

    brew install ack ctags the_silver_searcher

##### Ubuntu

    sudo apt-get install ncurses-term exuberant-ctags silversearcher-ag ack-grep
    sudo ln -s /usr/bin/ack-grep /usr/local/bin/ack

You can download the powerline font for Ubuntu Mono [here](https://github.com/pdf/ubuntu-mono-powerline-ttf/blob/master/UbuntuMono-R-VimPowerline.ttf?raw=true).


## Screens

*Solarized*
![Solarized MacVim](https://cloud.githubusercontent.com/assets/230476/8727274/3ee2f2b0-2bb5-11e5-97de-5dc75b955f8d.png)

*Molokai*
![Molokai MacVim](https://cloud.githubusercontent.com/assets/230476/8727276/3ef930e8-2bb5-11e5-9e18-13db03eca77c.png)

*Molokai with transparency*
![Molokai MacVim](https://cloud.githubusercontent.com/assets/230476/8727275/3ef74cb0-2bb5-11e5-9e09-a3602f27f755.png)


## Thanks for inspiration

- [@krisleech](https://github.com/krisleech) for his [vimfiles](https://github.com/krisleech/vimfiles/)
- [@wongyouth](https://github.com/wongyouth) for his [vimfiles](https://github.com/wongyouth/vimfiles)
- [@dcrec1](https://github.com/dcrec1) for [strip trailing whitespace](https://github.com/akitaonrails/vimfiles/commit/b9299f3570653ea70870a7b208eccd553523bddb)
