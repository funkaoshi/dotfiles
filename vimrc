"------------------------------------------------------------------------------
" File: $HOME/.vimrc
" Author: Ramanan Sivaranjan
"------------------------------------------------------------------------------

colorscheme wombat

" turn off vi compatibility
set nocompatible

" Enable filetype-specific indenting
filetype plugin indent on

" Enable syntax-highlighting.
if has("syntax")
    syntax on
endif

" Better command-line completion
set wildmenu
set wildmode=list:longest
set wildchar=<TAB>
set wildignore+=*.o,*.obj,*.pyc,.git,.hg,*.orig


" Show partial commands in the last line of the screen
set showcmd

" text formating
set autoindent
set nosmartindent
set nowrap              " Don't wrap source code.

" default window size
set columns=80

" tabstops
set tabstop=4           " Number of spaces <tab> counts for.
set softtabstop=4       " Backspace will erase the same number of spaces as shiftwidth
set shiftwidth=4        " Number of spaces used when autoindenting and indenting multiple lines
set expandtab           " Tabs are turned to spaces.

if has("autocmd")
    autocmd Filetype make setlocal sw=8 sts=8 ts=8 noexpandtab
    autocmd FileType ruby setlocal sw=2 sts=2 ts=2
endif

" search settings
set hlsearch            " Highlight search matches.
set incsearch           " Incremental search.
set ignorecase

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" no mode lines.
set nomodeline

" misc
set mouse=a             " use mouse
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

" change leader from \ to ,
let mapleader=","

" Tell vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
set listchars=tab:>-,trail:·,eol:¬
nmap <leader>l :set list!<cr>

" open vimrc quickly
nmap <leader>v :tabedit $MYVIMRC<CR>

" toggle nerd tree on or off
nmap <leader>n :NERDTreeToggle<CR>

" command-t options
let g:CommandTMaxHeight = 10

" double j to enter command mode
imap jj <ESC>

" Quit with 'q' instead of ':q'. VERY useful!
map q :q<CR>

" Enable this if you mistype :w as :W or :q as :Q.
nmap :W :w
nmap :Q :q

function! Preserve(command)
    "Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" clean up trailing witespace
nmap <leader>$ :call Preserve("%s/\\s\\+$//e")<CR>

if has("autocmd")
    " clean up trailing white space on save
    autocmd BufWritePre * :call Preserve("%s/\\s\\+$//e")
    " auto source vimrc when saved
    autocmd BufWritePost .vimrc source $MYVIMRC

    " turn on omnicompletion
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    autocmd FileType c set omnifunc=ccomplete#Complete
endif

