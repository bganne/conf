set background=light
set showmode
set showcmd
set ruler
set incsearch
set nohlsearch
set modeline
set cursorline
set showmatch
set undofile

let mapleader = ","

runtime ftplugin/man.vim

filetype plugin indent on
:syntax enable
set cindent shiftwidth=4
"set foldmethod=indent
"set foldlevel=4
set noexpandtab
set ts=4
let c_space_errors=1
au BufNewFile,BufRead *.t2t set ft=txt2tags
au BufNewFile,BufRead *.cl set ft=c
au BufNewFile,BufRead *.hcl set ft=c
"au BufNewFile,BufRead */odp/* :call Linuxsty()
"au BufNewFile,BufRead */linux*/* :call Linuxsty()
let VCSCommandGitDiffOpt="-w"
set diffexpr=MyDiff()
function MyDiff()
	silent execute "!diff -a --binary -w " . v:fname_in . " " . v:fname_new ." > " . v:fname_out
endfunction

function! VPPsty()
	" Formatting (GNU 80 columns)
	setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
	setlocal shiftwidth=2
	setlocal tabstop=8
	setlocal textwidth=80
	" Highlight style errors
	highlight default link VPPError ErrorMsg
	syn match VPPError / \+\ze\t/     " spaces before tab
	syn match VPPError /\%>80v[^()\{\}\[\]<>]\+/ " virtual column 81 and more
	" Highlight trailing whitespace, unless we're in insert mode and the
	" cursor's placed right after the whitespace. This prevents us from having
	" to put up with whitespace being highlighted in the middle of typing
	" something
	autocmd InsertEnter * match VPPError /\s\+\%#\@<!$/
	autocmd InsertLeave * match VPPError /\s\+$/
endfunction 
au BufNewFile,BufRead */vpp/* :call VPPsty()

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

highlight! link DiffText Todo

"set path=.,./**,,**,/usr/include,/usr/local/include,/usr/include/**,/usr/local/include/**
set tags=./tags;~,./TAGS;~,tags;~,TAGS;~

map <F3> :cp<CR>
map <F4> :cn<CR>
map <F5> :prev<CR>
map <F6> :next<CR>
map <F7> <C-t>
map <F8> g<C-]>
map <F9> :YcmDiags<CR>
