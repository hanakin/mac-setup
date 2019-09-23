#!/usr/bin/env bash


source ./scripts/lib.sh

###############################################################################
bot "Configureing Terminal & iTerm2 Settings"
###############################################################################

running "Enabling Only use of UTF-8 in Terminal.app"
defaults write com.apple.terminal StringEncodings -array 4;ok

#running "Use a modified version of the Solarized Dark theme by default in Terminal.app"
#TERM_PROFILE='Solarized Dark xterm-256color';
#CURRENT_PROFILE="$(defaults read com.apple.terminal 'Default Window Settings')";
#if [ "${CURRENT_PROFILE}" != "${TERM_PROFILE}" ]; then
    #open "./configs/${TERM_PRO4

#running "Enable “focus follows mouse” for Terminal.app and all X11 apps"
# i.e. hover over a window and start typing in it without clicking first
#defaults write com.apple.terminal FocusFollowsMouse -bool true
#defaults write org.x.X11 wm_ffm -bool true;ok

running "Installing midaym theme for iTerm"
open "./configs/midaym.itermcolors"
cp -r ./configs/midaym.zsh-theme ~/.oh-my-zsh/themes;ok

running "Disabling the annoying prompt when quitting iTerm"
defaults write com.googlecode.iterm2 PromptOnQuit -bool false;ok

running "Hideing tab title bars"
defaults write com.googlecode.iterm2 HideTab -bool true;ok

running "Setting system-wide hotkey to show/hide iterm with ^\`"
defaults write com.googlecode.iterm2 Hotkey -bool true;
defaults write com.googlecode.iterm2 HotkeyChar -int 96;
defaults write com.googlecode.iterm2 HotkeyCode -int 50;
defaults write com.googlecode.iterm2 HotkeyModifiers -int 262401;
ok

# running "Make iTerm2 load new tabs in the same directory"
# defaults export com.googlecode.iterm2 /tmp/plist
# /usr/libexec/PlistBuddy -c "set \"New Bookmarks\":0:\"Custom Directory\" Recycle" /tmp/plist
# defaults import com.googlecode.iterm2 /tmp/plist;ok
