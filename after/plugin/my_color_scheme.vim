" I do my color scheme settings after everything else (including after plugins
" have loaded) so that nothing messes with them.
"
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set laststatus=1
set termguicolors  " Make color schemes work properly in terminal vim.
let &colorcolumn=join(range(80,999),",")
set background=dark

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_color_column='bg0'
colorscheme gruvbox
