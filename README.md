# Nvimfiles

Support for JavaScript, TypeScript, Ember, React, Golang, Ruby, Elixir, Git,
Sparkup, Sass, JSX, Markdown, and more with nice color schemes.

**Neovim only!** `(>= v0.5)`

## Quick Install

```
sh -c "$(curl -fsSL https://raw.github.com/josemarluedke/nvimfiles/main/install.sh)"
```

Please also check [install dependencies](#install-dependencies) section.

## Usage

### Basic Mappings

The leader key is mapped to `,`.

Action | Hotkey
--------------------------------------------------------- | -----------------
**▶ File operations**                                     |
File browser                                              | `leader m`
FuzzyFinder (Telescope)                                   | `t`
Switch between the last two files                         | `leader leader`
Navigate to current open file in NerdTree                 | `leader n`
**▶ Search & Find/replace**                               |
Search in files (Telescope)                               | `leader g`
Remove search highlighting                                | `leader Space`
Find and replace                                          | `leader s`
**▶ Others**                                              |
Indent                                                    | `>` 
Reverse Indent                                            | `<`
Switching between windows                                 | `ctrl+h` `ctrl+j` `ctrl+k` `ctrl+l`
Toggle comments                                           | `leader /`
Auto complete or expand snippet                           | `<tab>`
Split a one-liner into multiple lines (splitjoin.vim)     | `gS`
Join a block into a single-line statement (splitjoin.vim) | `gJ`

## Plugins

// TODO add list


### [Abolish](https://github.com/tpope/vim-abolish)

Use:

  :%Subvert/facilit{y,ies}/building{,s}/g

Instead:

  :%s/facilities/buildings/g
  :%s/Facilities/Buildings/g
  :%s/FACILITIES/BUILDINGS/g

#### Coercion

Want to turn `fooBar` into `foo_bar`? Press `crs` (coerce to snake\_case).

- MixedCase (`crm`)
- camelCase (`crc`)
- snake\_case (`crs`)
- and UPPER\_CASE (`cru`)

## Installation

### Install Neovim (if not already installed)

```
brew install neovim
```

### Install these nvimfiles

Note: You will already have a `~/.config/nvim` folder, either delete or move it.

    mv ~/.config/nvim ~/.config/nvim.old
    git clone https://github.com/josemarluedke/nvimfiles ~/.config/nvim
    cd ~/.config/nvim
    make install

or run:

    sh -c "$(curl -fsSL https://raw.github.com/josemarluedke/nvimfiles/main/install.sh)"

#### To update to the latest nvimfiles

    cd ~/.config/nvim
    make update

#### Install python for neovim

`pip install neovim` or `pip3 install neovim`

#### Install Dependencies

##### MacOS

    brew install ripgrep

#### Install Nerd Font

https://github.com/epk/SF-Mono-Nerd-Font

## Thanks for inspiration

- [@krisleech](https://github.com/krisleech) for his [vimfiles](https://github.com/krisleech/vimfiles/)
- [@wongyouth](https://github.com/wongyouth) for his [vimfiles](https://github.com/wongyouth/vimfiles)
- [@e-cal](https://github.com/e-cal) for [evim](https://github.com/e-cal/evim)
- [@ChristianChiarulli](https://github.com/ChristianChiarulli) for [LunarVim](https://github.com/ChristianChiarulli/LunarVim)

