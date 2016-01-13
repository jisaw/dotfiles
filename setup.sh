#!/bin/bash
echo 'Distributing dotfiles\n'
echo 'Moving .vimrc to ~/.vimrc\n'
cp .vimrc ~/.vimrc
echo 'Installing Vundle\n'
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c :BundleInstall \
    -c qa
echo 'Moving .zshrc to ~/.zshrc\n'
cp .zshrc ~/.zshrc
echo 'Moving .gitconfig to ~/.gitconfig\n'
cp .gitconfig ~/.gitconfig
echo 'Moving .tmux.conf to ~/.tmux.conf\n'
cp .tmux.conf ~/.tmux.conf
tmux source ~/.tmux.conf
echo 'Finished\n'
