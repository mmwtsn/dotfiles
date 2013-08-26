"
" M. Maxwell Watson's
" Vim Configuration File
" @mmwtsn
"

" Display line numbers
set number

set ic
set hlsearch
set nocp
set encoding=utf-8

" Indentation / Tab settings
set expandtab
set tabstop=2
set shiftwidth=2
set backspace=2
set autoindent
set smartindent

" Open new horizontally split windows to the right
set splitright

" CloseTag configuration for HTML and ERB filetypes
"autocmd FileType html,erb let b:closetag_html_style=1
"autocmd FileType html,erb source ~/.vim/bundle/closetag/plugin/closetag.vim

" Always show the status bar so Powerline is visible in single windows
set laststatus=2

" Set Powerline colorscheme"
let g:Powerline_colorscheme = 'maxwell'

" Do not display start screen
set shortmess+=I

" Add closing `}`, new line and auto-indent$
set cindent
inoremap { {<CR>}<up><end><CR>

" Color scheme
colors ir_black

" Vertical and horizontal cursor settings
set cuc cul

" Set filetypes for SCSS, SASS and ERB
au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.sass set filetype=sass
au BufRead,BufNewFile Gemfile set filetype=ruby

" Specify swap file directory
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
call pathogen#helptags()
syntax on

" required by snipMate plugin
filetype plugin on

let g:snippets_dir = "~/.vim/bundle/vim-snipmate/snippets"

" Highlight trailing whitespace
hi ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

