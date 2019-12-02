set number
set mouse=a
syntax on
set shiftwidth=4
set tabstop=4
set backspace=indent,eol,start
set laststatus=2
set noeol
set hlsearch
set wildmode=longest:full
set wildmenu
set switchbuf+=usetab,newtab

highlight Comment cterm=italic gui=italic
highlight MatchParam cterm=underline ctermbg=NONE ctermfg=NONE

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'chrisbra/Colorizer'
Plug 'vitalk/vim-simple-todo'
Plug 'junegunn/goyo.vim'
Plug 'flazz/vim-colorschemes'
Plug 'maralla/completor.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
call plug#end()

colorscheme spacegray

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()

map <C-PageUp> :tabp<CR>
map <C-PageDown> :tabn<CR>
nnoremap <C-p> :FZF<CR>
