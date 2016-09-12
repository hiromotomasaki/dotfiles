 #!/bin/bash

  DOT_FILES=(.bashrc .profile .tmux.conf)

 for file in ${DOT_FILES[@]}
 do
     ln -s $HOME/dotfiles/$file $HOME/$file
 done