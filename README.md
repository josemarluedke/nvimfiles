# Awesome vimfiles for Ruby and Javascript development

Support for Javascript, Ember, React, Ruby, Rails, Git, Sparkup, Slim, Sass,
JSX, CoffeeScript, Markdown, and more with nice color schemes.

**Neovim compatible!**

![MacVim with these vimfiles](https://cloud.githubusercontent.com/assets/230476/18639884/8db13666-7e4a-11e6-99ad-01ebaaf7432e.png)


## Quick Install

```
sh -c "$(curl -fsSL https://raw.github.com/josemarluedke/vimfiles/master/install.sh)"
```

Please also check [install dependencies](#install-dependencies) section.

## Usage

### Basic Mappings

The leader key is mapped to `,`, you can change it in your `.vimrc.local`.

Action | Hotkey
--------------------------------------------------------- | -----------------
**▶ File operations**                                     |
File browser (NerdTree)                                   | `leader m`
FuzzyFinder fo files (FZF)                                | `leader f` or just `t`
Switch between the last two files                         | `leader leader`
Toggle Tagbar                                             | `leader l`
View buffer files on current window                       | `leader be`
View buffer files on horizontal split                     | `leader bs`
View buffer files on vertical split                       | `leader bs`
**▶ Search & Find/replace**                               |
Multiple Cursor                                           | `ctrl+n`
Search in files (Ag/Silver Searcher)                      | `leader a`
Remove search highlighting                                | `leader Space`
Toggle search highlighting                                | `leader hs`
Find and replace                                          | `leader s`
**▶ Ruby on Rails**                                       |
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
Split a one-liner into multiple lines (splitjoin.vim)     | `gS`
Join a block into a single-line statement (splitjoin.vim) | `gJ`
Paste from yank history using append (neoyank.vim)        | `leader h`

See `.vimrc` for more.

## Plugins

### [Rails](https://github.com/tpope/vim-rails)

*Lots* of stuff - get to know this plugin!


`:help rails`

### [Ember.js](https://github.com/AndrewRadev/ember_tools.vim)

Similar to vim-rails, but for Ember.js.

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


### [BufOnly](https://github.com/vim-scripts/BufOnly.vim)

`:BufOnly` without an argument will unload all buffers but the current one.

`:BufOnly` with an argument will close all buffers but the supplied buffer name/number.

### [FZF](https://github.com/junegunn/fzf) (`<leader>f`)

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

   <leader>a= :Tabularize /=
   <leader>a: :Tabularize /:
   <leader>a:: :Tabularize /:\zs
   <leader>a, :Tabularize /,
   <Bar> :Tabularize /<Bar>

http://vimcasts.org/episodes/aligning-text-with-tabular-vim/

### [Neerd Commenter](https://github.com/scrooloose/nerdcommenter) (`Command + /` or `<leader>/`)

Comment/Uncomment stuff out


### [Ack](https://github.com/mileszs/ack.vim)

Search project for text (aka find in files)


### [Ag](https://github.com/epmatsw/ag.vim) (`<leader>a`)

Alternative of Ack, using 'the_silver_searcher' on homebrew.


### [Nerdtree](https://github.com/scrooloose/nerdtree) (`<leader>]`)

Project file browser

`<leader>m` opens file browser

`o` / `x` open and close files/folders

`m` menu to move/delete/copy files/folders

`?` Help

I use nerdtree for creating or moving files, but I find FuzzyFinders quicker for
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

### [Tagbar](https://github.com/majutsushi/tagbar) (`<leader>l`)

Lists method names, provide auto complete

Run `ctags -R` or `<leader>rtg` in project root to generate tags

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

### Format JSON strings

If you have a one line JSON string and want to indend and format it you can use
this command:

`:FormatJSON`


### Disable directions key navigation

If you are not used to use hjkl keys to navigate throught files, I recommend adding the
following code to your `~/.vimrc.local` to disable navigation using the
arrows keys. This will make you use hjkl keys instead of arrows.

```
noremap <up>    :echoerr 'Use K to go up'<CR>
noremap <down>  :echoerr 'Use J to go down'<CR>
noremap <left>  :echoerr 'Use H to go left'<CR>
noremap <right> :echoerr 'Use L to go right'<CR>
```

## Installation

### Install Vim (if not already installed)

#### MacOS: vim

    brew install vim --with-cscope --with-python --with-lua --override-system-vim


#### MacOS: MacVim

    brew install macvim --with-override-system-vim --enable-clipboard  --with-cscope --with-lua

#### Ubuntu: gVim

    apt-get install vim-gnome

#### Ruby and NeoVim users

Remember to install the `neovim` gem to get deoplete completing ruby code.
Execute: `sudo gem install neovim`

### Install these vimfiles

Note: You will already have a `~/.vim` folder, either delete or move it.

    mv ~/.vim ~/.vim.old
    git clone https://github.com/josemarluedke/vimfiles ~/.vim
    cd ~/.vim
    rake install
    ln -s ~/.vim/vimrc ~/.vimrc

or run:

    sh -c "$(curl -fsSL https://raw.github.com/josemarluedke/vimfiles/master/install.sh)"

#### To update to the latest vimfiles

    cd ~/.vim
    rake update

#### Neovim

##### Symlink the vimfiles to work with neovim
    ln -s ~/.vim ~/.config/nvim
    ln -s ~/.vim/vimrc ~/.config/nvim/init.vim

##### Install python for neovim

`pip install neovim` or `pip3 install neovim`

#### Install Dependencies

##### MacOS

    brew install ack ctags the_silver_searcher

##### Ubuntu

    sudo apt-get install ncurses-term exuberant-ctags silversearcher-ag ack-grep
    sudo ln -s /usr/bin/ack-grep /usr/local/bin/ack

## Thanks for inspiration

- [@krisleech](https://github.com/krisleech) for his [vimfiles](https://github.com/krisleech/vimfiles/)
- [@wongyouth](https://github.com/wongyouth) for his [vimfiles](https://github.com/wongyouth/vimfiles)
- [@dcrec1](https://github.com/dcrec1) for [strip trailing whitespace](https://github.com/akitaonrails/vimfiles/commit/b9299f3570653ea70870a7b208eccd553523bddb)
