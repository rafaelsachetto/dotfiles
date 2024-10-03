#!/bin/bash

cmds=(
  "/bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\"; eval \"\$(/opt/homebrew/bin/brew shellenv)\""
  "curl -sSL https://git.io/g-install | sh -s"
  "sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\"; rm ~/.zshrc ~/.zprofile; ln -s $(pwd)/.zprofile ~/.zprofile; ln -s $(pwd)/.zshrc ~/.zshrc"
)

configs=(
  "ApplePressAndHoldEnabled -bool false"
  "InitialKeyRepeat -int 12"
  "KeyRepeat -int 2"
  "AppleShowAllExtensions -bool true"
  "NSTableViewDefaultSizeMode -int 1"
  "AppleShowAllFiles -bool true"
  "show-recents -bool false"
  "static-only -bool true"
)

base=(
  "font-fira-code-nerd-font --cask"
  "git; rm ~/.gitconfig ~/.gitignore; ln -s $(pwd)/.gitconfig ~/.gitconfig; ln -s $(pwd)/.gitignore ~/.gitignore"
  "docker --cask"
  "alacritty; rm -rf ~/.config/alacritty; mkdir ~/.config; ln -s $(pwd)/.config/alacritty ~/.config/alacritty"
)

app=(
  "little-snitch@5 --cask"
  "spotify --cask"
  "adobe-creative-cloud --cask"
  "figma --cask"
  "google-chrome --cask"
  "whatsapp --cask"
  "notion --cask"
  "notion-calendar --cask"
  "vlc --cask"
  "cloudflare-warp --cask"
  "nordvpn --cask"
)

code=(
  "nvim; rm -rf ~/.config/nvim; mkdir ~/.config; ln -s $(pwd)/.config/nvim ~/.config/nvim"
  nvm
)

for config in ${configs[@]}; do
  eval "defaults write -g ${config}"
done
sudo killall Finder
sudo killall Docker

echo "Executing some cmd for user: ${USER}"
echo

for cmd in ${cmds[@]}; do
  echo "Do you wish to execute \"$cmd\"?"
  select yn in "Yes" "No"; do
    case $yn in
      Yes ) eval $cmd; break;;
      No ) echo "Skipped..."; break;;
    esac
  done
  echo
done

apps=( "${base[@]}" "${app[@]}" "${code[@]}" )

echo "Brewing apps for user: ${USER}"
echo

for app in ${apps[@]}; do
  cmd="brew install ${app}"
  echo "Do you wish to execute \"${cmd}\"?"
  select is in "Install" "Skip"; do
    case $is in
      Install ) eval $cmd; break;;
      Skip ) echo "Skipped..."; break;;
    esac
  done
  echo
done

echo "Brewed some apps."
echo
echo "Well done 👍🏻"
echo
echo "* Log out to activate keyboard config"

sudo launchctl bootout gui/$(id -u $USER)

