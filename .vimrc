" local vimrc config

set number
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set nocompatible
set hlsearch
set ruler

au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.sass set filetype=sass

set directory^=$HOME/.swp//

imap ii <Esc>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tn :ntabnew<CR>

map cc :w \| :silent !compass compile<CR>:redraw!<CR>

if has("mouse")
      set mouse=a
endif

filetype off
call pathogen#infect('~/.vim/bundle')
syntax on
filetype plugin indent on

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
