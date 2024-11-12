#!/bin/bash

########### Brew Global Install List ###########
brew install mas
brew install zsh
brew install zsh-completions
brew install ffmpeg
brew install git
brew install handbrake
brew install imagemagick
brew install iperf
brew install media-info
brew install pyenv
brew install rclone
brew install yt-dlp

########### Brew Global Cask Install List ###########
brew install --cask 1password
brew install --cask a-better-finder-rename
brew install --cask adobe-creative-cloud
brew install --cask eloston-chromium
brew install --cask brave-browser
brew install --cask discord
brew install --cask dropbox
brew install --cask eul
brew install --cask figma
brew install --cask firefox
brew install --cask handbrake
brew install --cask iterm2
brew install --cask microsoft-remote-desktop
brew install --cask microsoft-edge
brew install --cask openvpn-connect
# brew install --cask paparazzi
brew install --cask rectangle
brew install --cask signal
brew install --cask slack
brew install --cask spotify
brew install --cask stats
brew install --cask the-unarchiver
brew install --cask timemachineeditor
# brew install --cask tint
brew install --cask visual-studio-code
brew install --cask vlc
brew install --cask zoom

########### Brew Personal Cask Install List ###########
brew install --cask audacity
brew install --cask cinebench
brew install --cask elgato-stream-deck
brew install --cask geekbench
# brew install --cask ipfs
brew install --cask losslesscut
# brew install --cask proton-drive
brew install --cask protonvpn
brew install --cask protonmail-bridge

########### Brew Work Install List ###########
# brew install jq
# brew install minikube
# brew install pillow
# brew install svgo
# brew install vault
brew install --cask docker
brew install --cask microsoft-teams

########### Mac App Store Personal ###########
mas install 1438772273  #  Cinebench            (23.2)
mas install 1168254295  #  AmorphousDiskMark    (4.0.1)
mas install 310633997  #   WhatsApp            (24.21.81)
# mas install 1193539993  #  Brother iPrint&Scan  (12.0.3)
# mas install 408981434  #   iMovie               (10.4.2)

echo "And done..."
