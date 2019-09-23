#!/usr/bin/env bash


source ./scripts/lib.sh

bot "Lets install some nessecary node packages"

running "checking node is installed"
# Install if we don't have it
if test ! $(which node); then
  running "Installing node..."
  require_brew node
fi

running "Installing node packages"

require_npm gulp
require_npm xo
require_npm stylelint
require_npm stylelint-order
require_npm postcss
require_npm postcss-sorting

ok "all packages instlled!"
