set noshowmode  " No need to show --INSERT-- anymore now that airline does it.
let g:airline_symbols_ascii = 1
let g:airline#extensions#tabline#enabled = 0
if has('gui_running')
else
  let g:airline_theme='minimalist'
endif
" Change how the Obsession.vim status and line and column numbers in the
" bottom right look.
let g:airline_section_z = '%{airline#util#wrap(airline#extensions#obsession#get_status(),0)}%3l/%L:%-3v'
let g:airline#extensions#gutentags#enabled = 1
