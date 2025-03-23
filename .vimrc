" **Basic settings** {{{
let mapleader = " "
let maplocalleader = "\\"
set number
set relativenumber
set shiftround
set wrap
" }}}

if $VIM_PATH != ""
        let $PATH = $VIM_PATH
endif

" **Dowload Plug if it's not installed and dowload the pluggins** {{{
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}
" **Plugins** {{{
filetype plugin on
call plug#begin()
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'github/copilot.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'
call plug#end()
colorscheme dracula
" }}}

if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls']},
        \ 'allowlist': ['go'],
        \ })
endif


" **Auto complete** {{{
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

" allow modifying the completeopt variable, or it will
" be overridden all the time
let g:asyncomplete_auto_completeopt = 0

set completeopt=menuone,noinsert,noselect,preview

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" }}}

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> <localleader>gd <plug>(lsp-definition)
    nmap <buffer> <localleader>gs <plug>(lsp-document-symbol-search)
    nmap <buffer> <localleader>gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> <localleader>gr <plug>(lsp-references)
    nmap <buffer> <localleader>gi <plug>(lsp-implementation)
    nmap <buffer> <localleader>gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> <localleader>[g <plug>(lsp-previous-diagnostic)
    nmap <buffer> <localleader>]g <plug>(lsp-next-diagnostic)
    nmap <buffer> <localleader>K <plug>(lsp-hover)
    nnoremap <buffer> <localleader><expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <localleader><expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


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
