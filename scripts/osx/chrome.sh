#!/usr/bin/env bash


source ./scripts/lib.sh

###############################################################################
bot "Configureing Google Chrome & Google Chrome Canary Settings"
###############################################################################

running "Disabling the all too sensitive backswipe"
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false;ok

running "Disable the all too sensitive backswipe on Magic Mouse"
defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableMouseSwipeNavigateWithScrolls -bool false;ok

running "Useing the system-native print preview dialog"
defaults write com.google.Chrome DisablePrintPreview -bool true
defaults write com.google.Chrome.canary DisablePrintPreview -bool true;ok

runnning "Expand the print dialog by default"
defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true;ok
