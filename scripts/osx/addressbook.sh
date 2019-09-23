#!/usr/bin/env bash


source ./scripts/lib.sh

###############################################################################
bot "Configureing Address Book Settings"
###############################################################################

running "Enabling the debug menu in Address Book"
defaults write com.apple.addressbook ABShowDebugMenu -bool true;ok
