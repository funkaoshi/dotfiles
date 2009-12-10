"------------------------------------------------------------------------------
" File: $HOME/.vimrc
" Author: Ramanan Sivaranjan
"------------------------------------------------------------------------------

" turn off vi compatibility
set nocompatible

" Enable filetype-specific indenting
filetype indent plugin on

" Enable syntax-highlighting.
if has("syntax")
  syntax on
endif

colorscheme inkpot

let c_space_errors = 1

" Better command-line completion
set wildmenu
set wildmode=list:longest
set wildchar=<TAB>

" Show partial commands in the last line of the screen
set showcmd

" text formating
set autoindent
set smartindent
set nowrap              " Don't wrap source code. 

" tabstops
set tabstop=3           " Number of spaces <tab> counts for.
set shiftwidth=3        " Number of spaces used when autoindenting and indenting multiple lines
set expandtab           " Tabs are turned to spaces.

autocmd FileType ruby setlocal shiftwidth=2 tabstop=2


" search settings
set hlsearch            " Highlight search matches.
set incsearch           " Incremental search.
set ignorecase
set smartcase           " ignore case, unless search with captital letters

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" no mode lines.
set nomodeline

" misc
set ruler               " Show the line and column numbers of the cursor.
set showmode            " Show current mode.
set showmatch           " Show matching brackets.
set history=100         " Number of lines of command line history.
set undolevels=200      " Number of undo levels.
set scrolloff=5         " Keep a context when scrolling.
set noerrorbells        " No beeps.
set esckeys             " Cursor keys in insert mode.
set magic               " Use 'magic' patterns (extended regular expressions).
set ttyfast             " We have a fast terminal connection.
set encoding=utf-8      " Set default encoding to UTF-8.
set nostartofline       " Do not jump to first character with page commands,
                        " i.e., keep the cursor in the current column.
set laststatus=2        " statusline on second last line
set viminfo='20,\"500   " Read/write a .viminfo file, don't store more than
                        " 50 lines of registers.

" Tell vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
set listchars=tab:>-,trail:·,eol:$


"------------------------------------------------------------------------------
" Abbreviations.
"------------------------------------------------------------------------------

imap jj <ESC>

" Quit with 'q' instead of ':q'. VERY useful!
map q :q<CR>

" Enable this if you mistype :w as :W or :q as :Q.
nmap :W :w
nmap :Q :q
