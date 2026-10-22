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
- [ ] Double compinit; sshpls path
- [ ] Disable omz self-update
- [ ] tmux: tmux-256color, drop tmux.nvim/copycat tpm entries, pick one navigator
- [ ] Ghostty theme -> mocha
- [ ] Refresh README
