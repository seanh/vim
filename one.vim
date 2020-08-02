augroup colorscheme_customizations
  if has('autocmd')
    autocmd ColorScheme one call CustomizeColorSchemeOne()
  endif
augroup END

function CustomizeColorSchemeOne()
  if &background == "light"
    highlight EndOfBuffer  guifg=bg
    highlight StatusLine   guifg=#494b53 guibg=#fafafa
    highlight StatusLineNC guibg=#494b53 guifg=#fafafa
  endif
endfunction
