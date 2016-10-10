" File: .vimrc
" Author: Wai-Leong YEOW
" Description: VIM-7.3 personalization.
" Last Modified: Sep 15, 2013

" General
set nocompatible
behave xterm
set nobackup		" disable backups, i.e., files that end with `~' after overwriting

" Modelines
set modeline
set modelines=5
" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
	let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
				\ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
	let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
	call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" Colour
" set t_Co=256
" colorscheme taqua

" Search
set incsearch		" incremental search
set hlsearch		" hilight search
set showmatch		" matching brackets

" Tabs
set smarttab		" automatic indentation
set noexpandtab		" tabs will be tabs and not spaces
set tabstop=4		" size of a tabspace	}
set shiftwidth=4	" size of a tabspace	} use them together
set softtabstop=0	" nospaces				}

" Layout
set ruler			" show (x,y) position
set laststatus=2	" show the bottom `status' bar
set backspace=2		" behavior of backspace / del

" Indent
filetype plugin on
filetype indent on	" indent according to filetype

" Autocomplete
" set ofu=syntaxcomplete#Complete
autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menuone,menu,longest,preview

syntax on			" syntax highlighting
set tags=./tags,tags;

" Spell
set spell spelllang=en_us
set nospell


" Key maps

" window resize --- somehow doesn't work quite well
nmap <M-Up> <C-w>+
nmap <M-Down> <C-w>-
nmap <M-Right> <C-w>>
nmap <M-Left> <C-w><

" buffer --- switch between opened files
nmap <C-Tab> :bn<CR>
nmap <C-S-Tab> :bp<CR>
nmap <C-Q> :bd<CR>

" save --- F2
nmap <F2> :w!<CR>
imap <F2> <Esc><F2>

" compile
map <F5> <Esc>:make<CR>
map <F6> <Esc>:cp<CR>
map <F7> <Esc>:cn<CR>
map <F8> <Esc>:clist<CR>

" Trinity plugin
"nmap <C-;> :TrinityToggleTagList<CR>
"nmap <C-'> :TrinityToggleNERDTree<CR>
"nmap <C-/> :TrinityToggleSourceExplorer<CR>
nmap <F10> :TrinityToggleAll<CR>

" Auto commands

" Functions

function Wrap_Text()
	setlocal wrap
	setlocal lbr
	inoremap <buffer> <Up> <Esc>gka
	inoremap <buffer> <Down> <Esc>gja
	inoremap <buffer> <Home> <Esc>g^
	inoremap <buffer> <End> <Esc>g$
	vnoremap <buffer> <Up> gk
	vnoremap <buffer> <Down> gj
	vnoremap <buffer> <Home> g^
	vnoremap <buffer> <End> g$
endfunction

" uninstalled
" Mini Buffer Explorer (uninstalled)
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1 
" Tag List (uninstalled)
"map <C-G> :TlistToggle<CR>

