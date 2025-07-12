#!/usr/bin/env bash

# Update system
sudo pacman -Syu --noconfirm

# Install packages from official repos
sudo pacman -S --noconfirm \
  zsh \
  git \
  curl \
  neovim \
  wl-clipboard \
  fzf \
  ripgrep \
  bat \
  luarocks \
  ttf-font-awesome \
  noto-fonts-emoji \
  fd \
  lazygit \
  pavucontrol \
  gnome-themes-extra \
  ttf-droid \
  brightnessctl \
  bluez \
  bluez-utils

# Install packages from AUR (requires yay)
yay -S --noconfirm \
  yay \
  brave-bin \
  visual-studio-code-bin \
  google-chrome \
  cursor \
  ttf-noto-apple-emoji
