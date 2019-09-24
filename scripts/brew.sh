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
brew upgrade

ok "all homebrew packages updated..."

action "installing homebrew command-line tools"
# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed

# Install ZSH.
require_brew zsh
require_brew zsh-completions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";ok
sudo chsh -s /bin/zsh;ok
pushd ~ > /dev/null 2>&1

# Install `wget` with IRI support.
require_brew wget

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
# require_brew php70

# Install more recent versions of some OS X tools.
require_brew vim

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
# brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install gs
brew install imagemagick
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli

# Remove outdated versions from the cellar.
brew cleanup


bot "all tools completed just let me clean up the installs"
brew cleanup

###############################################################################
# Native Apps (via brew cask)                                                 #
###############################################################################
bot "Now lets install your commonly used apps"

action "Installing Communly used apps..."
brew tap caskroom/versions > /dev/null 2>&1
brew tap homebrew/cask-drivers > /dev/null 2>&1

# Install Development tool casks
# require_cask atom
# require_cask atom-beta
# require_cask tower2
# require_cask kaleidoscope
# require_cask mamp
# require_cask cyberduck

# Install downloads
# require_cask transmission
# require_cask sabnzbd
# require_cask couchpotato

# Install virtal machines
# require_cask parallels

# Install communication
# require_cask skype
# require_cask slack
# require_cask discord

# Install browsers
# require_cask google-chrome
# require_cask firefox

# Install video
# require_cask blu-ray-player
# require_cask handbrake
# require_cask subler
# require_cask vlc
# require_cask air-video-server-hd

# Install design
# require_cask sketch

# Install utilities
# require_cask 1password
# require_cask torguard
# require_cask grammarly
# require_cask dropbox
require_cask osxfuse
# require_cask razer-synapse
# require_cask smcfancontrol
# require_cask sizeup
require_cask gpg-suite
# require_cask iterm2
# require_cask cleanmymac

# Install Game Launchers
# require_cask steam

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
