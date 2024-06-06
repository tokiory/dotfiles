# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Show Library folder
chflags nohidden ~/Library

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Show Finder path bar
defaults write com.apple.finder ShowPathbar -bool true

# Keep folders on top when sorting by name:
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Maximize windows on double clicking them:
defaults write -g AppleActionOnDoubleClick 'Maximize'

# System - Disable launching of previously open applications upon reboot.
defaults write -g ApplePersistence -bool no

# Keyboard - Set a fast keyboard repeat rate.
defaults write NSGlobalDomain KeyRepeat -int 0

# Keyboard - Disable press-and-hold for keys in favor of key repeat.
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Finder - Disable the warning when changing a file extension.
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Finder - Enable list view as default
defaults write com.apple.finder FXPreferredViewStyle -string “Nlsv”

killall Finder
killall Dock
