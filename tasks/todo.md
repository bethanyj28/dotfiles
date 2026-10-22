# Dotfiles upgrade

## 1. Upgrade tools
- [x] neovim 0.11.2 -> 0.12.6
- [x] chezmoi 2.42.0 -> 2.73.3
- [x] install tree-sitter-cli (needed by nvim-treesitter main)

## 2. Fix nvim startup errors / reproducibility
- [x] Pin nvim-treesitter to `main` branch; start highlighting via FileType autocmd
- [x] Update treesitter plugins (+ go.nvim, which needed the new API) in lazy-lock.json; verify clean headless startup
- [x] Track lazy-lock.json in chezmoi (symlink to repo-root nvim-lazy-lock.json)
- [x] Replace run_onchange_packer-sync with a `Lazy! restore` script hashed on the lockfile
- [x] Fix tpm script comment
- [x] Remove stale `git.cloning` dir

## 3. Package management
- [x] Move darwin packages into a tracked Brewfile + run_onchange script
- [x] Drop deprecated taps / `--no-lock`; fix `claude` cask; add missing packages, drop unused
- [x] Telegram is an App Store app: manage via `mas` instead of cask
- [x] Adopt Docker, Claude, 1Password, Raycast (terminal needs App Management permission)
- [x] Ubuntu: `$HOME` instead of hard-coded path, `set -e`
- [x] Codespaces: pin nvim version, drop interactive `Copilot setup`, arch-aware tree-sitter (moved to preinstall)
- [x] install.sh: set `$chezmoi` outside codespaces

## 4. Neovim cleanup
- [x] neodev -> lazydev; williamboman -> mason-org
- [x] Single LspAttach autocmd; gopls configured in lsp.lua (audit was wrong: only one gopls client and one formatter ran, but go.nvim options were mostly dead keys)
- [x] Deprecated APIs (nvim_buf_set_option, vim.highlight)
- [x] Keymap collisions: swap -> `<leader>sa/sA`, `<C-hjkl>` via tmux.nvim, `<Space>` nop removed (Copilot `<Tab>` was not a real conflict: insert vs normal mode)
- [ ] Decide on AI plugins: sidekick NES needs copilot-language-server, which is not installed
- [x] Drop Comment.nvim; go.nvim lazy-load on ft only

## 5. Shell / tmux / theme
- [x] Remove old aliases: gofmt, slop, swap, master, ghgh, gop, capi
- [x] Double compinit; sshpls path
- [x] Disable omz self-update
- [x] tmux: tmux-256color + RGB, drop copycat and vim-tmux-navigator (audit was wrong: tmux.nvim is also the tmux-side plugin), drop hard-coded default-shell
- [x] Ghostty theme -> built-in Catppuccin Mocha
- [x] Refresh README

## Review

All five steps done; each verified on this Mac (headless nvim probes, brew bundle check,
zsh/tmux/ghostty config checks, `chezmoi status` clean). Codespaces/Ubuntu scripts were
syntax-checked with rendered templates but not run end to end.

Audit corrections found while implementing:
- gopls never ran twice and Go files were never double-formatted (go.nvim options were dead keys)
- Copilot `<Tab>` and sidekick `<Tab>` don't conflict (insert vs normal mode)
- tmux.nvim is a tpm plugin too; the redundant one was vim-tmux-navigator
- Dropping the second compinit didn't measurably change zsh startup (~0.30s)

Open:
- [ ] Decide on AI plugins (sidekick NES needs copilot-language-server)
- [ ] Optional: more App Store apps in Brewfile via `mas`; untap or trust old firmware taps; remove ~/.local/bin/herdr
