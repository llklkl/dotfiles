syntax on
set showmode
set showcmd
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set autoindent
" 禁止响铃和闪烁
set noeb
set vb t_vb=

set number
set relativenumber
set scrolloff=5
set incsearch
set ignorecase

" 调整光标样式
if &term =~ "xterm"
    let &t_SI.="\e[5 q" "SI = INSERT mode
    let &t_SR.="\e[4 q" "SR = REPLACE mode
    let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
endif

let mapleader=" "

inoremap jk <Esc>

nnoremap L $
nnoremap H ^
vnoremap L $
vnoremap H ^

nnoremap <leader>j 5jzz
nnoremap <leader>k 5kzz