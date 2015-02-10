set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'

Plugin 'majutsushi/tagbar'

Plugin 'ervandew/supertab'

"Plugin 'Shougo/neocomplete'

Plugin 'scrooloose/nerdtree'

"Plugin 'Valloric/YouCompleteMe'

map <C-n> :NERDTreeToggle<CR>

set number
syntax enable
set background=dark
let g:solarized_termcolors = 256

let g:neocomplete#enable_at_startup=1

autocmd VimEnter * NERDTree

nmap <F8> :TagbarToggle<CR>

Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
autocmd! bufwritepost .vimrc source %

colorscheme solarized

set pastetoggle=<F2>

set autoindent

set ruler
set showcmd

nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

set incsearch

map Q gq

filetype plugin indent on

" Mouse and backspace
set mouse=a
set bs=2
