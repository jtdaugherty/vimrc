set nocompatible

" let mapleader      = ","
" let maplocalleader = ";"

" OS Detection
let $VIMHOME = $HOME . '/vimrc'

" Setup bundles
filetype off

set rtp+=$VIMHOME/bundle/vundle/
call vundle#rc($VIMHOME . '/bundle')

" Vundle
Bundle 'gmarik/vundle'

" External packages
Bundle 'tpope/vim-markdown'
Bundle 'IndentAnything'
" Bundle 'OOP-javascript-indentation'
" Bundle 'aaronbieber/quicktask'

Bundle 'tpope/vim-fugitive'
Bundle 'jcf/vim-latex'
Bundle 'ciaranm/inkpot'

" Haskell Indenting
Bundle 'elliottt/haskell-indent'

" NERDTree config
Bundle 'scrooloose/nerdtree'
if $OS != 'windows'
    let NERDTreeQuitOnOpen = 1
endif

" Powerline config
Bundle 'Lokaltog/vim-powerline'
set laststatus=2
" let g:Powerline_symbols = 'fancy'

" Enable filetype detection
filetype plugin indent on

set ignorecase smartcase

" Allow backspacing over everything
set backspace=indent,eol,start

" Incremental searching
set incsearch

" Extended matching with %
" runtime macros/matchit.vim

" Set the terminal title
set title

" Cursor context
set scrolloff=3

" Allow \ \ to kill the search highlighting.
nnoremap <Leader><Leader> :noh<Enter>

" Always show cursor position
set ruler

" Fold by manually defined folds
set foldenable

" Syntax
if &t_Co > 2 || has("gui_running")
    syntax enable
    set hlsearch
endif

" Spell checking
if has("spell")
    setlocal spell spelllang=en_us
    set nospell
endif

" Highlight lines longer than 80 chars
let w:m80=matchadd('ErrorMsg', '\%>80v.\+', -1)
set textwidth=80

" Highlight trailing space, and tab characters, toggle with <leader>-s
set list lcs=tab:>-,trail:.
nnoremap <leader>s :set nolist!<CR>

" Tab navigation
nnoremap <C-n> gt
nnoremap <C-p> gT

" Disable the help key
nnoremap <F1> <Esc>
inoremap <F1> <Esc>

" Print options
set printoptions=paper:letter

" Completion options
set wildmode=longest:full,list:full
set wildmenu
set wildignore=*.o,*.hi,*.swp,*.bc

" Colors!
colors default
set bg=dark

" Disable the arrow keys when in edit mode
inoremap <Up>    <NOP>
inoremap <Right> <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>

inoremap jj <Esc>

" Set F2 as the binding to toggle the paste mode
set pastetoggle=<F2>

" Use F3 to toggle spelling
nnoremap <F3> :set spell!<CR>

" Disable the bell
set noerrorbells
set visualbell
set t_vb=

" Map <Leader>s to sort the visual selection
vnoremap <Leader>s :sort<Cr>
