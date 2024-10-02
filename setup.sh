#!/bin/bash

cmds=(
  "/bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
  "export GOPATH=$HOME/Working/go; curl -sSL https://git.io/g-install | sh -s"
  "sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\"; rm ~/.zshrc; ln -s $(pwd)/.zshrc ~/.zshrc"
)

configs=(
  "ApplePressAndHoldEnabled -bool false"
  "InitialKeyRepeat -int 12"
  "KeyRepeat -int 2"
  "AppleShowAllExtensions -bool true"
)

base=(
  "firacode-nerd-font --cask"
  "git; ln -s $(pwd)/.gitconfig ~/.gitconfig; ln -s $(pwd)/.gitignore ~/.gitignore"
  docker
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
)

code=(
  "nvim; ln -s $(pwd)/.config/nvim ~/.config/nvim"
  "alacritty; ln -s $(pwd)/.config/alacritty ~/.config/alacritty"
)

for config in ${configs[@]}; do
  default write -g $config
done

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
