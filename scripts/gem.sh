#!/bin/zsh

bot "Lets install some nessecary ruby gems"

bot "Let me see if ruby is installed properly first"

# Install if we don't have it
if test ! $(which node); then
  bot "It does not appear to be installed properly let me fix that"
  running "Installing ruby.."
  asdf plugin-add ruby
  asdf install ruby latest
  asdf global ruby latest
  ok "ruby installed!"
fi

bot "Looks like we are all set lets get those gems installed."
running "Installing gems"

LINE='eval "$(rbenv init -)"'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

require_gem git-up
require_gem sass
require_gem compass
require_gem burbon

ok "all gems instlled!"
