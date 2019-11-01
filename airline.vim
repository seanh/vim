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

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.branch = ''
