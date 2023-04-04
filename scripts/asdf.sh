#!/usr/bin/env bash


source ./scripts/lib.sh

bot "Lets install our codeing languages using asdf"

running "checking node is installed"
# Install if we don't have it
if test ! $(asdf current); then
  running "Installing node..."
  require_brew asdf
fi

running "Adding asdf plugins"

asdf plugin-add nodejs
asdf plugin-add python
asdf plugin-add mysql
asdf plugin-add make
asdf plugin-add php
asdf plugin-add ruby
asdf plugin-add rust
asdf plugin-add sqlite
asdf plugin-add lua
asdf plugin-add imagemagick

ok "all plugins added!"

running "Installing asdf plugins"

asdf install nodejs latest
asdf install python 3.10
asdf install mysql
asdf install make
asdf install php
asdf install ruby
asdf install rust
asdf install sqlite
asdf install lua
asdf install imagemagick

ok "all plugins installed!"

running "Configuring asdf plugins"

asdf global nodejs latest
asdf global python 3.10
asdf global mysql latest
asdf global make latest
asdf global php latest
asdf global ruby latest
asdf global rust latest
asdf global sqlite latest
asdf global lua latest
asdf global imagemagick latest

ok "all plugins configured!"
