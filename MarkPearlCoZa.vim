" Load Pathogen
execute pathogen#infect()

" Maximize window
au GUIEnter * simalt ~x

" Hide the toolbar
set guioptions-=T
" Hide the menu bar
set guioptions-=m
" Use text mode tabs
set guioptions-=e

"set guifont=DejaVu_Sans_Mono:h11:cANSI
"set guifont=Ubuntu_Mono:h11:cANSI
set guifont=Ubuntu_Mono_derivative_Powerlin:h12:cANSI
set showtabline=2
set relativenumber

set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start
set visualbell
set encoding=utf-8
set wildmenu
set nowrap

" Turn on syntax highlighting
syntax on

" Turn on search highlighting
set hls

" Set backup (swap file) directory
set dir=~/tmp

" Solarized config
"=================
"set background=dark
"let g:solarized_contrast="high"
"colorscheme solarized

colorscheme fu

" Setup shortcut for formatting xml using xmllint
map @@x !%xmllint --format --recover -^M

" vim-airline config
"===================
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
set laststatus=2 " Always display status
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1 " Pretty tab line
