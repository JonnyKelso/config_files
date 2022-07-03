"set runtimepath+=~/.vim,~/.vim/after
"set packpath+=~/.vim
"source ~/.vimrc

"set modelines=0
set number
set relativenumber 
set cursorline
set ruler
set visualbell
"set encoding=utf-8
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
set confirm
set scrolloff=8
set backspace=indent,eol,start
set hidden
set ttyfast
set laststatus=2
set showmode
set showcmd
set wildmenu
set title
set noswapfile
set nobackup
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set signcolumn=yes
set colorcolumn=80
"set matchpairs+=<:> " use % to jump between pairs
set listchars=tab:▸\ ,eol:¬
set splitbelow
set splitright

let mapleader = ","

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
"filetype plugin indent on

" Using vim-plug
call plug#begin('~/.vim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
"    Plug 'scrooloose/nerdtree'
"    Plug 'kien/ctrlp.vim'
"    Plug 'rking/ag.vim'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'wfxr/minimap.vim'
    Plug 'vimwiki/vimwiki'
    Plug 'mileszs/ack.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'gruvbox-community/gruvbox'
    Plug 'BurntSushi/ripgrep'
    Plug 'nvim-treesitter/nvim-treesitter'
" telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

call plug#end()

" Telescope lua config
lua << EOF
require('telescope').setup{
  defaults = {
    prompt_prefix = "$ "
  }
}
require('telescope').load_extension('fzf')
EOF


" set Airline always visible
set laststatus=2

"code-map mini-map
let g:minimap_auto_start = 1
let g:minimap_width = 20

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
"nmap <leader>g3 :diffget //3<CR>
"nmap <leader>g2 :giffget //2<CR>
"nmap <leader>gs :G<CR>

"morhetz/gruvbox
:colorscheme gruvbox
":colorscheme molokai
set background=dark
highlight Normal guibg=none

" fix common word misspellings
iabbrev teh the
iabbrev adn and
iabbrev ASset Asset
iabbrev --- -------------------------------


"runtime! macros/matchit.vim

" Move up/down editor lines
"nnoremap j gj
"nnoremap k gk
"noremap <leader>n :NERDTreeToggle<cr>
nnoremap Y y$
noremap n nzzzv
noremap N Nzzzv

inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
"vnoremap J :m '>+1<CR>gv=gv
"vnoremap K :m '<-2<CR>gv=gv
"inoremap <C-j> <esc>:m .+1<CR>==
"inoremap <C-k> <esc>:m .-2<CR>==
"nnoremap <leader>k :m .-2<CR>==
"nnoremap <leader>j :m .+1<CR>==
"
" move through loaded buffers with CTRL+j and CTRL+k
map <C-k> :bprev<CR> 
map <C-j> :bnext<CR>

" Searching
"nnoremap / /\v
"vnoremap / /\v
"map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
"inoremap <F1> <ESC>:set invfullscreen<CR>a
"nnoremap <F1> :set invfullscreen<CR>
"vnoremap <F1> :set invfullscreen<CR>
nnoremap <C-p> :Files<cr>
nnoremap ff <cmd>Telescope find_files<cr>
nnoremap fg <cmd>Telescope live_grep<cr>
nnoremap fb <cmd>Telescope buffers<cr>
nnoremap fh <cmd>Telescope help_tags<cr>
nnoremap gc <cmd>Telescope git_commits<cr>
nnoremap gb <cmd>Telescope git_branches<cr>
nnoremap gs <cmd>Telescope git_status<cr>
" Textmate holdouts

" Formatting
"map <leader>q gqip

" Visualize tabs and newlines
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
" map <leader>l :set list!<CR> " Toggle tabs and EOL
" opens search results in a window w/ links and highlight the matches
"command! -nargs=+ Grep execute 'silent grep! -I -r -n --exclude *.{json,pyc} . -e <args>' | copen | execute 'silent /<args>'
" shift-control-* Greps for the word under the cursor
":nmap <leader>g :Grep <c-r>=expand("<cword>")<cr><cr>
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

" ack.vim --- {{{
" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
"let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
"let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
"cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
"nnoremap <Leader>/ :Ack!<Space>
" }}}

" Navigate quickfix list with ease
"nnoremap <silent> [q :cprevious<CR>
"nnoremap <silent> ]q :cnext<CR>
" ------------------- end ack ----------------------
