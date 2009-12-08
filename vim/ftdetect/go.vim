" Vim filetype detection file
" Language: GO
" Maintainer:
" URL: http://golang.org
" Version:	1
" Last Change: 13 NOV 2009
"
augroup go
     au! BufRead,BufNewFile *.go   setfiletype go
augroup END
