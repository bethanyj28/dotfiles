# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## About This Repository

This is a personal dotfiles repository managed by [chezmoi](https://chezmoi.io/). It contains configuration files for development environments, primarily targeting Codespaces with some macOS support.

## Key Commands

### Managing Dotfiles
- `chezmoi apply` - Apply configuration changes to target files
- `chezmoi diff` - Show differences between source and target files
- `chezmoi init --apply` - Initialize chezmoi with this repository and apply configurations
- `./install.sh` - Main installation script (Codespaces-specific)

### Development Environment
- `nvim --headless "+Lazy! sync" +qa` - Sync Neovim plugins (triggered automatically by chezmoi)
- `v` or `nvim` - Open Neovim editor
- Package managers are installed via platform-specific scripts:
  - macOS: Homebrew with extensive package list
  - Codespaces: apt packages

## Architecture

### File Structure
- `dot_*` files are managed by chezmoi and become dotfiles in the home directory
- `run_*` scripts are executed by chezmoi during apply operations:
  - `run_once_before_*` - Run once before applying files
  - `run_once_after_*` - Run once after applying files  
  - `run_onchange_*` - Run when source files change
- `.tmpl` files are chezmoi templates with conditional logic

### Key Configurations
- **Neovim**: Modern Lua-based configuration using Lazy.nvim plugin manager
  - Leader key: `,` (comma)
  - Plugins organized in `dot_config/nvim/lua/plugins/`
  - Uses LSP, treesitter, telescope, and other modern Neovim features
- **Tmux**: Terminal multiplexer with vim-style keybindings
  - Prefix: `Ctrl-Space`
  - Mouse support enabled
  - Seamless navigation with Neovim
- **Zsh**: Shell configuration with oh-my-zsh and custom aliases
  - Theme: refined
  - Extensive Git, Docker, and development aliases
  - Uses `jk` as escape sequence in vi mode

### Platform Support
- Primary: GitHub Codespaces
- Secondary: macOS (Darwin)
- Conditional configuration using chezmoi templates based on environment

### Package Management
The repository automatically installs development tools including:
- Core: neovim, tmux, zsh, git, gh (GitHub CLI)
- Languages: Go, Python, Ruby, Node.js (via nvm)
- Utilities: ripgrep, fzf, bat, jq, bitwarden-cli
- macOS specific: Homebrew casks for GUI applications

## Development Workflow

When modifying configurations:
1. Edit source files in the chezmoi directory
2. Run `chezmoi diff` to preview changes
3. Run `chezmoi apply` to apply changes
4. Plugin sync and package installations happen automatically via run scripts