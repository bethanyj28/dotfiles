# ~/.dotfiles

Dotfiles managed with [chezmoi](https://chezmoi.io) for macOS, Ubuntu and GitHub Codespaces.

## Setup

- **macOS / Ubuntu:** `chezmoi init --apply bethanyj28`
- **Codespaces:** set this repo as your dotfiles repo; Codespaces runs `install.sh`, which installs chezmoi and applies.

`.chezmoi.yaml.tmpl` detects the environment (`codespaces`, `ubuntu`, `work`) and the `run_*` scripts install packages for it.

## What's here

| Path | What |
|---|---|
| `Brewfile` | macOS packages, casks and App Store apps. Re-applied whenever it changes. |
| `dot_zshrc.tmpl` | zsh with oh-my-zsh (refreshed weekly by chezmoi, self-update disabled) |
| `dot_tmux.conf` | tmux, prefix `C-Space`, catppuccin mocha, plugins via tpm |
| `dot_config/nvim` | Neovim config using lazy.nvim |
| `dot_config/ghostty` | Ghostty, catppuccin mocha |
| `nvim-lazy-lock.json` | Pinned Neovim plugin versions (symlinked to `~/.config/nvim/lazy-lock.json`) |

## Common tasks

- **Add a Mac package:** add it to `Brewfile`, then `chezmoi apply`.
- **Update Neovim plugins:** `:Lazy update` in nvim, check things work, then commit `nvim-lazy-lock.json`. Other machines get the same versions on their next `chezmoi apply` (`Lazy! restore`).
- **Update tmux plugins:** `prefix + U`.

## Neovim

Leader is `,`. Language servers are installed with Mason and configured in `lua/plugins/lsp.lua`; any Mason-installed server is enabled automatically.

| Keys | Action |
|---|---|
| `<C-h/j/k/l>` | Move between nvim splits and tmux panes (tmux.nvim) |
| `<leader>sf` / `sg` / `sw` | Find files / grep / grep word under cursor |
| `gd` / `gr` / `K` | Definition / references / hover |
| `<leader>rn` / `<leader>ca` | Rename / code action |
| `<leader>sa` / `<leader>sA` | Swap argument with next / previous |
| `<C-n>` / `<leader>m` | Toggle file tree / reveal current file |
| `<leader>aa` / `af` / `as` | Sidekick: toggle AI CLI / focus / select tool |
| `<leader>km` | Search all keymaps |
