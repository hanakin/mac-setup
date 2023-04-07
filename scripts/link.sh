#!/bin/zsh

running "symlinking project dotfiles...we do not need to rereference if you see this"

cd ~

symlinkifne .aliases
symlinkifne .crontab
symlinkifne .curlc
symlinkifne .editorconfig
symlinkifne .gemrc
symlinkifne .gitattributes
symlinkifne .gitconfig
symlinkifne .gitignore
symlinkifne .profile
symlinkifne .rvmrc
symlinkifne .screenrc
symlinkifne .shellfn
symlinkifne .shellpaths
symlinkifne .shellvars
symlinkifne .wgetrc
symlinkifne .zlogout
symlinkifne .zprofile
symlinkifne .zshenv
symlinkifne .zshrc

cd ./dotfiles

popd > /dev/null 2>&1
