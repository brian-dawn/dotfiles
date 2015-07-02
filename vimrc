" Common Additions
" <Leader>              is the spacebar.
" <Leader>[motion]      motion (jkwb etc.) allows for hint jumping.
" <Leader>u             undo tree toggle.
" gc                    will comment or uncomment a visual block.
" <Ctrl>p               fuzzy file jump.
" cs[a][b]              change surround - will convert surrounding [a] to [b].

set encoding=utf-8
set number

" treat pixie files as if they were clojure.
au BufRead,BufNewFile *.pxi setfiletype clojure

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
NeoBundle 'flazz/vim-colorschemes'          " collection of colorschemes.
NeoBundle 'embear/vim-localvimrc'           " Support localvimrc files for specifying project specific indent options.
NeoBundle 'ervandew/supertab'
NeoBundle 'chriskempson/base16-vim'

" active plugins (add key combos).
NeoBundle 'kien/ctrlp.vim'                  " `<ctrl>p` then type filenames.
NeoBundle 'rking/ag.vim'                    " Ag search `:Ag [search]`
NeoBundle 'tomtom/tcomment_vim'             " `gc` to toggle comments for a visual block.
NeoBundle 'Lokaltog/vim-easymotion'         " `<leader>[motion] to jump to a hint.
NeoBundle 'tpope/vim-surround'
NeoBundle 'sjl/gundo.vim'                   " undo trees.
NeoBundle 'guns/vim-sexp.git'
NeoBundle 'tpope/vim-sexp-mappings-for-regular-people.git'
NeoBundle 'xolox/vim-misc'
NeoBundle 'benmills/vimux'                  " tmux integration with vim.
NeoBundle 'godlygeek/tabular'               " tabular text alignment.
NeoBundle 'szw/vim-ctrlspace'               " Buffer management
NeoBundle 'terryma/vim-multiple-cursors'    " sublime like cursors, ctrl+n

" programming language integration.
NeoBundle 'fatih/vim-go'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'tpope/vim-fugitive'              " git cmds example: `Gblame`
NeoBundle 'tpope/vim-rails'
" NeoBundle 'tpope/vim-fireplace'
" NeoBundle 'tpope/vim-classpath'
NeoBundle 'amdt/vim-niji'                   " rainbow parens
NeoBundle 'wting/rust.vim'
NeoBundle 'cespare/vim-toml'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'eagletmt/ghcmod-vim'             " Haskell
NeoBundle 'eagletmt/neco-ghc'               " More haskell.
NeoBundle 'hylang/vim-hy'

NeoBundle 'venantius/vim-cljfmt'

NeoBundle 'jaxbot/semantic-highlight.vim'
NeoBundle 'suan/vim-instant-markdown'


" Required:
call neobundle#end()

" autohighlight under cursor.
"autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" airline configuration.
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
set laststatus=2
set noshowmode
set ttimeoutlen=50

" We need this line so it plays nice with ctrlspace.
let g:airline_exclude_preview = 1

" ruby completion stuff.
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

" disable the ask dialogue for local vimrc plugin.
let g:localvimrc_ask = 0

" appearance.
set t_Co=256
" Needed for tmux to not screw up colors.
set t_ut=
"colorscheme solarized
colorscheme Tomorrow-Night
set background=dark
set guifont=Powerline\ Consolas:h11

" syntastic configuration.
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_cucumber_checkers = ['']
hi SignColumn ctermbg=0

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

" vimscript functions.
function! Strip(input_string)
    return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

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

" Vimux configuration.
function! VimuxSlime()
    call VimuxSendText(@v)
    call VimuxSendKeys("Enter")
endfunction
map <LEADER>v :mark '<CR>vipy:VimuxPromptCommand<CR><C-r>"<CR>:normal ''<CR>
map <LEADER>g ggvGY:VimuxPromptCommand<CR><C-r>"<CR>
map rp :VimuxPromptCommand<CR>
map <LEADER>p :VimuxPromptCommand<CR><C-r>"<CR>

" imap <C-a> <Home>
" imap <C-e> <Esc>

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

let g:niji_dark_colours = [['196', 'red1'],
                         \ ['214', 'orange1'],
                         \ ['226', 'yellow1'],
                         \ ['154', 'greenyellow'],
                         \ ['192', 'green1'],
                         \ ['48',  'springgreen1'],
                         \ ['195', 'cyan1'],
                         \ ['105', 'slateblue1'],
                         \ ['201', 'magenta1'],
                         \ ['141', 'purple1']]
