#!/bin/zsh


source ./scripts/lib.sh

###############################################################################
bot "Configureing Dock Settings"
###############################################################################

running "Enabling highlight hover effect for the grid view of a stack (Dock)"
defaults write com.apple.dock mouse-over-hilite-stack -bool true;ok

running "Setting the icon size of Dock items to 36 pixels"
defaults write com.apple.dock tilesize -int 36;ok

running "Changing minimize/maximize window effect to scale"
defaults write com.apple.dock mineffect -string "scale";ok

#running "Minimizing windows into their application’s icon"
#defaults write com.apple.dock minimize-to-application -bool true;ok

running "Enabling spring loading for all Dock items"
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true;ok

running "Showing indicator lights for open applications in the Dock"
defaults write com.apple.dock show-process-indicators -bool true;ok

#running "Wipe all (default) app icons from the Dock"
# This is only really useful when setting up a new Mac, or if you don’t use
# the Dock to launch apps.
#defaults write com.apple.dock persistent-apps -array;ok

#running "Show only open applications in the Dock"
#defaults write com.apple.dock static-only -bool true;ok

running "Disabling opening application animation from the Dock"
defaults write com.apple.dock launchanim -bool false;ok

running "Removeing the auto-hiding Dock delay"
defaults write com.apple.dock autohide-delay -float 0;ok

running "Removeing the animation when hiding/showing the Dock"
defaults write com.apple.dock autohide-time-modifier -float 0;ok

#running "Enabling Automatically hide and show the Dock"
#defaults write com.apple.dock autohide -bool true;ok

running "Making Dock icons of hidden applications translucent"
defaults write com.apple.dock showhidden -bool true;ok

running "Don’t show recent applications in Dock"
defaults write com.apple.dock show-recents -bool false;ok


running "Disabling the Launchpad gesture (pinch with thumb and three fingers)"
defaults write com.apple.dock showLaunchpadGestureEnabled -int 0;ok

# running "Reseting Launchpad, but keep the desktop wallpaper intact"
# find "${HOME}/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete;ok

# running "Adding iOS Simulator to Launchpad"
# sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app" "/Applications/Simulator.app"
# sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator (Watch).app" "/Applications/Simulator (Watch).app";ok

# running "Add a spacer to the left side of the Dock (where the applications are)"
#defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}';ok

# running "Add a spacer to the right side of the Dock (where the Trash is)"
# defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}';ok
