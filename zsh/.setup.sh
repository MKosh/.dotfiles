#!/bin/env bash

terminal_packages=(
  neovim
  eza
  fzf
  git-delta
  zsh-syntax-highlighting
  zsh-autosuggestions
)

dev_packages=(
  clang
  cmake
)

install_packages() {
  for package in $1; do
    sudo dnf install $package
  done
}

install_terminal() {
  echo "Installing OMZ"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo "Installing starship"
  curl -sS https://starship.rs/install.sh | sh
  echo "Installing wezterm"
  sudo dnf install -y https://github.com/wezterm/wezterm/releases/download/20240203-110809-5046fc22/wezterm-20240203_110809_5046fc22-1.fedora39.x86_64.rpm
}

setup_system() {
  echo "Setting up system..."
  install_terminal()
  install_packages "${terminal_packages[@]}"
  install_packages "${dev_packages[@]}"
}
