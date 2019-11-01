set noshowmode  " No need to show --INSERT-- anymore now that airline does it.

" Don't mess around with patched fonts and symbols.
let g:airline_powerline_fonts = 0
let g:airline_symbols_ascii = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:taboo_tabline = 0
let g:airline#extensions#taboo#enabled = 0
let g:airline#extensions#gutentags#enabled = 1

if has('gui_running')
  let g:airline#extensions#tabline#enabled = 0  " Use GTK tabs in GVim.
endif

" Prevent crash on vim startup when you try to change g:airline_symbols.*
" settings.
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Disable the git branch symbol because I don't like how it looks.
let g:airline_symbols.branch = ''

" Change how the Obsession.vim status and line and column numbers in the
" bottom right look.
let g:airline_section_z = '%{airline#util#wrap(airline#extensions#obsession#get_status(),0)}%4l/%L %3v'
