#!/bin/bash

# Create nvm references
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Update apt packages
echo "Updating apt packages"
sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y

# Installing google chrome
echo "Installing google chrome"
if [ ! -d "~/Downloads" ] 
then
    echo "Creating ~/Downloads directory"
    mkdir ~/Downloads
fi
wget --quiet --output-document ~/Downloads/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt-get install ~/Downloads/google-chrome-stable_current_amd64.deb -y

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

# Configuring nvm
echo "Configuring nvm"
rm ~/.npmrc
nvm install --lts
nvm use --lts

# Running conda init for bash and zsh
echo "Running conda init for bash and zsh"
conda init bash
conda init zsh

# Update Anaconda
echo "Updating Anaconda"
sudo conda update conda -y

echo "Done with dotfiles install script"