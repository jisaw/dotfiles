apt-get update

ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime

apt-get install git

apt-get install vim

cd ~/

git clone https://github.com/jisaw/dotfiles

rm ~/.vimrc

ln -s ~/dotfiles/.vimrc ~/.vimrc

