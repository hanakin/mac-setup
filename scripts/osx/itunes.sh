#!/usr/bin/env bash


source ./scripts/lib.sh

###############################################################################
bot "Configureing iTunes Settings"
###############################################################################

running "Disabling the iTunes store link arrows"
defaults write com.apple.iTunes show-store-link-arrows -bool false;ok

#running "Disable the Genius sidebar in iTunes"
#defaults write com.apple.iTunes disableGeniusSidebar -bool true

running "Disabling the Ping sidebar in iTunes"
defaults write com.apple.iTunes disablePingSidebar -bool true;ok

running "Disabling all the other Ping stuff in iTunes"
defaults write com.apple.iTunes disablePing -bool true;ok

#running "Disable radio stations in iTunes"
#defaults write com.apple.iTunes disableRadio -bool true

running "Makeing ⌘ + F focus the search input in iTunes"
# To use these commands in another language, browse iTunes’s package contents,
# open `Contents/Resources/your-language.lproj/Localizable.strings`, and look
# for `kHiddenMenuItemTargetSearch`.
defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add "Target Search Field" "@F";ok
