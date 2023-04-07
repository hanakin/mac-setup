#!/bin/zsh

bot "Lets install some nessecary node packages now"

bot "Let me see if node is installed properly first"

# Install if we don't have it
if test ! $(which node); then
  bot "It does not appear to be installed properly let me fix that"
  running "Installing node..."
  asdf plugin-add nodejs
  asdf install nodejs latest
  asdf global nodejs latest
  ok "node installed!"
fi

bot "Looks like we are all set lets get those packages installed."

running "Installing node packages..."
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
