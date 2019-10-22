echo "Disable menu accent when press and hold a key"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

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

echo "* iTerm 2"
brew cask install iterm2

echo "* Chrome"
brew cask install google-chrome

echo "* Visual Studio Code"
brew cask install visual-studio-code

echo "* OBS"
brew cask install obs

echo "* VLC"
brew cask install vlc

echo "* Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && rm ~/.zshrc

echo "Symlinking things"
ln -s $(pwd)/.gitconfig ~/.gitconfig
ln -s $(pwd)/.gitignore ~/.gitignore
ln -s $(pwd)/.zshrc ~/.zshrc
source ~/.zshrc

echo "Well done! 👍🏻"
