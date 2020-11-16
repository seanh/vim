augroup colorscheme_customizations
  if has('autocmd')
    autocmd ColorScheme one call CustomizeColorSchemeOne()
  endif
augroup END

function CustomizeColorSchemeOne()
  highlight EndOfBuffer guifg=bg
  if &background == "light"
    highlight StatusLine   guifg=#494b53 guibg=#fafafa
    highlight StatusLineNC guibg=#494b53 guifg=#fafafa
  endif
endfunction
