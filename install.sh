#!/bin/bash

# Create /Devs directory if not exists
if [ ! -d "/Devs" ]; then
  sudo mkdir -p /Devs
  sudo chown $USER:$USER /Devs
fi

# Install zsh and oh my zsh
sudo apt update
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install git
sudo apt install -y git

# Download the gitconfig file (replace with the correct link if needed)
curl https://raw.githubusercontent.com/gderboux/config/main/.gitconfig -o ~/.gitconfig

# Install the latest version of Java via SDKMAN!
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java

# Install Maven
sudo apt install -y maven

# Install Gradle
sudo apt install -y gradle

# Install Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo gpg --dearmor -o /usr/share/keyrings/sublime-text-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/sublime-text-keyring.gpg] https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list > /dev/null
sudo apt update
sudo apt install -y sublime-text

# Add SSH key
ssh-keygen -t rsa -b 4096 -C "EMAIL"

echo "Installation completed"