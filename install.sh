echo "Configure keyboard"
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 11
defaults write -g KeyRepeat -int 2

echo "Configure to show all filename extensions"
defaults write -g AppleShowAllExtensions -bool true

# BINARIES
echo "Installing binaries"

echo "* Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "* Git"
brew install git

while true; do
    read -p "Do you wish to install Little Snitch? " ys
    case $ys in
        [Yy]* ) echo "* Little Snitch"; brew install little-snitch --cask; break;;
        [Ss]* ) echo "Skipped"; break;;
        * ) echo "Please answer [Yy]es or [Ss]kip.";;
    esac
done

while true; do
    read -p "Do you wish to install Go? " ys
    case $ys in
        [Yy]* ) echo "* g (Simple go version manager, gluten-free)"; export GOPATH=$HOME/Working/go; curl -sSL https://git.io/g-install | sh -s -- zsh; break;;
        [Ss]* ) echo "Skipped"; break;;
        * ) echo "Please answer [Yy]es or [Ss]kip.";;
    esac
done

while true; do
    read -p "Do you wish to install Ruby? " ys
    case $ys in
        [Yy]* ) echo "* Ruby"; brew install rbenv ruby-build; break;;
        [Ss]* ) echo "Skipped"; break;;
        * ) echo "Please answer [Yy]es or [Ss]kip.";;
    esac
done

while true; do
    read -p "Do you wish to install iTerm2? " ys
    case $ys in
        [Yy]* ) echo "* iTerm 2"; brew install iterm2 --cask; break;;
        [Ss]* ) echo "Skipped"; break;;
        * ) echo "Please answer [Yy]es or [Ss]kip.";;
    esac
done

while true; do
    read -p "Do you wish to install Chrome? " ys
    case $ys in
        [Yy]* ) echo "* Chrome"; brew install google-chrome --cask; break;;
        [Ss]* ) echo "Skipped"; break;;
        * ) echo "Please answer [Yy]es or [Ss]kip.";;
    esac
done

while true; do
    read -p "Do you wish to install Chrome? " ys
    case $ys in
        [Yy]* ) echo "* Chrome"; brew install google-chrome --cask; break;;
        [Ss]* ) echo "Skipped"; break;;
        * ) echo "Please answer [Yy]es or [Ss]kip.";;
    esac
done

while true; do
    read -p "Do you wish to install Visual Studio Code? " ys
    case $ys in
        [Yy]* ) echo "* Visual Studio Code"; brew install visual-studio-code --cask; break;;
        [Ss]* ) echo "Skipped"; break;;
        * ) echo "Please answer [Yy]es or [Ss]kip.";;
    esac
done

while true; do
    read -p "Do you wish to install Spotify? " ys
    case $ys in
        [Yy]* ) echo "* Spotify"; brew install spotify --cask; break;;
        [Ss]* ) echo "Skipped"; break;;
        * ) echo "Please answer [Yy]es or [Ss]kip.";;
    esac
done

while true; do
    read -p "Do you wish to install WhatsApp? " ys
    case $ys in
        [Yy]* ) echo "* WhatsApp"; brew install whatsapp --cask; break;;
        [Ss]* ) echo "Skipped"; break;;
        * ) echo "Please answer [Yy]es or [Ss]kip.";;
    esac
done

while true; do
    read -p "Do you wish to install Authy? " ys
    case $ys in
        [Yy]* ) echo "* Authy"; brew install authy --cask; break;;
        [Ss]* ) echo "Skipped"; break;;
        * ) echo "Please answer [Yy]es or [Ss]kip.";;
    esac
done

while true; do
    read -p "Do you wish to install Adobe Creative Cloud? " ys
    case $ys in
        [Yy]* ) echo "* Adobe Creative Cloud"; brew install adobe-creative-cloud --cask; break;;
        [Ss]* ) echo "Skipped"; break;;
        * ) echo "Please answer [Yy]es or [Ss]kip.";;
    esac
done

while true; do
    read -p "Do you wish to install OBS? " ys
    case $ys in
        [Yy]* ) echo "* OBS"; brew install obs --cask; break;;
        [Ss]* ) echo "Skipped"; break;;
        * ) echo "Please answer [Yy]es or [Ss]kip.";;
    esac
done

while true; do
    read -p "Do you wish to install VLC? " ys
    case $ys in
        [Yy]* ) echo "* VLC"; brew install vlc --cask; break;;
        [Ss]* ) echo "Skipped"; break;;
        * ) echo "Please answer [Yy]es or [Ss]kip.";;
    esac
done

while true; do
    read -p "Do you wish to install Figma? " ys
    case $ys in
        [Yy]* ) echo "* Figma"; brew install figma --cask; break;;
        [Ss]* ) echo "Skipped"; break;;
        * ) echo "Please answer [Yy]es or [Ss]kip.";;
    esac
done

echo "* Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && rm ~/.zshrc

echo "Symlinking things"
ln -s $(pwd)/.gitconfig ~/.gitconfig
ln -s $(pwd)/.gitignore ~/.gitignore
mv ~/.zshrc ~/.zshrc_
ln -s $(pwd)/.zshrc ~/.zshrc

echo "Well done! 👍🏻"

read -n -1 -s -r -p "Press any key to continue"

echo "* Log out to activate keyboard config"
sudo launchctl bootout user/$(id -u $USER)
