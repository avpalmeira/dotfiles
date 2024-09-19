﻿### dotfiles

> How to use these dotfiles on your machine?

1. clone repository into folder:
...$ `git clone https://github.com/avpalmeira/dotfiles.git`

2. create a symbolic link from the config file inside the dotfile folder
...to the actual config file in the home directory:
...$ `ln -s {path/to/dotfile} $HOME/.dotfile`

...Example:
...$ `ln -s ~/dotfiles/vim/vimrc.vim ~/.vimrc`
