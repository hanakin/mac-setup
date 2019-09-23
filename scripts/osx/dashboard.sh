#!/usr/bin/env bash


source ./scripts/lib.sh

###############################################################################
bot "Configureing Dashboard Settings"
###############################################################################
running "Speeding up Mission Control animations"
defaults write com.apple.dock expose-animation-duration -float 0.1;ok

running "Disabling grouping windows by application in Mission Control"
# (i.e. use the old Exposé behavior instead)
defaults write com.apple.dock expose-group-by-app -bool false;ok

# running "Disabling Dashboard"
# defaults write com.apple.dashboard mcx-disabled -bool true;ok

running "Disabling showing Dashboard as a Space"
defaults write com.apple.dock dashboard-in-overlay -bool true;ok

running "Disabling automatic Spaces rearrangment based on most recent use"
defaults write com.apple.dock mru-spaces -bool false;ok

running "Enabling Dashboard dev mode (allows keeping widgets on the desktop)"
defaults write com.apple.dashboard devmode -bool true;ok

#bot "Configuring Hot Corners"
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center

#running "Top left screen corner → Mission Control"
#defaults write com.apple.dock wvous-tl-corner -int 2
#defaults write com.apple.dock wvous-tl-modifier -int 0;ok
#running "Top right screen corner → Desktop"
#defaults write com.apple.dock wvous-tr-corner -int 4
#defaults write com.apple.dock wvous-tr-modifier -int 0;ok
#running "Bottom right screen corner → Start screen saver"
#defaults write com.apple.dock wvous-br-corner -int 5
#defaults write com.apple.dock wvous-br-modifier -int 0;ok
