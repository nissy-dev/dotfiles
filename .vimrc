"encoding
set encoding=utf-8
scriptencoding utf-8
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp

"show cusor
set ruler
"show line number
set number

"background color
set background=dark
"colorscheme
let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid

"hilight cursorline
autocmd ColorScheme * highlight LineNr ctermfg=12
highlight CursorLineNr ctermbg=4 ctermfg=0
set cursorline
highlight clear CursorLine

"enable syntax
syntax enable

"indent, tab
set autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set smarttab

"wrap long lines
set wrap

"complement filename
set wildmode=list:longest,full

"show vim command
set showcmd

"clipboard
set clipboard=unnamed,autoselect

"cursor movement
set whichwrap=b,s,h,l,<,>,~,[,]

"show long lines
set display=lastline

"setting for backup files
set nobackup

"other
set ignorecase
set wrapscan
set hlsearch
set backspace=indent,eol,start
set nrformats-=octal
set pumheight=10
