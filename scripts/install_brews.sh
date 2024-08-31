#!/bin/bash

# Define the location of your Brewfile
BREWFILE_PATH="$HOME/.dotfiles/Brewfile"

# Function to check if Homebrew is installed
check_homebrew() {
  if command -v brew &>/dev/null; then
    echo "Homebrew is already installed."
  else
    echo "Homebrew is not installed. Installing now..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
}

# Function to install packages from Brewfile
install_brewfile() {
  if [ -f "$BREWFILE_PATH" ]; then
    echo "Installing packages from Brewfile..."
    brew bundle --file="$BREWFILE_PATH"
  else
    echo "Brewfile not found at $BREWFILE_PATH"
  fi
}

# Script execution
check_homebrew
install_brewfile
