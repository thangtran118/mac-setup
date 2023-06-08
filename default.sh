#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_message "Creating defaults"
# ------------------------------------------------------------------------------

if ! has_path "Workspace"; then
  get_consent "Create ~/Workspace folder"
  if has_consent; then
    e_pending "Creating ~/Workspace folder"
    mkdir -p ~/Workspace
    test_path "Workspace"
  fi
fi

if ! has_command "xcode-select"; then
  e_pending "Installing xcode-select (CLI tools)"
  xcode-select --install
  test_command "xcode-select"
fi

if ! has_command "brew"; then
  e_pending "Installing brew (Homebrew)"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if has_arm; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'>>$HOME/.zprofile
  fi
  brew doctor
  brew tap homebrew/cask-fonts
  test_command "brew"
fi

if ! has_path ".ssh"; then
  e_pending "Generating SSH key"
  ssh-keygen -t ed25519 -C "thangtc.work@gmail.com"
fi

# ------------------------------------------------------------------------------
e_message "Defaults complete"
# ------------------------------------------------------------------------------