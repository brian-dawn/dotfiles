set encoding=utf-8

set clipboard=unnamed

" Set space to leader.
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

" Filetype stuff.
filetype on
filetype plugin on
filetype indent on
syntax on

" Tab stuff.
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" Disable swap files, open all the vim files!
" WARNING could be dangerous.
set noswapfile

set mouse=a

colorscheme zenburn

set guifont=Powerline\ Consolas:h11

" Set vertical bar character, note with consolas there's still a little bit of
" space.
set fillchars=vert:\│

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions+=LlRrb
set guioptions-=LlRrb

set incsearch " Search as you type.
set ignorecase " Ignore the case of a search.

" Set spellcheck options.
nmap <leader>s :set spell!<CR>
set spelllang=en_us

" highlight tabs and trailing spaces
set list listchars=tab:→\ ,trail:·

set hlsearch

" load pathogen which will autoload plugins.
" try to autoload all submodules.
runtime vim-pathogen/autoload/pathogen.vim
call pathogen#infect('../submodules/{}')

" Airline
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
set laststatus=2
set noshowmode
set ttimeoutlen=50

" Random keybindings.
imap jj <Esc>



let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
