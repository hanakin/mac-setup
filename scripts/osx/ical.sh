#!/usr/bin/env bash


source ./scripts/lib.sh

###############################################################################
bot "Configureing iCal Settings"
###############################################################################

running "Enabling the debug menu in iCal (pre-10.8)"
defaults write com.apple.iCal IncludeDebugMenu -bool true;ok
