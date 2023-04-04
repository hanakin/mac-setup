#!/usr/bin/env bash


source ./scripts/lib.sh

bot "Lets install some nessecary ruby gems"

running "checking ruby is installed"
# Install if we don't have it
if test ! $(which node); then
  running "Installing ruby.."
  asdf plugin-add ruby
  asdf install ruby latest
  asdf global ruby latest
fi

running "Installing gems"

LINE='eval "$(rbenv init -)"'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

require_gem git-up
require_gem sass
require_gem compass
require_gem burbon

ok "all gems instlled!"

# Install ruby-build and rbenv
