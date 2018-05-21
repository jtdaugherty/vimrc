set nocompatible
set modeline
set modelines=5
set timeoutlen=1000 ttimeoutlen=0

" Change the CWD to the location of a file when entering its buffer
" autocmd BufEnter * silent! lcd %:p:h

set formatprg=par

let mapleader      = "\\"
" let maplocalleader = ","

" OS Detection
let $VIMHOME = $HOME . '/vimrc'

" Setup bundles
filetype off

" Netrw config
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_list_hide= '.*\.swp$,.DS_Store,.git,.cabal-sandbox,dist,dist-newstyle,^\.\.\=/\=$'

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
Bundle 'tpope/vim-dispatch'
Bundle 'IndentAnything'
Bundle 'jcf/vim-latex'
Bundle 'jtdaugherty/vim-haskell'
Bundle 'Lokaltog/vim-powerline'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'tpope/vim-surround'
Bundle 'pangloss/vim-javascript'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tommcdo/vim-exchange'
Bundle 'petRUShka/vim-opencl'
Bundle 'tikhomirov/vim-glsl'
Bundle 'airblade/vim-gitgutter'
Bundle 'SirVer/ultisnips'
Bundle 'jtdaugherty/vim-snippets'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips/'
" let g:UltiSnipsListSnippets = "<c-tab>"

let g:gitgutter_sign_column_always = 1

" Colors!
syntax enable
set t_Co=256
colorscheme solarized
set bg=dark

" Highlight searches
set hlsearch

" CtrlP settings
let g:ctrlp_map = '<Space>'
let g:ctrlp_extensions = [ 'mixed' ]
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_match_window = 'max:20'
let g:ctrlp_cmd = 'CtrlPMixed'
nnoremap <C-m> :CtrlPBuffer<CR>

set diffopt=filler,vertical

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

" Set the terminal title
set title

" Cursor context
set scrolloff=5

" Allow leader-leader to kill the search highlighting.
nnoremap <Leader><Leader> :noh<Enter>

" Always show cursor position
set ruler

set nofoldenable

" Spell checking
if has("spell")
    setlocal spell spelllang=en_us
    set nospell
endif

" Better wrapping bindings
nnoremap <c-k> gqap
inoremap <c-k> <Esc>gqap
vnoremap <c-k> gq

" Tab navigation
nnoremap <C-n> gt
nnoremap <C-p> gT
nnoremap <C-t> :tabnew<CR>

" Map F1 to toggle background dark/light
function! ToggleBackground()
  let &background = ( &background == "dark" ? "light" : "dark" )
endfunction

nnoremap <F1> :call ToggleBackground()<CR>
inoremap <F1> :call ToggleBackground()<CR>

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

" Set F2 as the binding to toggle the paste mode
set pastetoggle=<F2>

" Use F3 to toggle spelling
nnoremap <F3> :set spell!<CR>

" Disable the bell
set noerrorbells
set visualbell
set t_vb=

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
