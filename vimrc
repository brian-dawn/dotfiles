" Common Additions
" <Leader>              is the spacebar.
" <Leader>[motion]      motion (jkwb etc.) allows for hint jumping.
" <Leader>u             undo tree toggle.
" gc                    will comment or uncomment a visual block.
" ga                    autotab on =.
" <Ctrl>p               fuzzy file jump.
" cs[a][b]              change surround - will convert surrounding [a] to [b].

set shell=bash
set encoding=utf-8
set number

" set space to leader.
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

" tab stuff.
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

set backspace=indent,eol,start

set noswapfile  " disable swap files.

set incsearch   " search as you type.
set ignorecase  " ignore the case of a search.

set spelllang=en_us

" highlight tabs and trailing spaces
set list listchars=tab:→\ ,trail:·

set hlsearch

" vim plug - dependencies.
call plug#begin('~/.vim/plugged')

" passive plugins (no new key combos added).
Plug 'bling/vim-airline'               " nice looking statusline.
Plug 'flazz/vim-colorschemes'          " collection of colorschemes.
Plug 'altercation/vim-colors-solarized'
Plug 'embear/vim-localvimrc'           " Support localvimrc files for specifying project specific indent options.
Plug 'ervandew/supertab'
Plug 'chriskempson/base16-vim'
Plug 'scrooloose/syntastic'
Plug 'chriskempson/base16-vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --racer-completer', 'for': ['c', 'cpp', 'objc', 'objcpp', 'cs', 'python', 'rust'] }


" active plugins (add key combos).
Plug 'kien/ctrlp.vim'                  " `<ctrl>p` then type filenames.
Plug 'rking/ag.vim'                    " Ag search `:Ag [search]`
Plug 'tomtom/tcomment_vim'             " `gc` to toggle comments for a visual block.
Plug 'Lokaltog/vim-easymotion'         " `<leader>[motion] to jump to a hint.
Plug 'tpope/vim-surround'
Plug 'sjl/gundo.vim'                   " undo trees.
Plug 'xolox/vim-misc'
Plug 'godlygeek/tabular'               " tabular text alignment.
Plug 'terryma/vim-multiple-cursors'    " sublime like cursors, ctrl+n

" programming language integration.
Plug 'tpope/vim-fugitive'              " git cmds example: `Gblame`
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'cespare/vim-toml'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'keith/swift.vim'
Plug 'pangloss/vim-javascript'


call plug#end()

" airline configuration.
let g:airline_left_sep = ''
let g:airline_right_sep = ''
set laststatus=2
set noshowmode
set ttimeoutlen=50

" appearance.
set t_Co=256
" Needed for tmux to not screw up colors.
set t_ut=
"colorscheme solarized
colorscheme Tomorrow-Night
set background=dark
set guifont=Powerline\ Consolas:h11

" easymotion.
hi EasyMotionTarget2First ctermbg=none ctermfg=cyan
hi EasyMotionTarget2Second ctermbg=none ctermfg=cyan

" easy-tags.
set tags=./tags;   " Search for tags upwards from the current file's directory.
let g:easytags_dynamic_files = 1    " Also look for project-specific tags files.

" editor ui options.
set mouse=a
set fillchars=vert:\│

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions+=LlRrb
set guioptions-=LlRrb

" Rust
set hidden
let g:racer_cmd = "$HOME/.cargo/bin/racer"
let $RUST_SRC_PATH="$HOME/repos/rust/src/"

" custom keybindings.
"imap jj <Esc>
map <Leader>u :GundoToggle<CR>

" easymotion leader + movement key
map <Leader> <Plug>(easymotion-prefix)
" Easymotion search integration. Disabled for now.
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)

" todo the following doesn't work.
nmap <C-e> $
imap <C-e> <C-O>A
map <C-a> <Home>
imap <C-a> <Home>

" Tabularize configuration (auto format on equal sign.
nmap ga :Tabularize /=<CR>
vmap ga :Tabularize /=<CR>

" Filetype specifics
autocmd Filetype ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" used for tmux/osx copypaste.
set clipboard=unnamed

" bug where vim . causes clipboard to break, this fixes it.
map <LEADER>c :set clipboard=unnamed<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" filetype stuff.
filetype on
filetype plugin on
filetype indent on
syntax on
