set number
set mouse=a
syntax on
set shiftwidth=4
set tabstop=4
set backspace=indent,eol,start
set laststatus=2
set noeol

call plug#begin('~/.vim/plugged')
Plug 'https://github.com/chrisbra/Colorizer.git'
Plug 'vitalk/vim-simple-todo'
call plug#end()

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()