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
let mapleader = ","
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

set ffs=unix,mac,dos "Default file types 影响换行符 应尽量使用unix

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
" tabstop ： 一个tab等于多少个空格，当 expandtab的情况下，会影响在插入模式下按下<tab>键输入的空格，以及真正的 \t 用多少个空格显示；当在 noexpandtab 的情况下，只会影响 \t 显示多少个空格（因为插入模式下按 <tab> 将会输入一个字符 \t ）
" expandtab ：设为真，在插入模式下按<tab>会插入空格，用>缩进也会用空格空出来；如果设置为假noexpandtab，那么插入模式下按<tab>就是输入\t，用>缩进的结果也是在行前插入\t。
" softtabstop ：按下 <tab> 将补出多少个空格。在 noexpandtab 的状态下，实际补出的是 \t 和空格的组合。所以这个选项非常奇葩，比如此时 tabstop=4 softtabstop=6 ，那么按下 <tab> 将会出现一个 \t 两个空格。
" shiftwidth ：使用 >> << 或 == 来缩进代码的时候补出的空格数。这个值也会影响 autoindent 自动缩进的值。
set expandtab       "Use softtabstop spaces instead of tab characters for indentation
set shiftwidth=4    "Indent by 4 spaces when using >>, <<, == etc.
set softtabstop=4   "Indent by 4 spaces when pressing <TAB>
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

let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
