"""""""""""""""""""""""""""""""
""      Config - Plugins      "
"""""""""""""""""""""""""""""""

""          NERDTree          "

" Sync open file with NERDTree
" Check if NERDTree is open or active
function! IsNERDTreeOpen()
    return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind if NERDTree is active, current window contains a modifiable
" file and we're not in vimdiff
function! SyncTree()
    if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
        NERDTreeFind
        wincmd p
    endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" When executing 'vim <some-dir>' it will open NERDTree
function! AutoOpenNERDTree()
    if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in")
        exe 'NERDTree' argv()[0]
        wincmd p
        ene
        exe 'cd '.argv()[0]
    endif
endfunction

" Open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * call AutoOpenNERDTree()

" Close vim if the only window left open is NERDTree
function! CloseWhenTheresOnlyNERDTree()
    if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())
        q
    endif
endfunction
autocmd BufEnter * call CloseWhenTheresOnlyNERDTree()


""             ALE            "

" Enable completion where available
let g:ale_completion_enabled = 1

" Set omni-completion function
set omnifunc=ale#completion#OmniFunc

" Config fixers and linters
let g:ale_fixers = {
\   '*': ['trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'ruby': ['standardrb'],
\}

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" Allow for ALE Hover to show balloons on mouse hover
" let g:ale_set_balloons = 1


""            CtrlP           "

" CtrlP excludes git ignored files
let g:ctrlp_user_command = [
\    '.git/',
\    'git --git-dir=%s/.git ls-files -oc --exclude-standard'
\]


let g:ctrlp_custom_ignore = {
\    'dir':  '\v[\/](\.(git|svn)|build)$',
\    'file': '\v\.(exe|dll|so|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
let g:ctrlp_working_path_mode = 'r'


""            Emmet           "

" Redifine trigger key
" let g:user_emmet_leader_key='<C-q>'


""           Snippets         "

" Trigger configuration
let g:UltiSnipsExpandTrigger="<C-l>"


""            Airline         "

" Set airline theme
let g:airline_theme='powerlineish'
" Use powerline fonts
let g:airline_powerline_fonts = 1
" Enable tabline extension
let g:airline#extensions#tabline#enabled = 1


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

" Use ALE autocompletion
inoremap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>

" Save bookmark when on NERDTree buffer
nnoremap <C-b> :Bookmark<Space>

" Disable EasyMotion default mappings
"let g:EasyMotion_do_mapping = 0



