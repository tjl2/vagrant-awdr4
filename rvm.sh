#!/bin/bash
curl -L https://get.rvm.io | bash -s stable
if ! grep -q "source ~/.profile" ~/.bash_profile; then
  echo -e "\nsource ~/.profile\n" >> ~/.bash_profile 
fi
# Do some of the dotfile setup so we can actually run rvm inside ansible
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
PATH=$PATH:$HOME/.rvm/bin

rvm requirements --autolibs=enable
