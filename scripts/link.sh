#!/usr/bin/env bash


source ./scripts/lib.sh

action "symlinking project dotfiles..."

cd ~

symlinkifne .aliases
symlinkifne .crontab
symlinkifne .curlc
symlinkifne .editorconfig
symlinkifne .gemrc
symlinkifne .gitconfig
symlinkifne .gitattributes
symlinkifne .gitignore
symlinkifne .profile
symlinkifne .rvmrc
symlinkifne .screenrc
symlinkifne .shellfn
symlinkifne .shellpaths
symlinkifne .shellvars
symlinkifne .vim
symlinkifne .vimrc
symlinkifne .wgetrc
symlinkifne .zlogout
symlinkifne .zprofile
symlinkifne .zshenv
symlinkifne .zshrc

cd ./dotfiles

popd > /dev/null 2>&1
