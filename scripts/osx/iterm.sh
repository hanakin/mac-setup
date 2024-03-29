#!/bin/zsh


source ./scripts/lib.sh

###############################################################################
bot "Configureing Terminal & iTerm2 Settings"
###############################################################################

running "Enabling Only use of UTF-8 in Terminal.app"
defaults write com.apple.terminal StringEncodings -array 4;ok

# running "Use a modified version of the Solarized Dark theme by default in Terminal.app"
# osascript <<EOD
#
# tell application "Terminal"
#
# 	local allOpenedWindows
# 	local initialOpenedWindows
# 	local windowID
# 	set themeName to "Solarized Dark xterm-256color"
#
# 	(* Store the IDs of all the open terminal windows. *)
# 	set initialOpenedWindows to id of every window
#
# 	(* Open the custom theme so that it gets added to the list
# 	   of available terminal themes (note: this will open two
# 	   additional terminal windows). *)
# 	do shell script "open '$HOME/init/" & themeName & ".terminal'"
#
# 	(* Wait a little bit to ensure that the custom theme is added. *)
# 	delay 1
#
# 	(* Set the custom theme as the default terminal theme. *)
# 	set default settings to settings set themeName
#
# 	(* Get the IDs of all the currently opened terminal windows. *)
# 	set allOpenedWindows to id of every window
#
# 	repeat with windowID in allOpenedWindows
#
# 		(* Close the additional windows that were opened in order
# 		   to add the custom theme to the list of terminal themes. *)
# 		if initialOpenedWindows does not contain windowID then
# 			close (every window whose id is windowID)
#
# 		(* Change the theme for the initial opened terminal windows
# 		   to remove the need to close them in order for the custom
# 		   theme to be applied. *)
# 		else
# 			set current settings of tabs of (every window whose id is windowID) to settings set themeName
# 		end if
#
# 	end repeat
#
# end tell
#
# EOD

#running "Enable “focus follows mouse” for Terminal.app and all X11 apps"
# i.e. hover over a window and start typing in it without clicking first
#defaults write com.apple.terminal FocusFollowsMouse -bool true
#defaults write org.x.X11 wm_ffm -bool true;ok

running "Disable the annoying line marks"
defaults write com.apple.Terminal ShowLineMarks -int 0;ok

#####

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
