#!/bin/bash

# Paths
VAULT_SECRET="$HOME/.ansible-vault/vault.secret"

# Install homebrew
if ! command -v brew &>/dev/null; then
  pretty_print "Installing Homebrew, an OSX package manager" 
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  
  if ! grep -qs "recommended by brew doctor" ~/.zshrc; then
    pretty_print "Put Homebrew location in PATH"
      printf '\n# recommended by brew doctor\n' >> ~/.zshrc
      printf 'export PATH="/usr/local/bin:$PATH"\n' >> ~/.zshrc
      export PATH="/usr/local/bin:$PATH"
  fi
fi

# Update homebrew index
pretty_print "Updating brew formulas"
  brew update

# Install ansible
pretty_print "Installing pipx"
  brew install pipx

pretty_print "Installing ansible"
  pipx install --include-deps ansible

pretty_print "Launching playbook"
if [[ -f $VAULT_SECRET ]]; then
    ansible-playbook --vault-password-file $VAULT_SECRET "../main.yml" --ask-become-pass "$@"
else
    ansible-playbook "$DOTFILES_DIR/main.yml" --ask-become-pass "$@"
fi
