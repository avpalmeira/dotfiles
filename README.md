### dotfiles

> How to use these dotfiles file on your machine?

1. clone repository into folder:
...$ `git clone https://github.com/vpalmeira/dotfiles.git`

2. create symbolic link from config file inside dotfile folder
...to actual config file in home directory:
...$ `ln -s {path/to/dotfile} $HOME/.dotfile`

...Example:
...$ `ln -s ~/dotfiles/vim/vimrc.vim ~/.vimrc`
