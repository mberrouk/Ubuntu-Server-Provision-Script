#!/bin/bash
#
# This simple bash script will configure a linux server
# with some basic software and capabilities.

# Check for root permissions
if [[ $(whoami) != "root" ]]; then
    echo "Please run this script as root user"
    exit 1
fi

# Stop the script in the event something failed
set -e

# Reset the terminal screen
reset
clear

# Print a message to std out that the process has started
echo
echo "## "
echo "## routine: [simpleProvisionScript] // state: [starting]"
echo "## "
echo

# Update the operating System packages
apt-get update -y

# Upgrade existing software and operating system
apt-get upgrade -y
apt-get dist-upgrade -y

# Install ZSH
apt install zsh

# Install OHMYZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Change the default Shell 
chsh -s $(which zsh)

# To be able to use add-apt-repository you may need to install software-properties-common
apt-get install software-properties-common

# Install Neovim from PPA
## Prerequisites for the Python modules
apt-get install python-dev python-pip python3-dev python3-pip
## Install nvim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

# Add a simple config for nvim
##Pre-requisites
apt-get install git exuberant-ctags ncurses-term curl
##Python bundle (optionally)
pip install flake8 jedi
pip2 install --user --upgrade neovim
pip3 install --user --upgrade neovim
##Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
## Generat and install file config init.vim
curl 'https://vim-bootstrap.com/generate.vim' --data 'editor=neovim&frameworks=vuejs&langs=c&langs=python' > ~/.config/nvim/init.vim

echo
echo "## "
echo "## routine: [simpleProvisionScript] // state: [completed]"
echo "## "
echo
