set background=light
set guioptions-=m  " Remove the menu bar from gVim.
set guioptions-=T  " Remove the toolbar from gVim.
set guioptions-=r  " Remove the scrollbar from gVim.
set guioptions-=L  " Don't show the scrollbar in gVim when there is a
                   " vertically split window, either.
set sessionoptions+=resize
set columns=88 " Just wide enough to fit Black's 88 chars per line.
set lines=24
set guicursor+=a:blinkon0  " Disable all cursor blinking.
colorscheme one

" Set to width suitable for editing one file.
nnoremap <leader>1 :set columns=88<Enter>
" Set to width suitable for editing two files side-by-side.
nnoremap <leader>2 :set columns=177<Enter>
" Set to width suitable for editing three files side-by-side.
nnoremap <leader>3 :set columns=266<Enter>

let $FZF_DEFAULT_COMMAND = 'rg --files'
let $FZF_DEFAULT_OPTS = '--color=light --multi --preview "head -50 {}"'
