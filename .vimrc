" local vimrc config

set number
set expandtab
set tabstop=2
set shiftwidth=2
set backspace=2
set autoindent
set smartindent
set nocp
set hlsearch
set ruler
set splitright " open new horizontally split windows to the right

colors ir_black

au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.sass set filetype=sass

set directory^=$HOME/.swp//

" custom mappings
imap ii <Esc>

" tab switching
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>

" split switching
nnoremap sh <C-w>h
nnoremap sl <C-w>l
nnoremap sj <C-w>j
nnoremap sk <C-w>k

filetype off
call pathogen#infect('~/.vim/bundle')
syntax on

" required by snipMate plugin
filetype plugin on

let g:snippets_dir = "~/.vim/bundle/vim-snipmate/snippets"

" Highlight trailing whitespace
hi ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

