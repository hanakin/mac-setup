#!/usr/bin/env bash


source ./scripts/lib.sh

###############################################################################
bot "Configureing Mouse Settings"
###############################################################################

running "Disabling “natural” (Lion-style) scrolling"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false;ok

#running "Disabling smooth scrolling"
# (Uncomment if you’re on an older Mac that messes up the animation)
#defaults write NSGlobalDomain NSScrollAnimationEnabled -bool false;ok
