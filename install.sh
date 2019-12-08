echo "Configure keyboard"
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

echo "Configure to show all filename extensions"
defaults write -g AppleShowAllExtensions -bool true

echo "Making Zsh the default shell"
chsh -s $(which zsh)

# BINARIES
echo "Installing binaries"

echo "* Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "* Git"
brew install git

echo "* g (Simple go version manager, gluten-free)"
export GOPATH=$HOME/Working/go
curl -sSL https://git.io/g-install | sh -s -- zsh

echo "* Ruby"
brew install ruby

echo "* iTerm 2"
brew cask install iterm2

echo "* Chrome"
brew cask install google-chrome

echo "* Visual Studio Code"
brew cask install visual-studio-code

echo "* Spotify"
brew cask install spotify

echo "* OBS"
brew cask install obs

echo "* VLC"
brew cask install vlc

echo "* Adobe Creative Cloud"
brew cask install adobe-creative-cloud

echo "* Figma"
brew cask install figma

echo "* Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && rm ~/.zshrc

echo "Symlinking things"
ln -s $(pwd)/.gitconfig ~/.gitconfig
ln -s $(pwd)/.gitignore ~/.gitignore
ln -s $(pwd)/.zshrc ~/.zshrc

echo "Well done! 👍🏻"

read -n -1 -s -r -p "Press any key to continue"

echo "* Log out to activate keyboard config"
sudo launchctl bootout user/$(id -u $USER)
