#!/usr/bin/env bash

# backup existed config files
for i in .vim vimfiles .vimrc; do
  # file or symbol link
  if [ -e ~/$i -o -h ~/$i ]; then
    # rm old backup
    if [ -e ~/$i.old ]; then
      rm -rf ~/$i.old
    fi
    # backup file or folder
    mv -f ~/$i ~/$i.old
  fi
done

git clone https://github.com/joaomilho/vimfiles_ruby_dragon ~/.vim && cd ~/.vim && rake install
