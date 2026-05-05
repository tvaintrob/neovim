# Neovim Config

Personal Neovim configuration built on [lazy.nvim](https://github.com/folke/lazy.nvim).

## Features

- **Editor**: Neo-tree, Telescope, Treesitter, toggleterm, Claude Code integration
- **Git**: Gitsigns, Diffview
- **Intellisense**: Blink completion, Conform (formatting), Mason (LSP installer), auto-pairs
- **Debugging**: nvim-dap
- **UI**: VSCode dark theme, Lualine, Noice, indent-blankline
- **Database**: Dadbod

### Language Support

Go, TypeScript, Python, Lua, Bash, Terraform, Docker, JSON, YAML, HTML, Markdown

## Installation

```bash
# backup previous configuration
mv $HOME/.config/nvim $HOME/.config/nvim.old
git clone https://github.com/tvaintrob/neovim.git $HOME/.config/nvim
```

## Requirements

- Neovim >= 0.11.0
- A [nerd-font](https://github.com/ryanoasis/nerd-fonts) for glyphs
- [Pre-commit](https://pre-commit.com/) when editing the configuration

## Structure

```
init.lua              # Entry point: options, keymaps, filetype detection
lua/tvaintrob/
├── lazy/             # Lazy.nvim bootstrap
├── plugins/          # Plugin specs (editor, git, intellisense, debugging, ui, db)
└── langs/            # Per-language LSP and tooling configs
after/
├── lsp/              # LSP server configurations
└── plugin/           # Post-load plugin overrides
```
