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

colors ir_black

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

" required by snipMate plugin
filetype plugin on

let g:indent_guides_auto_colors = 0
let g:snippets_dir = "~/.vim/bundle/vim-snipmate/snippets"

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
