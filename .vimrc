" **Basic settings** {{{
let mapleader = " "
let maplocalleader = "\\"
set number
set relativenumber
set shiftround
set wrap
" }}}

" **Status line** {{{
set laststatus=2
set statusline=%f
set statusline+=%= 
set statusline+=FileType:\ %y
" }}}

" **avoid tab in my code, and set the width of indentation to 2 spaces** {{{
set shiftwidth=2
inoremap <Tab> <space><space>
set softtabstop=2 expandtab
" }}}

" **Custom motions** {{{
" move lines downward and upward
nnoremap - :m +1<CR>
nnoremap + :m -2<CR>

" uppercase the inserted word
inoremap <c-u> <esc>bviwUea

" source vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

" edit vimrc
nnoremap <leader>ev :tabedit $MYVIMRC<CR>

" write and quit
nnoremap <leader>wq :wq<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>
nnoremap <leader>w :w<cr>

" surround by quotes
nnoremap <leader>" bi"<esc>ea"<esc>
nnoremap <leader>' bi'<esc>ea'<esc>
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>`<v`>
vnoremap <leader>' <esc>`<i'<esc>`>a'<esc>`<v`>

" }}}

" **Abbreviations** {{{
iabbrev ssig -- <cr>Caio Melloni<cr>caiomelloni.contato@gmail.com<cr>
cabbrev ec echo
" }}}

" **Disables bad habbits** {{{
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
cabbrev w USE NORMAL MODE SHORTCUT TO SAVE
cabbrev wq USE NORMAL MODE SHORTCUT TO SAVE AND EXIT
cabbrev q USE NORMAL MODE SHORTCUT TO EXIT
" }}}

" **Autocmds** {{{
augroup comments
  autocmd!
  autocmd FileType python :nnoremap <buffer> <localleader>c v<esc>I#<esc>`>
  autocmd FileType c :nnoremap <buffer> <localleader>c v<esc>I//<esc>`>
augroup END

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" **Operator pendings** {{{
onoremap n( :<c-u>normal! f(vi(<cr>
onoremap n) :<c-u>normal! f)vi)<cr>
onoremap p( :<c-u>normal! F(vi(<cr>
onoremap p) :<c-u>normal! F)vi)<cr>
onoremap n( :<c-u>normal! f(vi(<cr>
" }}}

" for filetype detection. I have no ideia how it works
filetype off
filetype plugin indent on
" ====================================================


