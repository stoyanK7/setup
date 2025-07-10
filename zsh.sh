#!/bin/bash

sudo apt install -y git \
    curl \
    zsh

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Headline theme
# From https://github.com/Moarram/headline/blob/main/docs/Installation.md#oh-my-zsh
git clone https://github.com/moarram/headline.git $ZSH_CUSTOM/themes/headline
ln -s $ZSH_CUSTOM/themes/headline/headline.zsh-theme $ZSH_CUSTOM/themes/headline.zsh-theme
