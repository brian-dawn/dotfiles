" NOTE to update all the git submodules first run
" git submodule init
" git submodule update

" A note to self:
" Need A.vim, supertab, haskell mode, and some sort of module that shows
" autocompletion window automatically. Also it appears macvim has a feature to
" autowrap lines?
" A.vim - Switch between source and header files.
" :A switches
" :AV switches opens other in verticle pane.

" Spelling
" \s to toggle spellcheck on or off.
"

let g:neocomplcache_enable_at_startup = 1


filetype on
filetype plugin on
filetype indent on
syntax on

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" Disable swap files, open all the vim files!
" WARNING could be dangerous.
set noswapfile

set mouse=a

" Used to be 11
colorscheme zenburn
set guifont=Consolas\ 9

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
set listchars=tab:>.,trail:.
set list

" load pathogen which will autoload plugins.
runtime repos/vim-pathogen/autoload/pathogen.vim
call pathogen#infect('repos')
call pathogen#infect('plugins')

" haskell-mode configuration.
let g:haddock_browser="google-chrome"
au BufEnter *.hs compiler ghc
