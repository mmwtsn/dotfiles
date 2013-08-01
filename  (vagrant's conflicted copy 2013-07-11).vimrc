" local vimrc config

" Tab settings
set expandtab
set autoindent
set shiftwidth=2
set tabstop=2

" Add closing `}`, new line and auto-indent
set cindent
inoremap { {<CR>}<up><end><CR>

set list

set nocp
set number
set hlsearch
set splitright " open new horizontally split windows to the right

colors ir_black

" Set file types for various non-standard file formats
au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.sass set filetype=sass
au BufRead,BufNewFile *sass.erb set filetype=sass
au BufRead,BufNewFile *html.erb set filetype=html
au BufRead,BufNewFile *js.erb set filetype=js
au BufRead,BufNewFile *.go set filetype=go

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
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'"}

" Highlight trailing whitespace
hi ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

