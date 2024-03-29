
"""""""""""""""""""""""""""""""
""    VIM General Settings    "
"""""""""""""""""""""""""""""""

set nocompatible
set encoding=utf-8
filetype plugin on

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Set buffer to remembers last moves
set history=500
set undolevels=500

" Enable mouse support
set mouse=a

"""""""""""""""""""""""""""""""
""     Interface settings     "
"""""""""""""""""""""""""""""""

" Set colorscheme
syntax on

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

" Set hidden chars
set listchars=tab:»-,eol:¬,space:·,trail:~,extends:⟩,precedes:⟨

" Add jbuilder syntax highlighting
au BufNewFile,BufRead *.json.jbuilder set ft=ruby


"""""""""""""""""""""""""""""""
""         Behaviors          "
"""""""""""""""""""""""""""""""

" Setting mapleader to <Space>
let mapleader = " "

" Set edit behaviors
set backspace=2
set wrap
set linebreak
set textwidth=0
set wrapmargin=0

" Tabs settings
set expandtab
set shiftround
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
filetype indent on

" Allow better scrolling when close to margins
set scrolloff=4
" set sidescroll=1
" set sidescrolloff=15

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

" Ignore files/directories from fuzzy finder and autocomplete
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/cache/*,*/vendor/*

" Use before pasting from clipboard to preserve indentation
set pastetoggle=<F3>

" Set buffer switching behavior
set switchbuf=usetab,newtab


"""""""""""""""""""""""""""""""
""        Autocommands        "
"""""""""""""""""""""""""""""""

" Auto number toggle when switching windows
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &nu | set nornu | endif
augroup END

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Update dir to current file
autocmd BufEnter * silent! cd %:p:h


"""""""""""""""""""""""""""""""
""      Map - Interface       "
"""""""""""""""""""""""""""""""

" Map key to show current time
nnoremap T :echo 'Current time is: ' . strftime('%c')<CR>

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

" Toggle view of hidden chars
function! ToggleHiddenChars()
    set list!
endfunction
nnoremap <F6> :call ToggleHiddenChars()<CR>


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
" autocmd BufRead * normal zR

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

" Go to marked line
nnoremap \ `

" Go to last cursor position
"nnoremap <Leader>\ <C-o>

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')


"""""""""""""""""""""""""""""""
""        Map - Editing       "
"""""""""""""""""""""""""""""""

" Delete to beginning of the line
nnoremap <BS> d0
nnoremap <Leader><BS> cc<ESC>

" Delete line break
nnoremap <Del> k$J

" Use enter and backspace to create line w/o leaving normal mode
nnoremap <Leader>o o<ESC>
nnoremap <Leader>O O<ESC>

" Better insertion of paragraphs
nnoremap <Leader><CR> O<Esc>o
nnoremap <Leader>i o<CR>

" Better space insertion
"nnoremap <Leader><Space> a<Space>

" Better selection and indentation
vnoremap < <gv
vnoremap > >gv
map <Leader>a ggVG

" Sort selection
vnoremap <Leader>s :sort<CR>

" Source current file
nnoremap <Leader>S :source %<CR>

" Redo
nnoremap U <C-r>


"""""""""""""""""""""""""""""""
""    Map - Copy and Paste    "
"""""""""""""""""""""""""""""""

" Swap word on top of cursor to the one in default register
nnoremap <Leader>P viwp

" Copy word to default register
nnoremap <Leader>Y yiw

" Substitute word on top of cursor / selection
" by the one in alternative (a) register
nnoremap <Leader>p viw"ap
vnoremap <Leader>p "ap

" Copy word / selection to alternative (a) register
nnoremap <Leader>y "ayiw
vnoremap <leader>y "ay

" Save from vim to clipboard
vmap <Leader>xy :!xclip -f -sel clip<CR>
map <Leader>xp mz:-1r !xclip -o -sel clip<CR>`z


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
""    Map - Tabs & Buffers    "
"""""""""""""""""""""""""""""""

" To open a new empty buffer/tab
nmap -b :enew<CR>
nmap ,t :tabnew<CR>

" To open file in a new buffer/tab
nmap -e :e<Space>
nmap ,e :tabnew<Space>

" Move to the next buffer/tab
nmap -m :bnext<CR>
nmap ,m :tabnext<CR>

" Go to first/last tab
nmap ,f :tabfirst<CR>
nmap ,l :tablast<CR>

" Move to the previous buffer/tab
nmap -n :bp<CR>
nmap ,n :tabp<CR>

" Close the current buffer and go to previous
nmap -q :bp <BAR> bd #<CR>

" Close current/all tab(s)
nmap ,q :tabc<CR>
nmap ,Q :tabdo q<CR>

" Show all open buffers and their status
nmap -l :ls<CR>

" Edit all buffers as tabs
nmap -a :tab ba<CR>


"""""""""""""""""""""""""""""""
""    Load external config    "
"""""""""""""""""""""""""""""""

" Load up all plugins
if filereadable(expand("~/.vim/plugins.install"))
    source ~/.vim/plugins.install
endif

" Config all plugins
if filereadable(expand("~/.vim/plugins.config"))
    source ~/.vim/plugins.config
endif

" Load local config
if filereadable(expand("~/.local/vimrc.local"))
    source ~/.local/vimrc.local
endif


"""""""""""""""""""""""""""""""
""           Macros           "
"""""""""""""""""""""""""""""""

"" ...

