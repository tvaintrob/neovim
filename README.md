# Neovim Config

Personal Neovim configuration.

## Installation

To install this config, run the following:

```bash
# backup previous configuration
mv $HOME/.config/nvim $HOME/.config/nvim.old
git clone https://github.com/tvaintrob/neovim.git $HOME/.config/nvim
```

## Requirements

The following are required to use the configuration:

- Neovim >= 0.11.0
- A [nerd-font](https://github.com/ryanoasis/nerd-fonts) for glyphs.
- [Pre-commit](https://pre-commit.com/) when editing the configuration.

## Features

This configuration includes:

- **LSP Support**: Full language server protocol integration for intelligent code completion, diagnostics, and navigation.
- **Treesitter**: Advanced syntax highlighting and code parsing for better visual feedback.
- **Fuzzy Finding**: Quick file and content searching with Telescope.
- **Git Integration**: Built-in git support with signs, blame, and diff views.
- **Auto-completion**: Smart completions powered by nvim-cmp.
- **File Explorer**: Easy navigation with a tree-style file browser.

## Key Bindings

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Browse buffers |
| `<leader>e` | Toggle file explorer |
| `gd` | Go to definition |
| `K` | Show hover documentation |

## Customization

To customize this configuration, edit the files in the `lua/` directory. The main entry point is `init.lua`.
