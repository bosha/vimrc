#!/bin/bash


# ----------------------------------------------------
# This is simple script to install VIM configuration.
# ----------------------------------------------------
# AUTHOR: bosha
#   SITE: http://the-bosha.ru
# ----------------------------------------------------

promptyn () {
    if [ -z "$1" ]; then
        1="Confirm?"
    fi
    while true; do
        read -p "$1 (y/n): " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            "" ) return 0;;
            * ) echo "Please answer yes or no (y/n).";;
        esac
    done
}

if ! which git &> /dev/null ; then
    echo "GIT required, but not installed. Install them first."
    exit 1
fi

if [[ -d "$HOME"/.vim ]]; then
    if promptyn "Directory "$HOME"/.zsh/ exists. Wanna continue anyway?"; then
        if mv "$HOME"/.vim/ "$HOME"/.vim_old/ &> /dev/null ; then
            echo "Directory renamed to .vim_old/"
        else
            echo "Something goes wrong while moving directory. Problem with permissions?"
            exit 1
        fi
    else
        exit
    fi
fi
if [[ -f "$HOME"/.vimrc ]]; then
    if promptyn "Directory "$HOME"/.vimrc exists. Wanna continue anyway?"; then
        if mv "$HOME"/.vimrc "$HOME"/.vimrc_old &> /dev/null; then
            echo "File renamed to .vimrc_old"
        else
            echo "Something goes wrong while moving directory. Problem with permissions?"
            exit 1
        fi
    else
        exit
    fi
fi

if [[ -d "/tmp/vimrc" ]]; then
    rm -rf /tmp/vimrc &> /dev/null
fi

cd /tmp
echo "Cloning VIM configuration.."
git clone https://github.com/bosha/vimrc.git &> /dev/null

if promptyn "Wanna review configuration before install?" ; then
    [[ -z "$EDITOR" ]] && EDITOR=vi
    $EDITOR /tmp/vimrc/.vimrc
fi

echo "Applying configuration"
mv vimrc/.vimrc "$HOME"/ &> /dev/null


echo "Cloning vundle.."
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle &> /dev/null

echo "Cleaning up.."
rm -rf /tmp/vimrc &> /dev/null

yes | vim +BundleInstall  +qall 2> /dev/null

echo "New VIM configuration installed."
