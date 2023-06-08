#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_message "Creating summary"
# ------------------------------------------------------------------------------

e_success "$(uname -p) Architecture"
if has_path "Workspace"; then
  e_success "$HOME/Workspace"
else
  e_failure "$HOME/Workspace"
fi
test_command "xcode-select"
test_command "brew"
test_command "git"
test_command "zsh"
test_path ".oh-my-zsh"
test_brew "powerlevel10k"
test_brew "zsh-autosuggestions"
test_brew "zsh-syntax-highlighting"
test_command "nvm"
test_command "node"
test_command "npm"
test_command "yarn"
if has_cask "font-jetbrains-mono-nerd-font"; then
  e_success "JetBrains Mono Nerd Font"
else
  e_failure "JetBrains Mono Nerd Font"
fi
#test_app "1Password 7"
#test_app "Brave Browser"
#test_app "DiffMerge"
#test_app "Discord"
#test_app "Figma"
test_app "Google Chrome"
#test_app "Insomnia"
test_app "iTerm"
#test_app "Rectangle"
#test_app "Slack"
#test_app "Sourcetree"
#test_app "Spotify"
test_app "Visual Studio Code"
#test_app "Warp"
test_app "Zoom.us"

# ------------------------------------------------------------------------------
e_message "Summary complete"
# ------------------------------------------------------------------------------