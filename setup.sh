#!/bin/bash

source _utils.sh

clear

# ------------------------------------------------------------------------------
e_message "Starting mac-dev-setup"
# ------------------------------------------------------------------------------

source default.sh
source casks.sh
source zsh.sh
source zsh-plugins.sh
source node.sh
source optimizations.sh
source summary.sh

# ------------------------------------------------------------------------------
e_message "mac-dev-setup complete"
# ------------------------------------------------------------------------------