set nocompatible
filetype off

call plug#begin()
Plug 'tpope/vim-obsession'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()

set backspace=indent,eol,start
set autoindent
set laststatus=2
set showmode
set showcmd
set ruler
set nu
set incsearch

set fileencodings=utf-8,latin2
