augroup colorscheme_customizations
  if has('autocmd')
    autocmd ColorScheme hemisu highlight EndOfBuffer guifg=bg
    autocmd ColorScheme hemisu if &background == 'dark' | highlight Normal guibg=#2F343F | else | highlight Normal guifg=#333333
    autocmd ColorScheme hemisu if &background == 'light' | highlight ColorColumn guibg=#f2f3f3
  endif
augroup END

