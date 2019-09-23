#!/usr/bin/env bash


source ./scripts/lib.sh

###############################################################################
bot "Configureing Mouse Settings"
###############################################################################

running "Disabling “natural” (Lion-style) scrolling"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false;ok
