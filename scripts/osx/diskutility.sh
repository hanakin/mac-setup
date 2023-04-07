#!/bin/zsh


source ./scripts/lib.sh

###############################################################################
bot "Configureing Disk Utility Settings"
###############################################################################

running "Enabling the debug menu in Disk Utility"
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true;ok
