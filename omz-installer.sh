#! /bin/bash
# Programming and idea by : E2MA3N [Iman Homayouni]
# Gitbub : https://github.com/e2ma3n
# Email : e2ma3n@Gmail.com
# Website : http://www.homayouni.info
# License : GPL v2.0
# Last update : 01-February-2020_17:57:08
# Oh My Zsh Installer v7.0 - [Install Oh My Zsh automatically]
#--------------------------------------------------------------#

apt-get update
apt-get -y dist-upgrade
apt install -y zsh powerline fonts-powerline
if [ "$?" = "0" ] ; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
    sed -i 's/robbyrussell/agnoster/g' ~/.zshrc
    chsh -s /bin/zsh
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting" --depth 1
    echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"
else
    echo '[>] error in update and upgrade system'
    exit 1
fi
