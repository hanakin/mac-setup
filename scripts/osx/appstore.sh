#!/usr/bin/env bash


source ./scripts/lib.sh

###############################################################################
bot "Configureing App Store Settings"
###############################################################################

running "Enabling the WebKit Developer Tools in the Mac App Store"
defaults write com.apple.appstore WebKitDeveloperExtras -bool true;ok

running "Enabling Debug Menu in the Mac App Store"
defaults write com.apple.appstore ShowDebugMenu -bool true;ok
