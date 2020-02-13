
"""""""""""""""""""""""""""""""
""    VIM General Settings    "
"""""""""""""""""""""""""""""""

set nocompatible
set encoding=utf-8
filetype plugin on
syntax on

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Set buffer to remembers last moves
set history=500
set undolevels=500

" Load up all of plugins
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif


"""""""""""""""""""""""""""""""
""     Interface settings     "
"""""""""""""""""""""""""""""""

" Set colorscheme
colorscheme badwolf

" Show status and cursor position below window
set ruler
set laststatus=2

" Show incomplete command and enable autocomplete
set showcmd
set wildmenu

" Show numbers on the side
set number
set relativenumber
set numberwidth=5

" Redraw screen only when it needs to, it improves macro speed
set lazyredraw


"""""""""""""""""""""""""""""""
""         Behaviors          "
"""""""""""""""""""""""""""""""

" Setting mapleader to <Space>
let mapleader = " "

" Set edit behaviors
set backspace=2
set nowrap
set textwidth=82

" Tabs settings
set expandtab
set shiftround
set tabstop=4
set softtabstop=4
set shiftwidth=4
filetype indent on

" Allow better scrolling when close to margins
set sidescroll=1
set scrolloff=4
set sidescrolloff=15

" Search settings
set gdefault
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch

" Set yank copy to the global system clipboard
set clipboard=unnamed

" Auto-updates file when it is changed by other editor
set autoread

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Fold settings
set foldenable
set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10


"""""""""""""""""""""""""""""""
""      Map - Interface       "
"""""""""""""""""""""""""""""""

" Maps F2 key to show current time
nnoremap <F2> :echo 'Current time is: ' . strftime('%c')<CR>

" Use Directions to resize windows
nnoremap <silent><Left> :vertical resize -5<CR>
nnoremap <silent><Right> :vertical resize +5<CR>
nnoremap <silent><Down> :resize -5<CR>
nnoremap <silent><Up> :resize +5<CR>

" Toggle number on and off
function! NumberToggle()
    set nu!
    if &rnu
        set nornu
    endif
endfunction
nnoremap <silent><Leader>n :call NumberToggle()<CR>

" Toggle relativenumber on and off 
function! RelativeToggle()
    set nu
    set rnu!
endfunction
nnoremap <silent><Leader>rn :call RelativeToggle()<CR>

" Auto number toggle when switching windows
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &nu | set nornu | endif
augroup END


"""""""""""""""""""""""""""""""
""     Map - Navigation       "
"""""""""""""""""""""""""""""""

" Set highligthing off
nnoremap <silent><leader>, :noh<cr>

" Use tab to jump between blocks, because it's easier
nnoremap <tab> %
vnoremap <tab> %

" Folding shortcuts
nnoremap <Leader>z zA
vnoremap <Leader>z zA
autocmd BufRead * normal zR

" Navigate quicker to buffer extremes
nnoremap <Leader>l $
nnoremap <Leader>j G
nnoremap <Leader>k gg 
nnoremap <Leader>h ^

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Use enter and backspace to create line w/o leaving normal mode
nnoremap <Leader><CR> o<ESC>
nnoremap <Leader><BS> O<ESC>

" Better insertion of paragraphs
nnoremap <Leader>O O<Esc>o
nnoremap <Leader>i o<CR>

" Better space insertion
" nnoremap <Leader><Space> a<Space>

" Better selection and indentation
vnoremap < <gv
vnoremap > >gv
map <Leader>a ggVG

" Sort selection
vnoremap <Leader>s :sort<CR>

" Go to marked line
nnoremap \ `

" Go to last cursor position
nnoremap <Leader>\ <C-o>

" Redo
nnoremap U <C-r>

"""""""""""""""""""""""""""""""
""    Map - Copy and Paste    "
"""""""""""""""""""""""""""""""

" Copy paste to/from clipboard; does not work inside vm
"vnoremap <C-c> "*y
"map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
"map <leader><s-p> :set paste<cr>o<esc>"*]p:set nopaste<cr>"

" TODO: Paste in command mode 
" Use register to paste content in command line 


"""""""""""""""""""""""""""""""
""    Map - Save and Quit     "
"""""""""""""""""""""""""""""""

" Quick save command
nnoremap <Leader>w :update<CR>
vnoremap <Leader>w <C-c>:update<CR>
"inoremap <Leader>w <C-o>:update<CR>

" Quick quit command
nnoremap <Leader>q :quit<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>x :x<CR>


"""""""""""""""""""""""""""""""
""       Map - Plugins        "
"""""""""""""""""""""""""""""""

" Toggle NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" Toggle Undotree
nnoremap <F5> :UndotreeToggle<CR>

" Toggle Goyo
nnoremap <Leader>- :Goyo<CR>

" Toggle Limelight
nnoremap <Leader>+ :Limelight!!<CR>

" Invoke CtrlP
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

" Disable EasyMotion default mappings
"let g:EasyMotion_do_mapping = 0

