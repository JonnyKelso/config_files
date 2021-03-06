" Don't try to be vi compatible
set nocompatible
" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)
"Plugin 'editorconfig/editorconfig-vim'

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Using vim-plug
call plug#begin('~/.vim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'scrooloose/nerdtree'
    Plug 'kien/ctrlp.vim'
    Plug 'rking/ag.vim'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'wfxr/minimap.vim'
call plug#end()
" set Airline always visible
set laststatus=2

"code-map mini-map
let g:minimap_auto_start = 1
let g:minimap_width = 20

" cscope
" Don't print out when a scope db is added
"set nocscopeverbose
"set nocsverb
"source ~/.vim/plugin/cscope_maps.vim
"cs add cscope.out
"set cscopetag cscopeverbose
iabbrev teh the

let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number
set relativenumber 
"set cursorline

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set nowrap
set linebreak
set nolist
set textwidth=200
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab
set noshiftround
set smarttab

" saving files
set confirm

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk
noremap <leader>n :NERDTreeToggle<cr>

" move through loaded buffers with CTRL+j and CTRL+k
map <C-k> :bprev<CR>
map <C-j> :bnext<CR>

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd
set wildmenu
set title
set noswapfile
set nobackup

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
" colorscheme solarized

" add *.mql files to be syntax highlighted as *.c files
au BufNewFile,BufRead *.mq4 set filetype=c
