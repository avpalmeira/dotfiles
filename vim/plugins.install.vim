"" Vim puglins configuration file

" Auto-install vim-plug and place it on ~/.vim/autoload
" PS: make sure curl is installed
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Declare plugins
call plug#begin('~/.vim/plugged')

" Distraction free plugins
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Color schemes
Plug 'sjl/badwolf'
Plug 'nightsense/stellarized'
Plug 'junegunn/seoul256.vim'
Plug 'dylanaraps/crayon'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', {'as': 'dracula'}

" Better navigation in vim
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'christoomey/vim-tmux-navigator'

" Better editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'dense-analysis/ale'
Plug 'mattn/emmet-vim'

" Snippets
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" Handle sessions
Plug 'tpope/vim-obsession'

" Git helpers
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Analytics
Plug 'wakatime/vim-wakatime'

call plug#end()
