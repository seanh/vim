augroup peachpuff_colorscheme_customizations
  if has('autocmd')
    autocmd ColorScheme peachpuff call CustomizeColorSchemePeachpuff()
  endif
augroup END

function CustomizeColorSchemePeachpuff()
  highlight clear EndOfBuffer
  highlight EndOfBuffer guifg=bg
  highlight clear VertSplit
  highlight VertSplit guibg=bg
  highlight VertSplit guifg=#d2af8f
  highlight clear StatusLine
  highlight StatusLine guibg=#e1bd9d
  highlight clear StatusLineNC
  highlight StatusLineNC guibg=#f0cbab
endfunction

