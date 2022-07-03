" Don't try to be vi compatible
set nocompatible
" Helps force plugins to load correctly when it is turned back on below
filetype off


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
"    Plug 'wfxr/minimap.vim'
    Plug 'vimwiki/vimwiki'
    Plug 'mileszs/ack.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'gruvbox-community/gruvbox'
call plug#end()

" set Airline always visible
set laststatus=2

"code-map mini-map
"let g:minimap_auto_start = 0
"let g:minimap_width = 20

"vimwiki
let g:vimwiki_list = [{'path':'~/Documents/GoogleDrive/notes/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown','.markdown': 'markdown', '.mdown': 'markdown'}
"let g:vimwiki_markdown_link_ext = 1
"let g:markdown_folding = 1

" cscope
" Don't print out when a scope db is added
"set nocscopeverbose
"set nocsverb
"source ~/.vim/plugin/cscope_maps.vim
"cs add cscope.out
"set cscopetag cscopeverbose

"vim-fugitive
nmap <leader>g3 :diffget //3<CR>
nmap <leader>g2 :giffget //2<CR>
nmap <leader>gs :G<CR>

"morhetz/gruvbox
colorscheme gruvbox
set background=dark
highlight Normal guibg=none

" fix common word misspellings
iabbrev teh the
iabbrev adn and
iabbrev ASset Asset
iabbrev --- -------------------------------

let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number
set relativenumber 
set cursorline

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
set softtabstop=4
set expandtab
set noshiftround
set smarttab

" saving files
set confirm

" Cursor motion
set scrolloff=8
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
set signcolumn=yes
set colorcolumn=80
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
" opens search results in a window w/ links and highlight the matches
command! -nargs=+ Grep execute 'silent grep! -I -r -n --exclude *.{json,pyc} . -e <args>' | copen | execute 'silent /<args>'
" shift-control-* Greps for the word under the cursor
:nmap <leader>g :Grep <c-r>=expand("<cword>")<cr><cr>
" Color scheme (terminal)
"set t_Co=256
"set background=dark
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
" colorscheme solarized

" add *.mql files to be syntax highlighted as *.c files
"au BufNewFile,BufRead *.mq4 set filetype=c

" set direction of new buffer splits to right and below instead of default above and left
set splitbelow
set splitright

" ack.vim --- {{{
" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>
" }}}

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
" ------------------- end ack ----------------------
