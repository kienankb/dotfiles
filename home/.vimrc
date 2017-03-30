set number
set mouse=a
syntax on
set shiftwidth=4
set tabstop=4
set backspace=indent,eol,start
set laststatus=2

call plug#begin('~/.vim/plugged')
Plug 'https://github.com/chrisbra/Colorizer.git'
call plug#end()

python from powerline.vim import setup as powerline_setup
python powerline_setup()
