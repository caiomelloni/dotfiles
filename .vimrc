let mapleader =" "
let maplocalleader ="\\"

syntax on

set cursorline
set number
set relativenumber
set number
set numberwidth=4
set scrolloff=0
set incsearch

" USEFUL MAPPINGS
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>hl :set hlsearch!<cr>
nnoremap <leader>O O<esc>
nnoremap <leader>o o<esc>
nnoremap <leader>cc :call ToogleCenterCursor()<cr>

" COMMANDS
command! SyncDotFiles :call UpdateDotfiles()


" STATUS LINE
set laststatus=2
set statusline=%f " local file path
set statusline+=%=%y " filetype


syntax enable
set background=dark

" AUTOCOMMANDS

" AUX FUNCTIONS
function RemoveNullCharacters(string)
	return join(split(a:string, "\x0"))
endfunction

" FUNCTIONS
function ToogleCenterCursor()
	if &scrolloff == 0
		let &scrolloff = 9999
		echo "cursor centralized"
	else
		let &scrolloff = 0
		echo "cursor decentralized"
	endif
endfunction

function UpdateDotfiles()
	let vimrcPath = "~/" . system("readlink " . $MYVIMRC)
	let repoPath = substitute(vimrcPath, "/.vimrc", "", "")
	let cdToRepo = "silent !cd " . repoPath
	let gitAddRepo = "git add " . vimrcPath
	let gitCommitRepo = "git commit -m \"dotfiles automatically updated by vimscript\""
	let gitPushRepo = "git push origin main"
	let gitCommands = [gitAddRepo, gitCommitRepo, gitPushRepo]
	for command in gitCommands
		execute RemoveNullCharacters(cdToRepo . '&& ' . command)
	endfor
	echo "DotFiles synced"
endfunction 


