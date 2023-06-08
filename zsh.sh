#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_message "Checking zsh"
# ------------------------------------------------------------------------------

if has_command "brew"; then
  if ! has_command "zsh"; then
    get_consent "Install zsh"
    if has_consent; then
      e_pending "Installing zsh"
      brew install zsh
      chsh -s /opt/homebrew/bin/zsh
      test_command "zsh"
    fi
  fi
fi

if has_command "zsh"; then
  if ! has_path ".oh-my-zsh"; then
    get_consent "Install oh-my-zsh"
    if has_consent; then
      e_pending "Installing oh-my-zsh"
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
      test_path ".oh-my-zsh"
    fi
  fi
fi

# ------------------------------------------------------------------------------
e_message "ZSH complete"
# ------------------------------------------------------------------------------