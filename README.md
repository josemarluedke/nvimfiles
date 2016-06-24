# Awesome vimfiles for Ruby and Javascript development

Support for Javascript, Ember, React, Ruby, Rails, Git, Sparkup, Slim, Sass, JSX, CoffeeScript, Markdown, and more with nice colour schemes.

![MacVim with these vimfiles](https://cloud.githubusercontent.com/assets/230476/9022763/f0fda188-3836-11e5-91e9-52a63326fc7f.png)


## Quick Install

```curl https://raw.github.com/josemarluedke/vimfiles/master/install.sh -o - | sh```

Please check also [install dependencies](#install-dependencies) section.

## Usage

### Basic Mappings

The leader key is mapped to `\`, you can change it in your `.vimrc.local`.

Action | Hotkey
--------------------------------------------------------- | -----------------
**▶ File operations**                                     |
File browser (NerdTree)                                   | `leader ]`
FuzzyFinder fo files (CtrlP)                              | `leader f`
Switch between the last two files                         | `leader leader`
Toggle Tagbar                                             | `leader l`
View buffer files on current window                       | `leader be`
View buffer files on horizontal split                     | `leader bs`
View buffer files on vertical split                       | `leader bs`
**▶ Search & Find/replace**                               |
Search in files (Ag/Silver Searcher)                      | `leader a`
Remove search highlighting                                | `leader Space`
Toggle search highlighting                                | `leader hs`
Find and replace                                          | `leader s`
**▶ Ruby on Rails**                                       |
File search in view                                       | `leader gv`
File search in controllers                                | `leader gc`
File search in models                                     | `leader gm`
File search in helpers                                    | `leader gh`
File search in libs                                       | `leader gl`
File search in public                                     | `leader gp`
File search in assets                                     | `leader ga`
Jump to model                                             | `leader m`
Jump to view                                              | `leader v`
Jump to controller                                        | `leader c`
Open routes in split                                      | `leader gr`
Open Gemfile in split                                     | `leader gg`
Run rspec on current test file                            | `leader rt`
Run rspec on current line                                 | `leader rs`
Run last rspec file                                       | `leader rl`
**▶ Others**                                              |
Indent                                                    | `>>` or `Command ]`
Reverse Indent                                            | `<<` or `Command [`
Switching between windows                                 | `ctrl+h` `ctrl+j` `ctrl+k` `ctrl+l`
Toggle comments                                           | `leader /` or `Command + /`
Auto complete or expand snippet                           | `<tab>`
Expand CSS selectors `div.event` in to markup             | `ctrl+e`

See `.vimrc` for more.

## Plugins

### [Rails](https://github.com/tpope/vim-rails)

*Lots* of stuff - get to know this plugin!


`:help rails`

### [CoffeeScript](https://github.com/kchmck/vim-coffee-script)

CoffeeScript support

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

  :Loremipsum[!] [WORD  COUNT] [PARAGRAPH_TEMPLATE] [PREFIX POSTFIX]

### [Bufexplorer](https://github.com/corntrace/bufexplorer)

With bufexplorer, you can quickly and easily switch between buffers


### [Jsbeautify](https://github.com/vim-scripts/jsbeautify) (`\ff`)

Format your javascript souce code.


### [BufOnly](https://github.com/vim-scripts/BufOnly.vim)

`:BufOnly` without an argument will unload all buffers but the current one.

`:BufOnly` with an argument will close all buffers but the supplied buffer name/number.

### [CtrlP](https://github.com/kien/ctrlp.vim) (`\f`)

Find files in your project with minimal keypresses

For example `conadus` would find `controllers/admin/users`


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


### [Ack](https://github.com/mileszs/ack.vim)

Search project for text (aka find in files)


### [Ag](https://github.com/epmatsw/ag.vim) (`\a`)

Alternative of Ack, using 'the_silver_searcher' on homebrew.


### [Nerdtree](https://github.com/scrooloose/nerdtree) (`\]`)

Project file browser

`\]` opens file browser

`o` / `x` open and close files/folders

`m` menu to move/delete/copy files/folders

`?` Help

I use nerdtree for creating or moving files, but find CtrlP quicker for
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

Run `ctags -R` or `\rtg` in project root to generate tags

### [Airline](https://github.com/bling/vim-airline)

Lean & mean status/tabline for vim that's light as air

### [Plug](https://github.com/junegunn/vim-plug)

Plugin manager and part of the reason why my vimfiles are so compact

### [Rspec](https://github.com/josemarluedke/vim-rspec)

Run Rspec specs from Vim

This version of vim-rspec uses iTerm as default terminal. The original version uses the Terminal app.

### [Multiple cursors](http://github.com/terryma/vim-multiple-cursors)

This is similar to Command + d from Atom/Sublime.

`Ctrl-n` to activate and to go to the next match. When you are tired, simply change the word under the cursor the usual way.

`<Leader>d` to clean highlight.

## Installation

### Install Vim (if not already installed)

#### MacOS: MacVim

    brew install macvim --with-override-system-vim --enable-clipboard  --with-cscope --with-lua

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

#### Install Dependencies

##### MacOS

    brew install ack ctags the_silver_searcher

##### Ubuntu

    sudo apt-get install ncurses-term exuberant-ctags silversearcher-ag ack-grep
    sudo ln -s /usr/bin/ack-grep /usr/local/bin/ack

You can download the powerline font for Ubuntu Mono [here](https://github.com/pdf/ubuntu-mono-powerline-ttf/blob/master/UbuntuMono-R-VimPowerline.ttf?raw=true).

## Thanks for inspiration

- [@krisleech](https://github.com/krisleech) for his [vimfiles](https://github.com/krisleech/vimfiles/)
- [@wongyouth](https://github.com/wongyouth) for his [vimfiles](https://github.com/wongyouth/vimfiles)
- [@dcrec1](https://github.com/dcrec1) for [strip trailing whitespace](https://github.com/akitaonrails/vimfiles/commit/b9299f3570653ea70870a7b208eccd553523bddb)
