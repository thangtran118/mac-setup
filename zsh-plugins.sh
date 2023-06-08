#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_message "zsh plugins install"
# ------------------------------------------------------------------------------

if has_command "brew" && has_command "zsh"; then
  if ! has_brew "powerlevel10k"; then
    get_consent "Install powerlevel10k (CLI theming)"
    if has_consent; then
      e_pending "Installing powerlevel10k"
      brew install romkatv/powerlevel10k/powerlevel10k
      echo '# Theme configuration: PowerLevel10K' >> ~/.zshrc
      echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc
      echo '# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.' >> ~/.zshrc
      echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> ~/.zshrc
      source ~/.zshrc
      test_brew "powerlevel10k"
      p10k configure
    fi
  fi
fi

if has_command "brew" && has_command "zsh"; then
  if ! has_brew "zsh-autosuggestions"; then
    get_consent "Install zsh-autosuggestions"
    if has_consent; then
      e_pending "Installing zsh-autosuggestions"
      brew install zsh-autosuggestions
      echo "# Fish shell-like fast/unobtrusive autosuggestions for Zsh." >> ~/.zshrc
      echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
      test_brew "zsh-autosuggestions"
    fi
  fi
fi

if has_command "brew" && has_command "zsh"; then
  if ! has_brew "zsh-syntax-highlighting"; then
    get_consent "Install zsh-syntax-highlighting"
    if has_consent; then
      e_pending "Installing zsh-syntax-highlighting"
      brew install zsh-syntax-highlighting
      echo "# Fish shell-like syntax highlighting for Zsh." >> ~/.zshrc
      echo "# Warning: Must be last sourced!" >> ~/.zshrc
      echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
      test_brew "zsh-syntax-highlighting"
    fi
  fi
fi

# ------------------------------------------------------------------------------
e_message "zsh plugins complete"
# ------------------------------------------------------------------------------