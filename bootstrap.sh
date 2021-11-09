#!usr/bin/env zsh

COMPUTER_NAME="kyoko"
#GITDIR=${0:a:h}

## If necessary, chmod +x this file to use it.
echo "Starting setup"

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `os-setuo-setup.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#install xcode CLI
echo "Installing xcode CLI tools"
xcode-select --install

echo "Installing xcode CLI tools complete!"

#install homebrew
if ! command -v brew > /dev/null; then
    printf "Installing Homebrew\n"
    ruby -e "$(curl --location --fail --silent --show-error https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    printf "[SYSTEM] Update Homebrew\n"
    brew update
fi
brew analytics off
printf "\n"
echo "Installing Homebrew Complete!"

#install Brewfile
echo "Installing brew file..."
brew bundle

echo "Installing brew file complete!"

# Set up Fonts
echo "Installing fonts..."
cp -r ./fonts /Library/Fonts
echo "Installing fonts complete!"

#set up ssh key

# Enable SSH
sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist

echo "Setting up ssh..."
ssh-keygen -t rsa -b 4096 -C daisuke@daisuke.dev
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

echo "SSH setup complete!"


# Setting up Defaults

# Set computer name (as done via System Preferences -> Sharing)

sudo scutil --set ComputerName "$COMPUTER_NAME"
sudo scutil --set HostName "$COMPUTER_NAME"
sudo scutil --set LocalHostName "$COMPUTER_NAME"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$COMPUTER_NAME"

# time zone
sudo systemsetup -settimezone "US/Eastern" > /dev/null

# Menu bar: show battery percentage
defaults write com.apple.menuextra.battery ShowPercent YES

# https://github.com/mathiasbynens/dotfiles/blob/main/.macos

echo "Setting up defaults..."
# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable autocorrect
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable auto-capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Diable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Enable tabbing between all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true
# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true


# Enable tap-to-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
# defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
# defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerSwipeGesture -int 1

# Three-finger drag
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# Always show User Library folder
chflags nohidden ~/Library/
# Show the /Volumes folder
sudo chflags nohidden /Volumes


#################################################################
# Screen                                                        #    
#################################################################

# Change default screencapture folder
defaults write com.apple.screencapture location ~/Pictures/Screenshots

# Enable subpixel font rendering on non-Apple LCDs
#defaults write NSGlobalDomain AppleFontSmoothing -int 2

#################################################################
# Dock Stuff                                                    #
#################################################################

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0
# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

#################################################################
# Safari                                                        #
#################################################################
# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Hide Safari’s bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool false


# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Don’t display prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

killall Dock &> /dev/null
killall Finder &> /dev/null
echo "Setting up defaults complete!"
################################################################
# Shell Setup
################################################################
#ln -s ./dotfiles/zshrc ~/.zshrc
#ln -s ./dotfiles/tmux.conf ~/.tmux.conf

#TODO: make this work like this: 
# https://github.com/atomantic/dotfiles/blob/057431a015ff64481bc0582e8b8a805985f3d1f0/install.sh#L238


./symlink.sh

# clone tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

source ~/.zshrc


# Neovim
 
#install plugged
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

