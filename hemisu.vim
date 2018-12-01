augroup colorscheme_customizations
  if has('autocmd')
    autocmd ColorScheme hemisu highlight EndOfBuffer guifg=bg
    autocmd ColorScheme hemisu if &background == 'dark' | highlight Normal guibg=#2F343F
  endif
augroup END

