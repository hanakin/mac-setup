#!/usr/bin/env bash


source ./scripts/lib.sh

running "checking that homebrew is installed"
# Install if we don't have it
if test ! $(which brew); then
  running "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

action "updating homebrew packages..."
# Make sure we’re using the latest Homebrew.
brew update
# Upgrade any already-installed formulae.
brew upgrade --all

ok "all homebrew packages updated..."

action "installing homebrew command-line tools"
# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
require_brew coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
# Install some other useful utilities like `sponge`.
require_brew moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
require_brew findutils
# Install GNU `sed`, overwriting the built-in `sed`.
require_brew gnu-sed --with-default-names

# Install ZSH.
require_brew zsh
require_brew zsh-completions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";ok
sudo chsh -s /bin/zsh;ok
pushd ~ > /dev/null 2>&1

# Install `wget` with IRI support.
require_brew wget --with-iri

# Install Python
require_brew python@2
require_brew python3

# Install ruby-build and rbenv
require_brew ruby-build
require_brew rbenv
LINE='eval "$(rbenv init -)"'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

# Install Node
require_brew node

# Install PHP7
require_brew php70

# Install more recent versions of some OS X tools.
require_brew vim --with-override-system-vi

# Install font tools.
brew tap bramstein/webfonttools
require_brew sfnt2woff
require_brew sfnt2woff-zopfli
require_brew woff2

# Install other useful binaries.
require_brew grep
require_brew openssh
require_brew screen
require_brew ack
require_brew dark-mode
# dos2unix converts windows newlines to unix newlines
require_brew dos2unix
require_brew dockutil
require_brew fortune
require_brew gawk
require_brew git
require_brew git-lfs
require_brew git-flow
require_brew git-extras
require_brew gnupg
require_brew hub
require_brew imagemagick
require_brew imagesnap
require_brew jq
require_brew lua
require_brew lynx
require_brew p7zip
require_brew pigz
require_brew pv
require_brew rename
require_brew rhino
require_brew speedtest_cli
require_brew ssh-copy-id
require_brew tig
require_brew tree
require_brew ttyrec
require_brew webkit2png
require_brew zopfli
require_brew pkg-config libffi
require_brew pandoc

# Lxml and Libxslt
require_brew libxml2
require_brew libxslt
brew link libxml2 --force
brew link libxslt --force

bot "all tools completed just let me clean up the installs"
git lfs install
git lfs install --system

###############################################################################
# Native Apps (via brew cask)                                                 #
###############################################################################
bot "Now lets install your commonly used apps"

action "Installing Communly used apps..."
brew tap caskroom/versions > /dev/null 2>&1
brew tap homebrew/cask-drivers > /dev/null 2>&1

# Install Development tool casks
require_cask atom
require_cask atom-beta
require_cask tower2
require_cask kaleidoscope
require_cask mamp
require_cask cyberduck

# Install downloads
require_cask transmission
require_cask sabnzbd
require_cask couchpotato

# Install virtal machines
require_cask parallels

# Install communication
require_cask skype
# require_cask slack
# require_cask discord

# Install browsers
require_cask google-chrome
require_cask firefox

# Install video
require_cask blu-ray-player
require_cask handbrake
require_cask subler
require_cask vlc
require_cask air-video-server-hd

# Install design
require_cask sketch

# Install utilities
require_cask 1password
require_cask torguard
require_cask grammarly
require_cask dropbox
require_cask osxfuse
require_cask razer-synapse
require_cask smcfancontrol
require_cask sizeup
require_cask gpg-suite
require_cask iterm2
require_cask cleanmymac

# Install Game Launchers
require_cask steam

# Install plugins
require_cask flash-player
require_cask silverlight
require_cask java
require_cask xquartz

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
require_cask qlimagesize
require_cask webpquicklook
require_cask epubquicklook
require_cask qlcolorcode
require_cask qlmarkdown
require_cask qlprettypatch
require_cask qlstephen
require_cask quicklook-csv
require_cask quicklook-json
require_cask suspicious-package

# Manual Installs sickbeard istripper battle-net macpar-deluxe macfusion

ok "all apps instlled!"

# Remove outdated versions from the cellar.
bot "Alright, let me just clean up somethings..."
# Remove outdated versions from the cellar
brew cleanup > /dev/null 2>&1
