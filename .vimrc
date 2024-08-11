set ttimeoutlen=0
syntax on
set number
colorscheme torte
"set termguicolors"
"set bg=dark

"Status bar"
set laststatus=2

"setting cursor line to highlight" "ruler to show column num
set cursorline
set ruler

"remapping ctrl u and d so that it centers each time"
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

"set tab spacing to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

"set autoindent
filetype on
filetype indent on

"highlight while searching
set incsearch

"auto complete menu after pression tab
set wildmenu
set wildmode=list:longest

"this is for polyglot
set nocompatible

let g:ale_completion_enabled = 1

"Plugins
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'

call plug#end()

"symbols
let g:airline_powerline_fonts = 1

"airline status bar adds
let g:airline_section_y = airline#section#create_right(['ffenc', 'ascii: %b', ' hex: 0x%B'])

"analysis works with airline
let g:airline#extensions#ale#enabled = 1
