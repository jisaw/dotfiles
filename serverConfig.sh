apt-get update

ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime

apt-get install git

apt-get install vim

cd ~/

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone https://github.com/jisaw/dotfiles

rm ~/.vimrc

ln -s ~/dotfiles/.vimrc ~/.vimrc

