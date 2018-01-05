" Type :so % to refresh .vimrc after making changes


"""""""""""""""""""""""""""""""
""    VIM General Settings    "
"""""""""""""""""""""""""""""""

set nocompatible
set encoding=utf-8
filetype plugin indent on
syntax on

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Auto read or write file when focusing on other buffer
set autoread
set autowrite 

" Set buffer to remembers last moves
set history=500
set undolevels=500


"""""""""""""""""""""""""""""""
""     Interface settings     "
"""""""""""""""""""""""""""""""

" Show status and ruler below window
set ruler
set laststatus=2
set showcmd

" Show numbers on the side
set number
set relativenumber
set numberwidth=5


"""""""""""""""""""""""""""""""
""       Key behaviors        "
"""""""""""""""""""""""""""""""

" Setting mapleader to <Space>
let mapleader = " "

" Set edit behaviors
set backspace=2
set nowrap
set textwidth=80

" Tabs settings
set expandtab
set shiftround
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Search settings
set gdefault        " searches whole line by default 
set ignorecase      " case insensitive searching
set smartcase
set hlsearch
set incsearch
set showmatch       " highlight matching bracket

" Set yank copy to the global system clipboard
set clipboard=unnamed

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright


"""""""""""""""""""""""""""""""
""     Map - Navigation       "
"""""""""""""""""""""""""""""""

" Set highligthing off
nnoremap <leader>, :noh<cr>

" Use tab to jump between blocks, because it's easier
nnoremap <tab> %  
vnoremap <tab> %


nnoremap <Leader>h 0 " bug
nnoremap <Leader>l $
nnoremap <Leader>j G
nnoremap <Leader>k gg 

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Paste in command mode
" cnoremap <C-v> "p 

" Quicksave command
"nnoremap <C-s> :update<CR>
"vnoremap <C-s> <C-c>:update<CR>
"inoremap <C-s> <C-o>:update<CR>
"map <leader>s <C-S>


" Copy paste to/from clipboard
vnoremap <C-c> "*y
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"

" Maps F2 key to show current time
nnoremap <F2> :echo 'Current time is: ' . strftime('%c')<CR>

" Quick quit command
noremap <Leader>e :quit<CR>
" todo: move lines up and down
" move sentence up to EOL from the cursor UP or DOWN
