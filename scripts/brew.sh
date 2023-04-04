#!/usr/bin/env bash


source ./scripts/lib.sh

running "checking that homebrew is installed"
# Install if we don't have it
if test ! $(which brew); then
  running "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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

brew install --cask iterm2

# Install ZSH.
require_brew zsh
require_brew zsh-completions
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";ok
sudo chsh -s /bin/zsh;ok
pushd ~ > /dev/null 2>&1

# Installing multiple language runtimes separately is now officially cringe. With asdf, you can manage multiple versions of Python, Node.js, Java, Go, and so on, with the same set of commands. As a cherry on top, there’s a plugin for asdf on oh-my-zsh to handle pathing and command autocompletion!

ok "Lets make version managment of the command line a thing of the past."

brew install asdf

source ./scripts/asdf.sh

ok "Now continuing to install brews."

# Install `wget` with IRI support.
require_brew wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
# brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install xpdf
# brew install xz

# Install other useful binaries.
# brew install ack
#brew install exiv2
# brew install git
brew install git-lfs
# brew install gs
# brew install lynx
# brew install p7zip
# brew install pigz
# brew install pv
# brew install rename
# brew install rlwrap
# brew install ssh-copy-id
# brew install tree
# brew install vbindiff
# brew install zopfli

# Remove outdated versions from the cellar.

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
require_cask visual-studio-code
require_cask jetbrains-toolbox
require_cask kaleidoscope
require_cask mamp
require_cask cyberduck

# Install downloads
# require_cask transmission

# Install virtal machines
require_cask parallels

# Install communication
require_cask slack
require_cask discord

# Install browsers
require_cask google-chrome
require_cask microsoft-edge
require_cask firefox

# Install video
require_cask handbrake
require_cask subler
require_cask vlc
require_cask plex

# Install design
require_cask sketch
require_cask figma
require_cask adobe-creative-cloud

# Install utilities
require_cask 1password
require_cask nordvpn
require_cask grammarly
require_cask hiddenbar
require_cask endurance
require_cask dropbox
require_cask osxfuse
require_cask razer-synapse
require_cask smcfancontrol
require_cask gpg-suite
require_cask cleanmymac


# Install plugins


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

###### Manual Installs #######
# macpar-deluxe
# macfusion
# entropy
# magnet

ok "all apps instlled!"

# Remove outdated versions from the cellar.
bot "Alright, let me just clean up somethings..."
# Remove outdated versions from the cellar
brew cleanup > /dev/null 2>&1
