set number
set mouse=a
syntax on
set shiftwidth=4
set tabstop=4
set backspace=indent,eol,start
set laststatus=2
set noeol

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'chrisbra/Colorizer'
Plug 'vitalk/vim-simple-todo'
call plug#end()

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
