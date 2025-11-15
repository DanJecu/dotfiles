#!/bin/bash

# Define the path to .dotfiles directory
DOTFILES_DIR="$HOME/.dotfiles"

# Function to create a symlink, replacing any existing destination
create_symlink() {
  src="$1"
  dest="$2"

  # If the destination exists, remove it
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "Removing existing $dest"
    rm -rf "$dest"
  fi

  # Create the symlink
  echo "Creating symlink: $dest -> $src"
  ln -s "$src" "$dest"
}

# Define the symlinks
symlinks=(
  "$DOTFILES_DIR/zsh/dan-zsh.zsh-theme:$HOME/.oh-my-zsh/custom/themes/dan-zsh.zsh-theme"
  "$DOTFILES_DIR/zsh/.zshrc:$HOME/.zshrc"
  "$DOTFILES_DIR/aerospace:$HOME/.config/aerospace"
  "$DOTFILES_DIR/nvim:$HOME/.config/nvim"
  "$DOTFILES_DIR/wezterm/.wezterm.lua:$HOME/.wezterm.lua"
  "$DOTFILES_DIR/git/.gitconfig:$HOME/.gitconfig"
  "$DOTFILES_DIR/ghostty:$HOME/.config/ghostty"
  "$DOTFILES_DIR/alacritty:$HOME/.config/alacritty"
)

# Initialize counters
total_symlinks=${#symlinks[@]}
created_symlinks=0

# Create symlinks
for link in "${symlinks[@]}"; do
  IFS=":" read -r src dest <<<"$link"
  create_symlink "$src" "$dest"
  ((created_symlinks++))
done

# Summary
echo "$created_symlinks/$total_symlinks - Symlinks have been created"
