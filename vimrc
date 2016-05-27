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
au BufNewFile,BufRead */odp/* :call Linuxsty()
au BufNewFile,BufRead */linux*/* :call Linuxsty()
let VCSCommandGitDiffOpt="-w"
set diffexpr=MyDiff()
function MyDiff()
	silent execute "!diff -a --binary -w " . v:fname_in . " " . v:fname_new ." > " . v:fname_out
endfunction

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
