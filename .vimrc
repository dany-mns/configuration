syntax on
set number
set tabstop=2
set shiftwidth=2
set incsearch
set nohlsearch
set noswapfile
set ai
set mouse=a
set clipboard=unnamed

set ignorecase
set smartcase

autocmd BufEnter * if &syntax == '' | set set pastentax=java | endif
