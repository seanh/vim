set noshowmode  " No need to show --INSERT-- anymore now that airline does it.
let g:airline_symbols_ascii = 1
let g:airline#extensions#tabline#enabled = 0
if has('gui_running')
else
  let g:airline_theme='minimalist'
endif

" Don't show the file type.
" This is the default g:airline_section_x but with just the filetype
" (`%{airline#util#wrap(airline#parts#filetype(),0)}`) removed.
let g:airline_section_x = '%{airline#util#prepend("",0)}%{airline#util#prepend(airline#extensions#gutentags#status(),0)}%{airline#util#prepend("",0)}'

let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

" Change how the Obsession.vim status and line and column numbers in the
" bottom right look. This contains all the same components as the default
" section z but just formatted differently.
let g:airline_section_z = '%{airline#util#wrap(airline#extensions#obsession#get_status(),0)}%3l/%L:%-3v'
let g:airline#extensions#gutentags#enabled = 1
