#!/bin/zsh


source ./scripts/lib.sh

###############################################################################
bot "Configureing the Screen"
###############################################################################

running "Requiring password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0;ok

#running "Save screenshots to the desktop"
#defaults write com.apple.screencapture location -string "${HOME}/Desktop";ok

# running "Save screenshots to the Pictures/Screenshots"
# mkdir ${HOME}/Pictures/Screenshots
# defaults write com.apple.screencapture location -string "${HOME}/Pictures/Screenshots";ok

running "Saveing screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)"
defaults write com.apple.screencapture type -string "png";ok

running "Disable shadow in screenshots"
defaults write com.apple.screencapture disable-shadow -bool true;ok

running "Enabling subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2;ok

running "Enabling HiDPI display modes (requires restart)"
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true;ok
