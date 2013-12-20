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

" Text width and formatting
set linebreak

" Indentation / Tab settings
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
set cindent

" Fix delete issue in Linux
set backspace=2"

" Open new horizontally split windows to the right
set splitright

" CloseTag configuration for HTML and ERB filetypes
"autocmd FileType html,erb let b:closetag_html_style=1
"autocmd FileType html,erb source ~/.vim/bundle/closetag/plugin/closetag.vim

" Always show the status bar so Powerline is visible in single windows
set laststatus=2

" Set Powerline colorscheme
let g:Powerline_colorscheme = 'maxwell'

" Call ctrl-p plug-in
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Do not display start screen
set shortmess+=I

" Color scheme
colors ir_black

" Vertical and horizontal cursor settings
set cuc cul

" Set filetypes for various file formats for correct syntax highlighting
au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.sass set filetype=sass
au BufRead,BufNewFile *.erb set filetype=eruby.html
au BufREad,BufNewFile *.json set filetype=javascript
au BufRead,BufNewFile *.coffee set filetype=javascript
au BufRead,BufNewFile *.rake set filetype=ruby
au BufRead,BufNewFile *.ru set filetype=ruby

au BufRead,BufNewFile Gemfile set filetype=ruby
au BufRead,BufNewFile Guardfile set filetype=ruby
au BufRead,BufNewFile Rakefile set filetype=ruby
au BufRead,BufNewFile Gruntfile set filetype=javascript

" Specify swap file directory
set directory^=$HOME/.swp//

" Add closing `}}` for Mustache.js templating
inoremap {{ {{}}<left><left>

" Add closing `}`, new line and auto-indent
inoremap { {<CR>}<Esc>ko

" map ij to exit insertion mode
imap jj <Esc>

" tab switching
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>

" split switching
nnoremap sh <C-w>h
nnoremap sl <C-w>l
nnoremap sj <C-w>j
nnoremap sk <C-w>k

" Disable folding in Markdown files to allow use of "---"/YAML
let g:vim_markdown_folding_disabled=1

" Toggle paste mode to avoid :set paste
map <C-j> :set paste<CR>
map <C-k> :set nopaste<CR>

" Pathogen settings for plug-in management
filetype off
call pathogen#infect('~/.vim/bundle')
call pathogen#helptags()
syntax on

" required by snipMate plugin
filetype indent on
filetype plugin on

let g:snippets_dir = "~/.vim/bundle/vim-snipmate/snippets"

" Highlight trailing whitespace
hi ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\(\S\+\)\@<=\s\+$/
