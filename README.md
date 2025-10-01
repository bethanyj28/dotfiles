# ~/.dotfiles

A new evolution of my dotfiles utilizing chezmoi for management. For now primarily focuses on codespaces environments, but may expand to mac and windows environments in the future.

## Neovim Plugins

### sidekick.nvim

[folke/sidekick.nvim](https://github.com/folke/sidekick.nvim) - AI-powered Next Edit Suggestions (NES) and integrated AI CLI terminal.

**Features:**
- Next Edit Suggestions powered by Copilot LSP
- Integrated AI CLI terminal with tmux support
- Rich diffs with syntax highlighting
- Hunk-by-hunk navigation for reviewing edits

**Key Bindings:**
- `<Tab>` - Jump to or apply next edit suggestion
- `<C-.>` - Switch focus to/from Sidekick CLI
- `<leader>aa` - Toggle Sidekick CLI
- `<leader>as` - Select AI CLI tool

**Requirements:**
- Neovim >= 0.11.2
- Copilot LSP server (configured via Mason)
- Tmux (already configured in this dotfiles)

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
