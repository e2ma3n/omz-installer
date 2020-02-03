#! /bin/bash
# Programming and idea by : E2MA3N [Iman Homayouni]
# Gitbub : https://github.com/e2ma3n
# Email : e2ma3n@Gmail.com
# Website : http://www.homayouni.info
# License : GPL v2.0
# Last update : 01-February-2020_17:57:08
# Oh My Zsh Installer v1.0 - [Install Oh My Zsh automatically]
#--------------------------------------------------------------#

function install {
    ping -c 1 github.com &> /dev/null
    if [ "$?" = "0" ] ; then
        rm -rf ~/.oh-my-zsh &> /dev/null
        echo "[>] git clone oh-my-zsh.git"
        git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
        cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
        sed -i 's/robbyrussell/agnoster/g' ~/.zshrc
        chsh -s /bin/zsh
        rm -rf $HOME/.zsh-syntax-highlighting &> /dev/null
        echo "[>] git clone zsh-syntax-highlighting.git"
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting" --depth 1
        echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"
        echo "[>] Done"
        su - $USER
    else
        echo "[!] Sorry, can not connect to github.com"
    fi
}

which sudo &> /dev/null
if [ "$?" = "0" ] ; then
    getent group sudo | grep $USER &> /dev/null
    if [ "$?" = "0" ] ; then
        sudo apt-get update
        sudo apt-get -y dist-upgrade
        sudo apt install -y zsh powerline fonts-powerline
        if [ "$?" = "0" ] ; then
            install
        else
            echo '[!] error in update and upgrade system'
            exit 1
        fi
    else
        echo "[!] Sorry, your user may not run sudo on system."
    fi
else
    if [ "$UID" = "0" ] ; then
        apt-get update
        apt-get -y dist-upgrade
        apt install -y zsh powerline fonts-powerline
        if [ "$?" = "0" ] ; then
            install
        else
            echo '[!] error in update and upgrade system'
            exit 1
        fi
    else
        echo "[!] Sorry, you must run root user."
    fi
fi
