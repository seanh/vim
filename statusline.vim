" According to `help statusline` the default statusline setting is something
" like:
" :set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

set statusline=

" [Preview] if this is the preview window.
set statusline+=%w
" [Quickfix list] or [Location list] if this is one of those lists.
set statusline+=%w
" The file path or [No Name].
set statusline+=%f
" The current position in the arglist, e.g. "(1 of 2)".
" Only shows if the arglist has more than one file in it.
" This happens when you do `vim <FILE> <FILE> ...` on the command line.
set statusline+=%a
" [+] if file has unsaved changes.
set statusline+=%m
" [RO] if file is read-only.
set statusline+=%r

" Right-align from now on.
:set statusline+=%=

" The type of file in the buffer.
set statusline+=%y
" Cursor position.
set statusline+=\ %3l/%L:%3c
