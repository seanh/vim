set guioptions-=m  " Remove the menu bar from gVim.
set guioptions-=T  " Remove the toolbar from gVim.
set guioptions-=r  " Remove the scrollbar from gVim.
set guioptions-=L  " Don't show the scrollbar in gVim when there is a
                   " vertically split window, either.
set sessionoptions+=resize
set columns=90
set lines=56
set guicursor+=a:blinkon0  " Disable all cursor blinking.
set guifont=Input\ Mono\ Regular\ 11
set background=light
colorscheme one

if $VIM_THEME == 'white'
  set columns=83
  set lines=59
  set guifont=Input\ Mono\ Light\ 11
  let &colorcolumn=join(range(81,999),",")
  autocmd VimEnter * set noru
  autocmd VimEnter * set laststatus=0
  set background=light
  colorscheme hemisu

  " Prose mode.
  set wrap linebreak nolist
  nmap j gj
  nmap <Down> gj
  nmap k gk
  nmap <Up> gk
  vmap j gj
  vmap <Down> gj
  vmap k gk
  vmap <Up> gk
endif
