#!/bin/sh
echo "Starting setup"

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
printf "\n"
echo "Installing Homebrew Complete!"

#install Brewfile
echo "Installing brew file..."
brew bundle

echo "Installing brew file complete!"

#set up ssh key
echo "Setting up ssh..."
ssh-keygen -t rsa -b 4096 -C daisuke@daisuke.dev
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

echo "SSH setup complete!"


# Setting up Defaults

echo "Setting up defaults..."
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

# Change default screencapture folder
defaults write com.apple.screencapture location ~/Pictures/Screenshots

# Enable tap-to-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Always show User Library folder
chflags nohidden ~/Library/
# Show the /Volumes folder
sudo chflags nohidden /Volumes

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
killall Dock &> /dev/null
killall Finder &> /dev/null
echo "Setting up defaults complete!"
