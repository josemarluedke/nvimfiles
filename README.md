# Josemar's Neovim Configuration

This repository contains my personal Neovim configuration, based on the [LazyVim](https://github.com/LazyVim/LazyVim) starter template.

## Features

- **LSP Support**: Language Server Protocol integration via `nvim-lspconfig` and managed with `mason.nvim`.
- **Tree-sitter**: Enhanced syntax highlighting and parsing for multiple languages.
- **Autocompletion**: Powerful completion engine with `nvim-cmp` and snippet support.
- **Noice UI**: Improved Neovim UI and notifications.
- **Git Integration**: Git signs and inline blame with `gitsigns.nvim`.
- **Code Formatting & Linting**: Automatic formatting and linting powered by `conform.nvim`.
- **Debugging**: Debug Adapter Protocol (DAP) setup for various languages.
- **Markdown & Code Folding**: Better markdown support and code folding with `treesj.nvim`.
- **Extras**: Additional plugins and utilities for productivity enhancements.

## Origin

This configuration was bootstrapped from the LazyVim starter template.

## Installation

### Prerequisites

- Neovim 0.9 or higher
- Git

### Steps

```sh
# Clone this repository into your Neovim config folder
git clone https://github.com/josemarluedke/nvimfiles.git ~/.config/nvim

# Launch Neovim and let LazyVim install plugins
nvim

# (Optional) To manually synchronize plugins
:Lazy sync
```

Enjoy your customized Neovim setup!
