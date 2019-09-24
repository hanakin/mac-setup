#!/usr/bin/env bash

# include my library helpers for colorized echo and require_brew, etc
source ./scripts/lib.sh

###############################################################################
# Gather info
###############################################################################

bot "Hello. I am Lucy, I will be helping you with setting up your system."

# Ask for the administrator password upfront
bot "First I will need you to enter your systems password to be able to install some things:"
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# make a backup directory for overwritten dotfiles
if [[ ! -e ~/.dotfiles_backup ]]; then
    mkdir ~/.dotfiles_backup
fi

bot "Since this is the firstime I am setting up a computer for you, lets get the introductions out of the way."

ask "What is your first name? " firstname
ask "and how about your last name? " lastname

fullname="$firstname $lastname"

bot "Hi $firstname, Its nice to meet you."
bot "Now that we are on a first name basis lets get a little more personal"

ask "What is your email? " email
ask "What is your github.com username? " githubuser
ask "What would you like to call this computer? " netname


###############################################################################
# Configure accounts
###############################################################################

bot "I need to pass all the info we colected to your computer"

running "Setting computer name (as done via System Preferences → Sharing)"
sudo scutil --set ComputerName $netname
sudo scutil --set HostName $netname
sudo scutil --set LocalHostName $netname
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $netname;ok

make_ssh

ok "Now lets prepare your System for all the work we need to do"


###############################################################################
# System Prep
###############################################################################
bot "First lets check and see if there are any updates before we begin, this may take some time"

# Install all available updates
# sudo softwareupdate -ia --verbose
# Install only recommended available updates
#sudo softwareupdate -ir --verbose

ok "Now I will need Xcode command Line Tools to continue...Let me grab them this may take awhile"

# Install Xcode command line tools
xcode-select --install

ok "I have everything I need."


###############################################################################
# Symlinks
###############################################################################

# bot "I need to tell your system where all your hidden files are and pass it all the info we colected"
#
# ./scripts/link.sh
#
# ok "Now lets ensure some required tools I need to help set everything up are installed."

###############################################################################
# Homebrew Install
###############################################################################

bot "Lets start by installing some global tools and apps"

source ./scripts/brew.sh

ok "all clean"


###############################################################################
# Development Environment Setup
###############################################################################

bot "Ok Lets install and configure your Development Environment"

source ./scripts/npm.sh

source ./scripts/apm.sh

source ./scripts/gem.sh

running "Installing PHP Composer"

curl -sS https://getcomposer.org/installer | php;ok
sudo mv composer.phar /usr/local/bin/composer

ok "Development tools and environment condifgured"


###############################################################################
# OSX Setup
###############################################################################

bot "Now lets Configure your System"

source ./scripts/osx.sh

ok "Woot! All done. That was alot."
