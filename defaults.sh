#!/bin/sh

# First, enable this setting for your terminal:
# System Settings > Privacy and Security > Full Disk Access

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

cd ~

# ********************************************************************************
# * Control Center                                                               *
# ********************************************************************************

# Don't show Siri in Menu Bar
defaults write com.apple.Siri StatusMenuVisible -bool false
defaults -currentHost write com.apple.controlcenter Siri -int 8

# Don't show Spotlight in Menu Bar
defaults -currentHost write com.apple.Spotlight MenuItemHidden -bool true

# ********************************************************************************
# * Displays                                                                     *
# ********************************************************************************

# Show resolutions as a list
defaults write com.apple.Displays-Settings.extension showListByDefault -bool true

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -bool true

# Enable HiDPI display modes
defaults -currentHost write com.apple.windowserver DisplayResolutionEnabled -bool true

# ********************************************************************************
# * Bluetooth                                                                    *
# ********************************************************************************

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Max (editable)" -int 80
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 80
defaults write com.apple.BluetoothAudioAgent "Apple Initial Bitpool (editable)" -int 80
defaults write com.apple.BluetoothAudioAgent "Apple Initial Bitpool Min (editable)" -int 80
defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool" -int 80
defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Max" -int 80
defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Min" -int 80

# ********************************************************************************
# * Desktop	                                                                     *
# ********************************************************************************

# Disable Hot Corners
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-tr-modifier -int 0
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-tr-modifier -int 0
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-bl-modifier -int 0

###################################################################################################################
# SAFARI
###################################################################################################################
echo "Setting Safari preferences..."

# Set tab layout to compact
defaults write com.apple.Safari ShowStandaloneTabBar -bool false

# Show full website address
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Disable open "safe" files after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Show features for web developers
defaults write com.apple.Safari.SandboxBroker ShowDevelopMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari WebKitPreferences.developerExtrasEnabled -bool true

###################################################################################################################
# FINDER
###################################################################################################################
echo "Setting Finder preferences..."

# Show Hard disks, External disks, Removable Media and Connected servers on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Show all filename extensions
defaults write com.apple.finder AppleShowAllExtensions -bool true

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show path bar in the bottom of the Finder windows
defaults write com.apple.finder ShowPathbar -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Disable the “reopen windows when logging back in” option"
# This works, although the checkbox will still appear to be checked.
# defaults write com.apple.loginwindow TALLogoutSavesState -bool false
# defaults write com.apple.loginwindow LoginwindowLaunchesRelaunchApps -bool false

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Remove duplicates in the "Open With" menu
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# ********************************************************************************
# * Printers & Scanners                                                          *
# ********************************************************************************

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# ********************************************************************************
# * Screenshots                                                                  *
# ********************************************************************************

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true


###################################################################################################################
# Trackpad
###################################################################################################################
echo "Setting Mouse and Trackpad preferences..."

# Enable tap to click for this user and for the login screen
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Change Trackpad from Natural to Normal
defaults write NSGlobalDomain com.apple.swipescrolldirection 0

echo "Trackpad: tap to click, double-tap to drag, and change the scroll direction"
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u


###################################################################################################################
# Dock
###################################################################################################################

# Show recently used apps in a separate section of the Dock.
defaults write com.apple.dock "show-recents" -bool "true"


# ********************************************************************************
# * Quality of life                                                              *
# ********************************************************************************

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -bool false

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -bool false

# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# Enable the debug menu in Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# ********************************************************************************
# * Kill some affected applications                                              *
# ********************************************************************************
if pgrep -x "Activity Monitor" > /dev/null; then killall "Activity Monitor"; fi
if pgrep -x "cfprefsd" > /dev/null; then killall "cfprefsd"; fi
if pgrep -x "Dock" > /dev/null; then killall "Dock"; fi
if pgrep -x "Finder" > /dev/null; then killall "Finder"; fi
if pgrep -x "Mail" > /dev/null; then killall "Mail"; fi
if pgrep -x "Messages" > /dev/null; then killall "Messages"; fi
if pgrep -x "Photos" > /dev/null; then killall "Photos"; fi
if pgrep -x "Safari" > /dev/null; then killall "Safari"; fi
if pgrep -x "SystemUIServer" > /dev/null; then killall "SystemUIServer"; fi
if pgrep -x "Terminal" > /dev/null; then killall "Terminal"; fi

echo "Done. Please restart for everything to take effect."