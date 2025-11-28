#!/bin/bash

echo ""
echo "🚀 Starting Your Custom Termux Auto Setup..."
echo ""

# Update & Upgrade
pkg update -y && pkg upgrade -y

# Essentials
echo "📦 Installing essential packages..."
pkg install -y git curl wget zsh nano python nodejs openssh

# Oh-My-Zsh
echo "⚡ Installing Oh-My-Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Powerlevel10k
echo "🎨 Installing Powerlevel10k theme..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

# Apply theme
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc

# Nerd Font
echo "🔤 Installing Nerd Font (Hack)..."
mkdir -p ~/.fonts
cd ~/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip
unzip Hack.zip && rm Hack.zip

# Storage Permission
echo "📁 Giving storage permission..."
termux-setup-storage

echo ""
echo "✅ Done! Now restart Termux."
echo ""
