#!/usr/bin/env bash


source ./scripts/lib.sh

###############################################################################
bot "Configureing Keyboard Settings"
###############################################################################

running "Disabling press-and-hold for keys in favor of key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false;ok

running "Setting a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10;ok

running "Enabling full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3;ok

running "Disabling auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false;ok

running "Enabling Automatic illumination for built-in MacBook keyboard in low light"
defaults write com.apple.BezelServices kDim -bool true;ok

running "Disabling keyboard illumination when computer is not used for 5 minutes"
defaults write com.apple.BezelServices kDimTime -int 300;ok
