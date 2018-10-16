#!/bin/sh

sudo pacman -S manjaro-keyring
sudo pacman -S archlinux-keyring
sudo pacman-optimize && sync
sudo pacman -Syyu
sudo pacman -S yaourt


sudo pacman -S vim
sudo pacman -S fish
sudo pacman -S htop
sudo pacman -S google-chrome
sudo pacman -S git 
sudo pacman -S maven
sudo pacman -S nodejs
sudo pacman -S npm
sudo npm install -g cnpm --registry=https://registry.npm.taobao.org
sudo pacman -S pandoc
sudo pacman -S netease-cloud-music
sudo pacman -S ydcv
sudo pacman -S you-get
sudo pacman -S shadowsocks-qt5
sudo pacman -S scala
ssh-keygen -t rsa

# sougou pinyin
sudo pacman -S fcitx-im
sudo pacman -S fcitx-sogoupinyin
sudo pacman -S fcitx-configtool

# screen shot
sudo pacman -S deepin-screenshot

# office
sudo pacman -S wps-office

# vim plugin
sudo pacman -S vim-youcompleteme-git
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# database
sudo pacman -S dbeaver

# python
sudo pacman -S pycharm
sudo pacman -S ipython

# golang
sudo pacman -S goland
sudo pacman -S go 

# java
sudo pacman -S intellij-idea-ultimate-edition

# C++
sudo pacman -S visual-studio-code-bin

# docker
sudo pacman -S docker

# math
sudo pacman -S geogebra

# graph database
yaourt -S neo4j-community
