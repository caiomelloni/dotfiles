let mapleader =" "
let maplocalleader ="\\"

syntax on

set cursorline
set number
set relativenumber
set number
set numberwidth=4
set scrolloff=0

" USEFUL MAPPINGS
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>hl :set hlsearch!<cr>
nnoremap <leader>O O<esc>
nnoremap <leader>o o<esc>


" STATUS LINE
set laststatus=2
set statusline=%f " local file path
set statusline+=%=%y " filetype


syntax enable
set background=dark

" AUTOCOMMANDS
