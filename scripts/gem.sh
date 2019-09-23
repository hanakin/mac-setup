#!/usr/bin/env bash


source ./scripts/lib.sh

bot "Lets install some nessecary ruby gems"

running "checking ruby is installed"
# Install if we don't have it
if test ! $(which node); then
  running "Installing ruby.."
  require_brew ruby-build
  require_brew rbenv
  LINE='eval "$(rbenv init -)"'
  grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra
fi

running "Installing gems"

require_gem git-up
require_gem sass
require_gem compass
require_gem burbon

ok "all gems instlled!"
