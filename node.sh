#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_message "Node setup"
# ------------------------------------------------------------------------------

if ! has_command "nvm"; then
  get_consent "Install nvm (Node via nvm)"
  if has_consent; then
    e_pending "Installing nvm"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    source ~/.zshrc
    test_command "nvm"
  fi
fi

if ! has_command "node"; then
  get_consent "Install/Upgrade Node (via nvm)"
  if has_consent; then
    e_pending "Installing/Upgrading Node"
    nvm install --lts
    test_command "node"
  fi
fi

if has_command 'npm'; then
  get_consent "Upgrade npm"
  if has_consent; then
    e_pending "Upgrading npm"
    npm install -g npm@latest
    test_command "npm"
  fi
fi

if has_command "npm"; then
  if ! has_command "yarn"; then
    get_consent "Install yarn"
    if has_consent; then
      e_pending "Installing yarn"
      npm install -g yarn
      test_command "yarn"
    fi
  fi
fi

# ------------------------------------------------------------------------------
e_message "node complete"
# ------------------------------------------------------------------------------