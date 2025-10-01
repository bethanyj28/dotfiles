# ~/.dotfiles

A new evolution of my dotfiles utilizing chezmoi for management. For now primarily focuses on codespaces environments, but may expand to mac and windows environments in the future.

## Features

### Ghostty Terminal Support

This repository includes terminfo support for the [Ghostty terminal emulator](https://ghostty.org/):

- **Codespaces**: Automatically installs `xterm-ghostty` terminfo when setting up Codespaces, ensuring proper terminal emulation when connecting from Ghostty
- **SSH Helper**: Provides `ssh-ghostty` function that automatically transfers Ghostty's terminfo to remote servers

#### Usage

To SSH with automatic terminfo transfer:

```bash
ssh-ghostty user@hostname [ssh options]
```

This will:
1. Transfer Ghostty's terminfo to the remote server
2. Connect via SSH

If Ghostty terminfo is not found locally, it falls back to regular SSH.

## //TODO
- [x] Setup current dotfiles to work with chezmoi
- [x] Fix errors in neovim for local & codespaces
- [x] Get setup with tmux
  - [x] Seamless navigation between tmux and neovim
  - [x] Get comfortable with tmux & tweak keybindings
- [ ] Look into Alacritty when comfortable with tmux (easily port config)
- [ ] Update theme
  - [x] Catppuccin everywhere? ☕🐈‍⬛
  - [ ] Update lualine
  - [ ] Zsh syntax highlighting?
- [x] Fix filetree
  - [x] Show hidden files
  - [x] Show icons
- [x] Fix language support
  - [x] Go is different than everything else
  - [x] Solargraph either never works or crashes
  - [x] Add markdown support
  - [ ] Debugging with dap
- [ ] Refactor neovim lua config
