" M
" Beginners .vimrc
" v0.1 2012-10-22 Philip Thrasher
"
" Important things for beginners:
" * Start out small... Don't jam your vimrc full of things you're not ready to
"   immediately use.
" * Read other people's vimrc's.
" * Use a plugin manager for christ's sake! (I highly recommend vundle)
" * Spend time configuring your editor... It's important. Its the tool you
"   spend 8 hours a day crafting your reputation.
" * remap stupid things to new keys that make you more efficient.
" * Don't listen to the haters that complain about using non-default
"   key-bindings. Their argument is weak. I spend most of my time in the editor
"   on my computer, not others, so I don't care if customizing vim means I'll
"   have a harder time using remote vim.
"
" Below I've left some suggestions of good default settings to have in a bare
" minimal vimrc. You only what you want to use, and nothing more. I've heavily
" commented each, and these are what I consider bare necessities, my workflow
" absolutely depends on these things.
"
" If you have any questions, email me at pthrash@me.com
 
" Setup Vundle:
" For this to work, you must install the vundle plugin manually.
" https://github.com/gmarik/vundle
" To install vundle, copy all the files from the repo into your respective
" folders within ~/.vim
set nocompatible " Fuck VI... That's for grandpas.
filetype off
 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
 
" Vundle let's you specify a plugin in a number of formats, but my favorite
" allows you to grab plugins straight off of github, just specify the bundle
" in the following format:
" Bundle 'githubUsername/repoName'
 
" Let vundle manage itself:
Plugin 'gmarik/vundle'

Plugin 'flazz/vim-colorschemes'
 
" Fuzzy finder -- absolutely must have.
Plugin 'kien/ctrlp.vim'
 
" Support for easily toggling comments.
Plugin 'tpope/vim-commentary'
 
" In addtion to the above plugins, you'll likely need some for individual
" non-standard syntaxes that aren't pre-bundled with vim. Here are some I use,
" these are required for me, but depending on what code you write, obviously
" this may differ for you.
 
" Proper JSON filetype detection, and support.
Plugin 'leshill/vim-json'
 
" vim already has syntax support for javascript, but the indent support is
" horrid. This fixes that.
Plugin 'pangloss/vim-javascript'
 
" vim indents HTML very poorly on it's own. This fixes a lot of that.
Plugin 'indenthtml.vim'
 
" I write markdown a lot. This is a good syntax.
Plugin 'tpope/vim-markdown'

" LessCSS -- I use this every day.
Plugin 'groenewege/vim-less'
 
" Coffee-script syntax.
Plugin 'kchmck/vim-coffee-script'

Plugin 'fatih/vim-go'

" Elixir
Plugin 'elixir-lang/vim-elixir'
 
Plugin 'scrooloose/nerdtree'

Plugin 'majutsushi/tagbar'

Plugin 'severin-lemaignan/vim-minimap'

Plugin 'SirVer/ultisnips'

Plugin 'Yggdroot/indentLine'

Plugin 'Raimondi/delimitMate'

Plugin 'ervandew/supertab'

Plugin 'rizzatti/dash.vim'

Plugin 'ajh17/Spacegray.vim'

" REACT.js
Plugin 'mxw/vim-jsx'

Plugin 'ternjs/tern_for_vim'

Plugin 'Valloric/YouCompleteMe'


" We have to turn this stuff back on if we want all of our features.
call vundle#end()
filetype plugin indent on " Filetype auto-detection
syntax on " Syntax highlighting
 
"vertical line indentation
 let g:indentLine_color_term = 239
 let g:indentLine_color_gui = '#09AA08'
 let g:indentLine_char = '│'

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.
set nu
 
" We have VCS -- we don't need this stuff.
set nobackup " We have vcs, we don't need backups.
set nowritebackup " We have vcs, we don't need backups.
set noswapfile " They're just annoying. Who likes them?
 
" don't nag me when hiding buffers
set hidden " allow me to have buffers with unsaved changes.
set autoread " when a file has changed on disk, just load it. Don't ask.
 
" Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.
 
" allow the cursor to go anywhere in visual block mode.
set virtualedit+=block
 
" leader is a key that allows you to have your own "namespace" of keybindings.
" You'll see it a lot below as <leader>
let mapleader = ","
 
 
" So we don't have to press shift when we want to get into command mode.
nnoremap ; :
vnoremap ; :
 
" So we don't have to reach for escape to leave insert mode.
inoremap jf <esc>
 
" create new vsplit, and switch to it.
noremap <leader>v <C-w>v
 
" bindings for easy split nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
 
" Use sane regex's when searching
nnoremap / /\v
vnoremap / /\v
 
" Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>
 
" Quick buffer switching - like cmd-tab'ing
nnoremap <leader><leader> <c-^>
 
 
" Visual line nav, not real line nav
" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion. This fixes that.
noremap j gj
noremap k gk
 
" Plugin settings:
" Below are some 'sane' (IMHO) defaults for a couple of the above plugins I
" referenced.
 
" Map the key for toggling comments with vim-commentary
nnoremap <leader>c <Plug>CommentaryLine
 
" Remap ctrlp to ctrl-t -- map it however you like, or stick with the
" defaults. Additionally, in my OS, I remap caps lock to control. I never use
" caps lock. This is highly recommended.
let g:ctrlp_map = '<c-t>'
 
" Let ctrlp have up to 30 results.
let g:ctrlp_max_height = 30
 
 
" Finally the color scheme. Choose whichever you want from the list in the
" link above (back up where we included the bundle of a ton of themes.)
map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" use 4 spaces for tabs
"set tabstop=4 softtabstop=4 shiftwidth=4
"
" " display indentation guides
"set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×
"
" " convert spaces to tabs when reading file
"autocmd! bufreadpost * set noexpandtab | retab! 4
"
" " convert tabs to spaces before writing file
"autocmd! bufwritepre * set expandtab | retab! 4
"
" " convert spaces to tabs after writing file (to show guides again)
"autocmd! bufwritepost * set noexpandtab | retab! 4)"""""

" Use <leader>t to open ctrlp
 let g:ctrlp_map = '<leader>t'
" " Ignore these directories
 set wildignore+=*/build/**
" " disable caching
 let g:ctrlp_use_caching=0

" use JSX plugin with .js files
let g:jsx_ext_required = 0

set mouse=a
set bs=2
colorscheme spacegray  

" Tern
"enable keyboard shortcuts
let g:tern_map_keys=1
""show argument hints
let g:tern_show_argument_hints='on_hold'

" iTerm2
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" iTerm2 using TMUX
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
