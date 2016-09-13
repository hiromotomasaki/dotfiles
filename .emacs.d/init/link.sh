#!/bin/bash
fromDir="${HOME}/dotfiles/.emacs.d/init"
toDir="${HOME}/dotfiles/.emacs.d/init-loader"

num="00"
file="eval-buffer.el"
if [ ! -e "${toDir}/${num}_${file}" ]; then
    echo "${num}_${file} not exis, make symbolic link to ${toDir}/${num}_${file}"
    ln -s "${fromDir}/${file}" "${toDir}/${num}_${file}"
else
    echo "${num}_${file} exist"
fi

