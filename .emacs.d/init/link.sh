#!/bin/bash
# 作成した${filename}.elの中でinit-loadしたいものを
# ${num}_${filename}.elの形式で記述する.
# ただし, numは00から99までの数字であること.

# 文字列の参考
# http://d.hatena.ne.jp/y-kawaz/20100720/1279607344
# ifの参考
# http://shellscript.sunone.me/if_and_test.html

#######################################################################
#
# ユーザー入力
#

# init-loadにリンクを貼ったときの名前(${num}_${filename}.el)
linkedFiles=("00-eval-buffer.el" "00-basic.el" "00-fix.el" "01-custom.el" "01-appearance.el" "02-undo-tree.el")
linkedFiles+=("99-finish.el")
#######################################################################

# リンク先のディレクトリ
linkedDir="./../init-loader"

function check ()
{
local str=$1
shift
local strs=($@)

local ret=1

for i in ${strs[@]}
do
    if [ "${str}" = "${i}" ]
    then
	ret=$[$[ret]*0]
    fi
done

echo ${ret}
}

# linkedfilesに記述されているファイル名をチェックする.
for file in "${linkedFiles[@]}"
do
    # シェルスクリプト内で実行したコマンドが正常終了したかを判定(結果は$?を見る)
    # [0-9][0-9]で始まり、.elで終わる
    echo "$file" | grep -sq -e '^[0-9][0-9][-].*.el$'; result=$?
    if [ $result != 0 ]; then
	# grepは異常終了
	echo "${file}を修正してください."
	exit $?
    fi
done
# linkedFilesは規定の形式であることが確認された.

# linkedfilesに記述されているファイル名が存在するかチェックする.
currentDirFiles=(`ls .`)
for file in "${linkedFiles[@]}"
do
    # 無視するファイル
    test $file == "link.sh" && continue
    result=(`check ${file#[0-9][0-9][-]} ${currentDirFiles[@]}`)
    if [ $result != 0 ]; then
	echo "${file#[0-9][0-9][-]}は存在しません.修正してください."
	exit $?
    fi
done
# linkedFilesは存在するファイルであることが確認された.

# ${num}_${filename}.elの.elを取り除いた文字列の集合をrootFilesとする.
rootFiles=("${linkedFiles[@]%.el}")

# # 置換前と後の表示
# for i in "${linkedFiles[@]}"
# do
# echo "${i}"
# done
# for i in "${rootFiles[@]}"
# do
# echo "${i}"
# done

# リンク先のファイル名を取得
files=(`ls ./../init-loader`)

# リンク先のファイル名をチェックして処理(削除またはリンク解除)を行う.
for file in "${files[@]}"
do
    echo "$file" | grep -sq -e '.*.el$'; result1=$?
    echo "$file" | grep -sq -e '.*.elc$'; result2=$?
    # result1 = 0 -> .elで終わる
    # result2 = 0 -> .elcで終わる
    path="${linkedDir}/${file}"
    # echo "${path}"    
    if [ $result1 -eq 0 ]
    then
	# pathがリンクでなければ削除する.削除されなかった場合は,linkedFilesの中にfileと一致するものがあるか確認する.一つも一致していなかった場合はpathをunlinkする.
        [ -L path ]; result1_1=$?
	if [ $result1 -eq 0 ]
	then
	    # リンクである
	    result1_2=(`check ${file} ${linkedFiles[@]}`)
	    if [ $result1_2 -eq 0 ]
	    then
		# result1_2=0 -> 一致文字列が存在する
		# 処理をしない
		:
	    else
		# result1_2=1 -> 一致文字列が存在しない
		unlink ${path}
	    fi
	else
	    # リンクでない
	    rm ${path}
	fi	
    elif [ $result2 -eq 0 ]
    then
	# rootFilesの中に拡張子を抜いたfileと一致するものがあるか確認する.一致しなかった場合はpathを削除する.
	result2_1=(`check ${file%.elc} ${rootFiles[@]}`)
	if [ $result2_1 -eq 0 ]
	then
	    # result2_1=0 -> 一致文字列が存在する
	    # 処理をしない
	    :
	else
	    # result2_1=1 -> 一致文字列が存在しない    
	    rm ${path}
	fi
    fi
done

fromDir="${HOME}/dotfiles/.emacs.d/init"
toDir="${HOME}/dotfiles/.emacs.d/init-loader"

for file in "${linkedFiles[@]}"
do
    if [ ! -e "${toDir}/${file}" ]
    then
	echo "${file} not exis, make symbolic link to ${toDir}/${file}"
	ln -s "${fromDir}/${file#[0-9][0-9][-]}" "${toDir}/${file}"
    else
	echo "${file} exist"
    fi
done
