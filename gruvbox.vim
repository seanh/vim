let g:gruvbox_contrast_dark = "hard"

augroup colorscheme_customizations
  if has('autocmd')
    autocmd ColorScheme gruvbox highlight EndOfBuffer guifg=bg
    "autocmd ColorScheme gruvbox if &background == 'dark' | highlight Normal guibg=#2F343F
    "autocmd ColorScheme gruvbox if &background == 'dark' | highlight StatusLine guifg=#2F343F
  endif
augroup END
