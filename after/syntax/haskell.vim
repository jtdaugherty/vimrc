set expandtab
set tabstop=4
set autoindent
set shiftwidth=4

set list lcs=tab:\ \ ,trail:\ 

if haskell#CabalFileExists()
    compiler cabal-build
endif
