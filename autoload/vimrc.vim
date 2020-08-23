"""""""""""""""""""""""""""
"
"	operation
"
"""""""""""""""""""""""""""
" ctrl+D  down half of screen
" ctrl+U  up half of screen

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" close vi competible
set nocp

" Sets how many lines of history VIM has to remember
set history=10000

" Enable filetype plugin
filetype on
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
set autowrite

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
" let mapleader = ","
let g:mapleader = ","

" Fast saving
"nmap <leader>w :w!<cr>

"Fast editing of .vimrc
"map <silent> <leader>ee :e ~/.vimrc<cr>

"Fast reloading of the .vimrc
"map <silent> <leader>ss :source ~/.vimrc<cr>

" When vimrc is edited, reload it
"autocmd! bufwritepost vimrc source ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical..
set so=7

set wildmenu "Turn on WiLd menu

set ruler "Always show current position

set cmdheight=2 "The commandbar height

set hid "Change buffer - without saving

set hidden " when there are no saved buffer, the vim will take responsibility to save the unsaved buffer

" Set backspace config
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

set wmh=0
set cindent
" No sound on errors
set noerrorbells
set novisualbell

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on "Enable syntax hl

set nu

set fileencodings=utf-8,ucs_bom,gb18030,gbk,gb2312,cp936,latin1
set termencoding=utf-8
set fileencoding=utf-8
set encoding=utf-8
set helplang=cn

set ffs=mac,unix,dos "Default file types

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set expandtab
set shiftwidth=4
set tabstop=4
"set smarttab

"set lbr
set tw=500

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines

" Always show the last window statusline
set laststatus=2

" set verbose=1
" set verbosefile=vimlog.txt
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <space> <C-W><C-W>
"inoremap jj <ESC>

