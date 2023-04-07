#!/bin/zsh

# include my library helpers for colorized echo and require_brew, etc
source ./scripts/lib.sh

###############################################################################
# Gather info
###############################################################################

bot "Hello. I am Lucy, I will be helping you with setting up your system."

# Ask for the administrator password upfront
bot "First I will need you to enter your systems password to be able to install and change some things:"
sudo -v
# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# make a backup directory for overwritten dotfiles
if [[ ! -e ~/.dotfiles_backup ]]; then
    bot "Since this is the firstime I am setting up a computer for you, lets get the introductions out of the way."

    ask "What is your first name? " firstname

    bot "Hi $firstname, Its nice to meet you."
    bot "Now that we are on a first name basis lets get a little more personal"

    mkdir ~/.dotfiles_backup
fi

###############################################################################
# Configure accounts
###############################################################################
if [[ ! -e ~/.ssh/id_rsa ]]; then
    bot "Do not be alarmed I am not trying to steal your idenity. I need to pass all the info we colected to your computer to set things up."

    ask "What would you like to call this computer? " netname

    running "Setting computer name (as done via System Preferences → Sharing)..."
    sudo scutil --set ComputerName $netname
    sudo scutil --set HostName $netname
    sudo scutil --set LocalHostName $netname
    sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $netname;ok

    ok "computer name set!"

    ask "What is your email? " email

    running "Making SSH key..."
    make_ssh
    ok "SSH key made!"
fi

bot "Now lets prepare your System for all the work we need to do"

###############################################################################
# System Prep
###############################################################################
bot "First lets check and see if there are any updates before we begin, this may take some time"

running "Updating computer operating system..."
# Install all available updates
sudo softwareupdate -ia --verbose;ok
# Install only recommended available updates
#sudo softwareupdate -ir --verbose
ok "computer uptodate!"

bot "Lets grab the current version of Rosetta to ensure all apss work even if they are not native to ARM based systems"

running "Installing Rosetta2..."
# Install Rosetta 2
/usr/sbin/softwareupdate --install-rosetta --agree-to-license;ok
ok "rosetta2 installed!"

bot "Now I will need Xcode command Line Tools to continue...Let me grab them this may also take awhile possibly sevearl hours"

running "Installing Xcode Command Line Tools..."
# Install Xcode command line tools
xcode-select --install;ok
ok "xcode command line tools installed!"

bot "Alright I have everything I need."

###############################################################################
# OSX Setup
###############################################################################

bot "Lets modify the OS to make more sense..."

source ./scripts/osx.sh;ok "all done!"

bot "Woot! All done. That was alot. You system should be all good now"


###############################################################################
# Symlinks
###############################################################################

#bot "We need to tell your system where all your hidden files are and pass it all the info we have colected. But first lets make a backup of everything"

#source ./scripts/link.sh;ok "all dot_files symlinked"

#bot "Now lets ensure some required tools I need to help set everything up are installed."

###############################################################################
# Homebrew Install
###############################################################################

bot "Lets start by installing some global tools and apps"

source ./scripts/brew.sh;ok "all clean"

###############################################################################
# Development Environment Setup
###############################################################################

bot "Ok Lets install and configure your Development Environment"

source ./scripts/npm.sh;ok

source ./scripts/gem.sh;ok

bot "I am also going to install PHP Composer"

running "Installing PHP Composer"

curl -sS https://getcomposer.org/installer | php;ok
sudo mv composer.phar /usr/local/bin/composer;ok

ok "composer installed!"

bot "Development tools and environment condifgured. You system should be all good to go now."
