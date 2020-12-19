#!/usr/bin/env bash

# backup existed config files
for i in .config/nvim; do
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

git clone https://github.com/josemarluedke/vimfiles ~/.config/nvim && cd ~/.config/nvim && rake install
