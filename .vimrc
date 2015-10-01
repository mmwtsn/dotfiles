" ===================
" Vundle Set-up Start
" ===================

" Use Vundle to manage dependencies and plugins used by Vim
" These settings must be called before plugins are sourced
" https://github.com/gmarik/Vundle.vim#quick-start

set nocompatible                      " Do not run in vi compatability mode
filetype off                          " Temporarily turn off filetype detection
set rtp+=~/.vim/bundle/Vundle.vim     " Set Vundle runtime path and initialize
call vundle#begin()                   " Begin sourcing Vundle plugins

" ==================
" Vundle Plugin Load
" ==================

Plugin 'gmarik/Vundle.vim'            " Start things off with Vundle itself
Plugin 'Valloric/YouCompleteMe'       " Powerful completion engine
Plugin 'marijnh/tern_for_vim'         " JavaScript code analysis engine
Plugin 'airblade/vim-gitgutter'       " Displays git status in sidebar
Plugin 'ctrlpvim/ctrlp.vim'           " Fast filepath fuzzy find
Plugin 'rking/ag.vim'                 " Wrapper around the Silver Searcher
Plugin 'tpope/vim-fugitive'           " Wrapper around Git
Plugin 'bling/vim-airline'            " Customized status line
Plugin 'Raimondi/delimitMate'         " Automatically adds closing symbol
Plugin 'tpope/vim-surround'           " Simplifies editing character pairs
Plugin 'thoughtbot/vim-rspec'         " Lightweight RSpec runner
Plugin 'ervandew/supertab'            " Brings together YCM, ultisnips
Plugin 'scrooloose/syntastic'         " Syntax checker
Plugin 'SirVer/ultisnips'             " Snippet engine
Plugin 'mmwtsn/vim-snippets'          " Standard JS-compliant Snippet packages
Plugin 'wlangstroth/vim-racket'
Plugin 'raichoo/haskell-vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'jiangmiao/simple-javascript-indenter'
Plugin 'digitaltoad/vim-jade'

" =================
" Vundle Set-up End
" =================

call vundle#end()                   " End sourcing of Vundle plugins
filetype plugin indent on           " Enable filetype plugin, indent, detection

" =======
" Airline
" =======

" Enable support for a unicode symbols provided by a Powerline patched font by
" populating the g:airline_symbols dictionary
let g:airline_powerline_fonts=1

" Turn off Git file change info because GitGutter is already showing changes
let g:airline#extensions#hunks#enabled=0

" If current directory is not git initialized, say so!
let g:airline_section_b='%{GitHeadOrWarning()}'

function! GitHeadOrWarning()
  if empty(fugitive#head(7))
    let status='NOT INITIALIZED'
  else
    let status=fugitive#head(7)
  endif
  return status
endfunction

" Change out the file encoding information for a simple 12-hour timestamp
let g:airline_section_y='%{strftime("%I:%M\ %p")}'

" Set the colorscheme to match colorscheme used by Vim
let g:airline_theme='base16'

" =========
" Syntastic
" =========

" Automatically open and close error window
let g:syntastic_auto_loc_list=1

" Check syntax on open as well as on save
let g:syntastic_check_on_open=1

" Specify sidebar symbols when errors are detected
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='✗'
let g:syntastic_style_error_symbol='✗'
let g:syntastic_style_warning_symbol='✗'

" Specify language-specific linters in order of prescedence
let g:syntastic_javascript_checkers=['standard']

" =========================
" YouCompleteMe & UtilSnips
" =========================

" Make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType='<C-n>'

" Better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

" ==========================
" Simply JavaScript Indenter
" ==========================

" Do not automatically indent more than one shiftwidth each line
let g:SimpleJsIndenter_BriefMode=1

" =======
" Display
" =======

syntax enable      " Enable syntax highlighting
set shortmess+=I   " Disable start screen
set number         " Show line numbers
set relativenumber " Show relative line numbers
set scrolloff=5    " Minimum number of lines kept above and below the cursor
set textwidth=80   " Width of column before text wraps to a new line
set colorcolumn=80 " Draw line at this character limit
set encoding=utf-8 " Uset UTF-8 as it's the dominant character set on the web
set list           " Show whitespace characters
set listchars=
  \tab:▸\ ,trail:• " Set Tab and trailing whitespace display characters
set laststatus=2   " Always show the status bar at the botom
set showtabline=2  " Always show the tab bar at the top

" Ensure annoying preview window is not triggered
set completeopt-=preview

" ===========
" Colorscheme
" ===========

colorscheme base16-tomorrow
set background=dark
highlight HiTODO cterm=bold term=bold ctermbg=lightblue ctermfg=black
match HiTODO /TODO/

" ====
" Text
" ====

set backspace=2   " Allow backspacing over start/end of lines and indentation
set nofoldenable  " Turn off folds by default

" =============
" Spaces & Tabs
" =============

set expandtab     " Expand tab character to spaces when <Tab> is pressed
set shiftwidth=2  " Number of spaces added automatically or when indenting
set softtabstop=2 " Width of Tab character in insertion mode
set autoindent    " Copy indent from current line when starting new line
set cindent       " Like `smartindent` but more syntax-aware and configurable

" ======
" Search
" ======

set ignorecase     " Ignore case while searching
set hlsearch       " Highlight search results

" =================
" Opening & Closing
" =================

set tabpagemax=50  " Maximum number of tabs to be opened with `vim -p ...`
set noswapfile     " Open new buffers without creating a temporary swap file

" ===============
" Controlling Vim
" ===============

let mapleader="," " Remap <Leader> to something easier to reach
set splitright    " Open new horizontally split windows to the right

" NOTES:
"
"   `nnoremap` will remap key bindings, non-recursively, in normal mode
"   `<Leader>` is a modifier key that is set to <\> by default
"   `<CR>`     is your <Return> key
"   `:`        is used to open Vim's command prompt
"

" Write, quit with `,w` and `,q`
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" Clear search highlighting with `<Return>`
nnoremap <CR> :noh<CR><CR>

" Switch next, previous tab with `tl`, `th`
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>

" Switch top, right, bottom, left split with `sk`, `sl`, `sj`, `sh`
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sj <C-w>j
nnoremap sh <C-w>h

" Toggle paste mode on, off with `<Control>j`, `<Control>k`
map <C-j> :set paste<CR>
map <C-k> :set nopaste<CR>

" Quick editing and sourcing (reloading) of .vimrc config
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>

" Pass calls to `K` through to the Silver Searcher
nnoremap K :Ag<CR>

" =====
" CtrlP
" =====

let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'

" Start searching in the current directory
let g:ctrlp_working_path_mode=0

" Disable the two status lines entirely as their default information is useless
" via: https://github.com/kien/ctrlp.vim/issues/413
let g:ctrlp_buffer_func={
    \ 'enter': 'Function_Name_1',
    \ 'exit':  'Function_Name_2',
    \ }

func! Function_Name_1()
    set laststatus=0
endfunc

func! Function_Name_2()
    set laststatus=2
endfunc

" ===================
" The Silver Searcher
" ===================

if executable('ag')
  set grepprg=ag\ --nogroup " Use :ag instead of :grep

  " Use ag in CtrlP for listing files
  let g:ctrlp_user_command='ag %s -l --nocolor --ignore=tmp/* --ignore=node_modules/* --ignore=*.css --ignore=*.jpg --ignore=*.jpeg --ignore=*.png --ignore=*.gif --ignore=*.svg --ignore=*.woff --ignore=*.ttf --ignore=*.eot -g ""'

  let g:ctrlp_use_caching=0 " Disable Caching
endif

" =========
" RSpec.vim
" =========

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" ===============
" Theme Overrides
" ===============

hi Search       ctermfg=00 ctermbg=01
hi LineNr       ctermfg=12 ctermbg=00
hi CursorLineNr ctermfg=03 ctermbg=00
hi SpellBad     ctermfg=01 ctermbg=00
hi SpellLocal   ctermfg=01 ctermbg=00
hi SpellCap     ctermfg=01 ctermbg=00
hi SpellRare    ctermfg=01 ctermbg=00
hi Todo         ctermfg=01 ctermbg=00
hi TabLineSel   ctermfg=03 ctermbg=00
hi StatusLine   ctermfg=07 ctermbg=10
hi StatusLineNC ctermfg=07 ctermbg=00
hi ColorColumn  ctermfg=01 ctermbg=10

" Extend ColorColumn highlight well beyond 80 columns
let &colorcolumn=join(range(81,999),",")

" =================
" Filetype Settings
" =================

" au BufRead,BufNewFile *.scss set filetype=scss
" au BufRead,BufNewFile *.sass set filetype=sass
" au BufRead,BufNewFile *.rake set filetype=ruby
" au BufRead,BufNewFile *.ru set filetype=ruby
" au BufRead,BufNewFile *.html.erb set filetype=eruby.html
" au BufRead,BufNewFile *.js.erb set filetype=javascript
" au BufRead,BufNewFile Gemfile set filetype=ruby
" au BufRead,BufNewFile Guardfile set filetype=ruby
" au BufRead,BufNewFile Rakefile set filetype=ruby
" au BufRead,BufNewFile Gruntfile set filetype=javascript
" au BufRead,BufNewFile *.rs set filetype=go
" au BufRead,BufNewFile .bash_* set filetype=sh

" ====================
" Indentation Settings
" ====================

autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
autocmd BufEnter *.rs set expandtab shiftwidth=4 softtabstop=4

" Hide library, package and other misc. files from Vim/Ctrl-P
" NOTE - CtrlP ignores this directive because a custom g:ctrlp_user_command
" value is specified above to have CtrlP call ag over grep if installed.
" Because of this, the wildignore value is not referenced. Either a massive
" list of inline `--ignore` values can be specified in the `ag ...` command
" above or a .agignore file can be added to your project.
set wildignore+=*/node_modules/*,*/tmp/*,*/public/*,*.so,*.swp,*.zip,*/dist/*,*/_site/*

" =====================
" TODO
" Misc. Legacy Settings
" =====================

" hi TabLineFill term=bold cterm=bold ctermbg=0
" inoremap {<CR> {<CR>}<Esc><S-o> " Auto-close and indent after opening {
" CloseTag configuration for HTML and ERB filetypes
"autocmd FileType html,erb let b:closetag_html_style=1
"autocmd FileType html,erb source ~/.vim/bundle/closetag/plugin/closetag.vim
