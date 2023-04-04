#!/usr/bin/env bash


source ./scripts/lib.sh

bot "Lets install some nessecary node packages"

running "checking node is installed"
# Install if we don't have it
if test ! $(which node); then
  running "Installing node..."
  asdf plugin-add nodejs
  asdf install nodejs latest
  asdf global nodejs latest
fi

running "Installing node packages"

require_npm gulp
require_npm sass
require_npm stylelint
require_npm stylelint-order
require_npm stylelint-scss
require_npm stylelint-config-standard-scss
require_npm postcss
require_npm postcss-cli
require_npm postcss-sorting
require_npm eslint
require_npm eslint-config-xo

ok "all packages instlled!"
