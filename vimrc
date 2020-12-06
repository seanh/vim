set shortmess+=I   " Don't show startup message when you open vim with a
                   " filename.
set nowrap         " Don't soft wrap lines (scroll horizontally instead).
set sidescroll=1   " Horizontally scroll one character at a time, instead of a
                   " whole screen width at a time.
set nocursorline   " Don't highlight the current line.
set hidden
set nobackup       " Don't leave annoying backup files around.
set noswapfile     " Don't leave annoying swap files around.
set nonumber         " Show line numbers.
set showcmd        " Show the normal-mode command chord entered so far in the
                   " bottom-right corner.
set history=10000  " The number of previous commands that are remembered.
set mouse=a        " Enable the mouse in terminal vim.
set mousefocus     " Enable focus-follows-mouse for windows.
set showmatch      " Highlight matching brackets.
set shiftround     " Round indentation to multiples of shiftwidth when > and <
                   " are used to indent and dedent. For example if shiftwidth
                   " is 2, and a line is indented by 1, then > will indent the
                   " line to 2 not 3 (and then > again will indent it to 4).
set notitle        " Don't change the terminal's title.
set list           " Show trailing whitespace etc (see also :help listchars)
set splitbelow     " Open split windows below the current window, not above.
set splitright     " Open split windows to the right of the current window, not to the left.
set ttymouse=xterm2
set sessionoptions+=globals
set wildignore+=*.swp
set wildignore+=*.bak
set wildignore+=*.pyc
set wildignore+=*.class
set wildignore+=.coverage
set wildignore+=.coverage.*
set wildignore+=*.egg-info/*
set wildignore+=node_modules/*
set wildignore+=.tox/*
set wildignore+=.git/*
set wildignore+=coverage/*
set wildignore+=.pytest_cache/*
set wildignore+=__pycache__/*
set wildignore+=.hypothesis/*
set wildignore+=celerybeat-schedule.dat
set wildignore+=celerybeat-schedule.dir
set wildignore+=celerybeat.pid

" Use the system clipboard as the default register.
set clipboard=unnamed,unnamedplus
if has('unnamedplus')
  " This makes Vim paste from the system clipboard register (the "+ or
  " "quoteplus" register) by default and yank into *both* the system clipboard
  " and the system selection ("* or "quotestar") registers by default.
  "
  " If you want to paste from the selection register instead of the clipboard,
  " do "*p instead of just p.
  set clipboard=unnamed,unnamedplus
else
  " If Vim lacks system clipboard register support then just use the system
  " selection register by default instead.
  set clipboard=unnamed
endif

" Non-leader key mappings
" =======================
" Spacebar enters command mode.
nnoremap <Space> :
" Reflow a paragraph or a selected block with Q:
nnoremap Q gqap
vnoremap Q gq


" Leader key
" ==========
let mapleader="\<CR>"
nnoremap <leader>n :CtrlP ~/Notes<Enter>
nnoremap <leader>N :e ~/Notes<Enter>
nnoremap <leader>t :CtrlPTag<Enter>
nnoremap <leader><Enter> :CtrlPBuffer<Enter>
nnoremap <leader>? :e ~/Dropbox/vim.txt<Enter>


" CtrlP
" =====
" Files that the wildmenu (e.g. tab-complete when typing an :e <path> command)
" should ignore. CtrlP also uses this.
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:35,results:35'
let g:ctrlp_switch_buffer = '0'
let g:ctrlp_match_current_file = 1
let g:ctrlp_working_path_mode = 'wra'
if executable("rg")
  let g:ctrlp_user_command = 'rg %s --files --sort=none --color=never --hidden --ignore-file=/home/seanh/.ripgrep/ignore --smart-case'
  let g:ctrlp_use_caching = 0
endif


" Undo
" ====
set undofile             " Turn on undo persistence.
set undodir=~/.vim/undo  " Save undo files in this directory instead of in the
                         " same directory as the real files.
                         " This directory must exist or undo persistence will
                         " fail silently!
set undolevels=1000000   " The number of changes to remember for undo
                         " (per file I think?)


" Search
" ======
set hlsearch
set ignorecase
set smartcase
" Bind Alt+/ in Visual Mode to search within the selection only.
vnoremap <M-/> <Esc>/\%V


" Autocomplete
" ============
" Enable autocompletion of words from the dictionary.
" (/usr/share/dict/words comes from the wbritish package on Debian/Ubuntu.)
set dictionary+=/usr/share/dict/words
set complete+=k       " Autocomplete from the files in the `dictionary` setting.
set complete+=kspell  " Autocomplete from spellchecker files.
set complete+=s       " Autocomplete from files in the `thesaurus` setting.


" Autosave
" ========
let g:auto_save=1
let g:auto_save_silent=1
let g:auto_save_in_insert_mode=0


" Filetype settings
" ===============
" Vim's default is that <Tab> inserts a single, 8-column-wide tab character.
" set expandtab makes Vim use spaces instead of tabs.
" set tabstop=2 shiftwidth=2 softtabstop=2 makes Vim use two-column wide tabs,
" or two spaces if expandtab is on, you always want these three to be the same.
set expandtab tabstop=4 shiftwidth=4 softtabstop=4
augroup filetype_customizations
  if has('autocmd')
    autocmd BufNewFile,BufRead *.jinja2   set filetype=jinja2
    autocmd Filetype css        setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd Filetype scss       setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd Filetype html       setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd Filetype jinja2     setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd Filetype python     setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
    autocmd Filetype ruby       setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd Filetype vim        setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
  endif
augroup END

source ~/.vim/statusline.vim
"source ~/.vim/airline.vim
source ~/.vim/one.vim
source ~/.vim/youcompleteme.vim
source ~/.vim/gutentags.vim
source ~/.vim/black.vim
source ~/.vim/taboo.vim

" Exit insert mode by typing "jj" twice quickly.
:imap jj <Esc>

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif


highlight EndOfBuffer guifg=bg
highlight VertSplit   guifg=bg
highlight VertSplit   guibg=fg
if &background == "light"
  highlight VertSplit    guibg=#dddddd
  highlight StatusLine   guifg=#f9f9f9 guibg=#444444
  highlight StatusLineNC guifg=#f9f9f9 guibg=#444444
endif
