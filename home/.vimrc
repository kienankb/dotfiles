set mouse=a
syntax on
set shiftwidth=4
set tabstop=4
set expandtab
set backspace=indent,eol,start
set wrap linebreak
set laststatus=2
set noeol
set hlsearch
set wildmode=longest:full
set wildmenu
set switchbuf+=usetab,newtab
set nu rnu
set updatetime=300

filetype plugin indent on

autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'dylanaraps/wal.vim'
Plug 'tmsvg/pear-tree'
Plug 'sheerun/vim-polyglot'
Plug 'sainnhe/forest-night'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

let g:coc_global_extensions = ['coc-json', 'coc-pyright', 'coc-tsserver', 'coc-snippets']

if has('termguicolors')
  set termguicolors
endif

set background=dark
let g:everforest_background = 'hard'
colorscheme everforest

highlight Comment cterm=italic gui=italic
highlight MatchParen term=underline cterm=underline ctermbg=NONE ctermfg=NONE

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()

map <C-PageUp> :tabp<CR>
map <C-PageDown> :tabn<CR>
nnoremap <C-p> :Files!<CR>
nnoremap <C-S-f> :Ag!<CR>

"" completor: tab to cycle, enter to complete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
