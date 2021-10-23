#!/bin/bash

# Create nvm references
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Update apt packages
echo "Updating apt packages"
sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y

# Configuring zsh with the powerlevel10k theme
echo "Configuring zsh with the powerlevel10k theme"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cp .p10k.zsh ~/.p10k.zsh
cp .zshrc ~/.zshrc

# Configuring git
echo "Configuring git"
cp .gitconfig ~/.gitconfig

# Configuring vim
echo "Configuring vim"
cp -r .vim ~/

echo "Done with dotfiles install script"