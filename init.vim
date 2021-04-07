set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'tpope/vim-surround'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-projectionist'
Plug 'ianks/vim-tsx'
Plug 'aserebryakov/vim-todo-lists'
Plug 'sainnhe/sonokai'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'arzg/vim-colors-xcode'
Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'epmatsw/ag.vim'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'derekwyatt/vim-scala'                                       " scala plugin
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'Xuyuanp/nerdtree-git-plugin'                                " shows files git status on the NerdTree
Plug 'kien/rainbow_parentheses.vim'                               " for nested parentheses
Plug 'mbbill/undotree'
Plug 'godlygeek/tabular'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'}
Plug 'plasticboy/vim-markdown'
Plug 'yggdroot/indentline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()

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
let g:go_fmt_command = "goimports"
let mapleader = " "
autocmd CursorHold * update

let g:tmux_navigator_save_on_switch = 2

:tnoremap jj <C-\><C-n>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

imap jj <Esc>

nnoremap <CR> G

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['./git', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:netrw_browse_split=2
let g:netrw_banner = 0

let g:netrw_winsize = 25

" folds
nnoremap <S-tab> za
set fdo-=search

autocmd FileType json setlocal conceallevel=0 
autocmd FileType json syntax match Comment +\/\/.\+$+
