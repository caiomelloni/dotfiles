let mapleader =" "

syntax on

set cursorline
set number
set relativenumber
set number
set numberwidth=4
set scrolloff=0

noremap <leader>ev :tabedit $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>

syntax enable
set background=dark
colorscheme solarized

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
"
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"
" " add all your plugins here (note older versions of Vundle
" " used Bundle instead of Plugin)
"
" " ...
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

