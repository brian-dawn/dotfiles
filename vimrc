" Common Additions
" <Leader>              is the spacebar.
" <Leader>[motion]      motion (jkwb etc.) allows for hint jumping.
" <Leader>u             undo tree toggle.
" gc                    will comment or uncomment a visual block.
" <Ctrl>p               fuzzy file jump.
" cs[a][b]              change surround - will convert surrounding [a] to [b].

set encoding=utf-8

" used for tmux/osx copypaste.
set clipboard=unnamed

" set space to leader.
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

" filetype stuff.
filetype on
filetype plugin on
filetype indent on
syntax on

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

" neobundle.
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" passive plugins (no new key combos added).
NeoBundle 'bling/vim-airline'               " nice looking statusline.
NeoBundle 'tpope/vim-endwise'               " automatically adds endings to blocks ex: do/end in ruby.
NeoBundle 'scrooloose/syntastic'            " automatically does syntax checking when a file is saved.
NeoBundle 'flazz/vim-colorschemes'          " collection of colorschemes.
NeoBundle 'Raimondi/delimitMate'            " automatically creates closing brackets/parens/quotes.
NeoBundle 'Valloric/YouCompleteMe'          " autocomplete engine.
NeoBundle 'embear/vim-localvimrc'

NeoBundle 'ervandew/supertab'

" active plugins (add key combos).
NeoBundle 'kien/ctrlp.vim'                  " `<ctrl>p` then type filenames.
NeoBundle 'rking/ag.vim'                    " Ag search `:Ag [search]`
NeoBundle 'tomtom/tcomment_vim'             " `gc` to toggle comments for a visual block.
NeoBundle 'Lokaltog/vim-easymotion'         " `<leader>[motion] to jump to a hint.
NeoBundle 'tpope/vim-surround'
NeoBundle 'sjl/gundo.vim'

" programming language integration.
NeoBundle 'klen/python-mode'
NeoBundle 'fatih/vim-go'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'tpope/vim-fugitive'              " git cmds example: `Gblame`
NeoBundle 'tpope/vim-rails'

" Required:
call neobundle#end()

" airline configuration.
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
set laststatus=2
set noshowmode
set ttimeoutlen=50

" ruby completion stuff.
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

" syntastic configuration.
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_cucumber_checkers = ['']
hi SignColumn ctermbg=0 "Change syntastic gutter to something not horrible.

" disable the ask dialogue for local vimrc plugin.
let g:localvimrc_ask = 0


" appearance.
colorscheme solarized
set background=dark
set guifont=Powerline\ Consolas:h11

" easymotion.
hi EasyMotionTarget2First ctermbg=none ctermfg=cyan
hi EasyMotionTarget2Second ctermbg=none ctermfg=cyan

" editor ui options.
set mouse=a
set fillchars=vert:\│

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions+=LlRrb
set guioptions-=LlRrb

" custom keybindings.
imap jj <Esc>
map <Leader>u :GundoToggle<CR>

map <Leader> <Plug>(easymotion-prefix)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
