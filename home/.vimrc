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

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'bubblegum'

filetype plugin indent on

autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chrisbra/Colorizer'
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

let g:coc_global_extensions = ['coc-json', 'coc-pyright', 'coc-tsserver', 'coc-rls', 'coc-snippets']

if has('termguicolors')
  set termguicolors
endif

colorscheme nord

highlight Comment cterm=italic gui=italic
highlight MatchParen term=underline cterm=underline ctermbg=NONE ctermfg=NONE
highlight Normal ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE

map <C-PageUp> :tabp<CR>
map <C-PageDown> :tabn<CR>
nnoremap <C-p> :Files!<CR>
nnoremap <C-S-f> :Ag!<CR>

"" completor: tab to cycle, enter to complete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
