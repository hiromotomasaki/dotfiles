#!/bin/bash

files=.*

for file in ${files}
do
    filepath="${PWD}/${file}"
    homefile="${HOME}/${file}"

    # . と .. .git .gitignoreは抜かす
    test $file == ".git" && continue
    test $file == ".gitignore" && continue
    test $file == "." && continue
    test $file == ".." && continue

    # .hogehogeが存在しなければ、シンボリックリンクを作成
    if [ ! -e "${homefile}" ]; then
	echo "${file} not exis, make symbolic link to ${homefile}"
	ln -s "${filepath}" "${homefile}"
    else
	echo "${file} exist"
    fi
done
