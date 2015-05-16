set nocompatible

autocmd BufEnter * silent! lcd %:p:h

set formatprg=par

" let mapleader      = ","
" let maplocalleader = ";"

" OS Detection
let $VIMHOME = $HOME . '/vimrc'

" Setup bundles
filetype off

set expandtab
set softtabstop=4
set shiftwidth=4

set rtp+=$VIMHOME/bundle/vundle/
call vundle#rc($VIMHOME . '/bundle')

" Vundle and packages
Bundle 'gmarik/vundle'
Bundle 'tommcdo/vim-lion'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'IndentAnything'
Bundle 'jcf/vim-latex'
Bundle 'ciaranm/inkpot'
Bundle 'elliottt/haskell-indent'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-surround'
Bundle 'pangloss/vim-javascript'
Bundle 'altercation/vim-colors-solarized'

" Colors and Syntax
set t_Co=256
syntax enable
set background=light
" colorscheme inkpot

" Highlight searches
set hlsearch

" CtrlP settings
let g:ctrlp_map = '<Space>'
let g:ctrlp_extensions = [ 'mixed' ]
let g:ctrlp_user_command = 'ag %s --nocolor -g ""'
let g:ctrlp_match_window = 'max:20'

" NERDTree config
if $OS != 'windows'
    let NERDTreeQuitOnOpen = 1
endif

" Powerline config
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

nnoremap s :exec "normal i".nr2char(getchar())."\el"<CR>
nnoremap S :exec "normal a".nr2char(getchar())."\el"<CR>

" Always show cursor position
set ruler

set nofoldenable

" Spell checking
if has("spell")
    setlocal spell spelllang=en_us
    set nospell
endif

" Highlight lines longer than 72 chars
" let w:m72=matchadd('ErrorMsg', '\%>72v.\+', -1)
" set textwidth=72

" Highlight trailing space, and tab characters, toggle with <leader>-s
" nnoremap <leader>s :set nolist!<CR>

" Better wrapping bindings
nnoremap <c-k> gqap
inoremap <c-k> <Esc>gqapi
vnoremap <c-k> gq

" Tab navigation
nnoremap <C-n> gt
nnoremap <C-p> gT
nnoremap <C-t> :tabnew<CR>

set showtabline=2

" Disable the help key
nnoremap <F1> <Esc>
inoremap <F1> <Esc>

" Print options
set printoptions=paper:letter

" Completion options
set wildmode=longest:full,list:full
set wildmenu
set wildignore=*.o,*.hi,*.swp,*.bc

" Disable the arrow keys when in edit mode
inoremap <Up>    <NOP>
inoremap <Right> <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
noremap <Up>    <NOP>
noremap <Right> <NOP>
noremap <Down>  <NOP>
noremap <Left>  <NOP>

inoremap jk <Esc>

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

" hi TabLineFill ctermfg=Gray ctermbg=Gray
" hi TabLine ctermfg=Black ctermbg=Gray
" hi TabLineSel ctermfg=White ctermbg=Blue

hi SpecialKey ctermbg=Red

function! MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return fnamemodify(bufname(buflist[winnr - 1]), ":t")
endfunction

function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999Xclose'
  endif

  return s
endfunction

set tabline=%!MyTabLine()
