#!/bin/sh

set -ex # -e: exit on error -x: log to console

if [ -z "${CODESPACES}" ]; then
  echo "Not codespaces - skipping"
else
  if [ ! "$(command -v chezmoi)" ]; then
    echo "Installing chezmoi..."

    bin_dir="$HOME/.local/bin"
    chezmoi="$bin_dir/chezmoi"
    if [ "$(command -v curl)" ]; then
      sh -c "$(curl -fsSL chezmoi.io/get)" -- -b "$bin_dir"
    elif [ "$(command -v wget)" ]; then
      sh -c "$(wget -qO- chezmoi.io/get)" -- -b "$bin_dir"
    else
      echo "To install chezmoi, you must have curl or wget installed." >&2
      exit 1
    fi
  else
    chezmoi=chezmoi
  fi
  
  # Install Ghostty terminfo for users connecting from Ghostty terminal
  echo "Installing Ghostty terminfo..."
  mkdir -p "$HOME/.terminfo"
  
  # Create xterm-ghostty terminfo based on xterm-256color
  # This provides basic compatibility for Ghostty terminal users connecting to Codespaces
  infocmp xterm-256color | sed 's/xterm-256color|xterm with 256 colors/xterm-ghostty|Ghostty terminal emulator/' > /tmp/xterm-ghostty.terminfo
  
  # Compile and install the terminfo
  tic -x -o "$HOME/.terminfo" /tmp/xterm-ghostty.terminfo
  rm /tmp/xterm-ghostty.terminfo
  echo "Ghostty terminfo installed successfully"
fi

# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"
# exec: replace current process with chezmoi init
exec "$chezmoi" init --apply "--source=$script_dir"
