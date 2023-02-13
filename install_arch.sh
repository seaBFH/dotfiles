#!/usr/bin/env zsh

# pacman -Syu
pacman -Syu

# sys tools
pacman -S usbutils network-manager bluez bluez-utils konscole pulseaudio-bluetooth

# pacman -S
pacman -S stow nodejs yarn neovim fzf ranger lf paco exa ghq xclip kubectl helm openvpn qopenvpn bat curlie mysql-workbench containerd docker fuse2 fuse-overlays flameshot jq pandoc npm

# npm install
npm install -g live-server

# aur
yay -S ttf-victor-mono-nerd feishu-bin virtualbox-bin drawio-desktop-bin xmind buf-bin baidunetdisk-bin
# reinstall feishu-bin if feishu do not work.  

# rustup

# go env

# git global config

# tmux tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
