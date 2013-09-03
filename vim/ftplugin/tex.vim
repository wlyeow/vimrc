" File: tex.vim
" Author: Wai-Leong YEOW
" Description: personalized vim config for LaTeX files (OS X)
" Last Modified: December 20, 2010

" Functions
function TeX_Target_Toggle()
	if b:tex_target == 'ps'
		let b:tex_target = 'pdf'
		setlocal makeprg=latexmk\ -pdf
	else
		let b:tex_target = 'ps'
		setlocal makeprg=latexmk\ -pdfps
	endif
	echo b:tex_target
endfunction

let g:tex_flavor='latex' " vimlatex?

let b:tex_target='pdf'
call TeX_Target_Toggle()
call Wrap_Text()

setlocal errorformat=%f:%l:\ %m

map <F3> :sil !open -a /Applications/Skim.app %<.pdf
map <F4> :sil !latexmk -C
map <S-F5> :call TeX_Target_Toggle()
