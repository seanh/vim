set shortmess+=I   " Don't show startup message when you open vim with a
                   " filename.
set nowrap         " Don't soft wrap lines (scroll horizontally instead).
set sidescroll=1   " Horizontally scroll one character at a time, instead of a
                   " whole screen width at a time.
set nocursorline   " Don't highlight the current line.
set guioptions-=m  " Remove the menu bar from gVim.
set guioptions-=T  " Remove the toolbar from gVim.
set guioptions-=r  " Remove the scrollbar from gVim.
set guioptions-=L  " Don't show the scrollbar in gVim when there is a
                   " vertically split window, either.
set hidden
set nobackup       " Don't leave annoying backup files around.
set noswapfile     " Don't leave annoying swap files around.
set number         " Show line numbers.
set showcmd        " Show the normal-mode command chord entered so far in the
                   " bottom-right corner.
set history=10000  " The number of previous commands that are remembered.
set mouse=a        " Enable the mouse in terminal vim.
set showmatch      " Highlight matching brackets.
set shiftround     " Round indentation to multiples of shiftwidth when > and <
                   " are used to indent and dedent. For example if shiftwidth
                   " is 2, and a line is indented by 1, then > will indent the
                   " line to 2 not 3 (and then > again will indent it to 4).
set title          " Change the terminal's title.
set list           " Show trailing whitespace etc (see also :help listchars)
set splitbelow     " Open split windows below the current window, not above.
set splitright     " Open split windows to the right of the current window, not to the left.


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
nnoremap <leader>n :CtrlP ~/notes<Enter>
nnoremap <leader>N :e ~/notes<Enter>
nnoremap <leader>t :CtrlPTag<Enter>
nnoremap <leader><Enter> :CtrlPBuffer<Enter>
nnoremap <leader>1 :set lines=52 \| set columns=88<Enter>
nnoremap <leader>2 :set lines=52 \| set columns=177<Enter>
nnoremap <leader>3 :set lines=52 \| set columns=266<Enter>
nnoremap <leader>? :e ~/Dropbox/vim.txt<Enter>



" CtrlP
" =====
" Files that the wildmenu (e.g. tab-complete when typing an :e <path> command)
" should ignore. CtrlP also uses this.
set wildignore+=*.swp,*.bak,*.pyc,*.class,*.egg-info/*,*/node_modules/*,.coverage.*
set shell=/bin/sh  " Fish causes problems with CtrlP.
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:35,results:35'
let g:ctrlp_switch_buffer = '0'
let g:ctrlp_match_current_file = 1


" Clipboard and registers
" =======================
"
" Make Vim use the desktop clipboard for all yank, change, delete and put
" operations. Yank in Vim will yank into the desktop clipboard, put (paste) in
" Vim will paste from the desktop clipboard.
"
" Warning: Things like deleting a single character with x will replace the
" contents of your desktop clipboard with that single character.
"
" Tip: The Yank register ("0) always contains the last yanked text and is not
" overwritten by change or delete commands. For example "0p to paste the last
" yanked text.
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
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

" IndentLine
" ==========
let g:indentLine_enabled=0  " Do :IndentLinesEnable to show indent lines.


" YouCompleteMe
" =============
" By default completion in "text", "markdown" and "mail" files is disabled by
" this blacklist. Remove them.
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'unite' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \}
" By default *semantic* completion in "gitcommit" files is disabled in this
" blacklist. Remove it. Also disable Python/Jedi semantic completion.
let g:ycm_filetype_specific_completion_to_disable = {
      \ 'python': 1
      \}


" Tabs
" ====
let g:taboo_tab_format=" %P (%W)%m "  " Use directory name as tab title.


" Status Line
" ===========
set laststatus=2  " Always show the status line.
set statusline=
set statusline+=%f
set statusline+=%m
set statusline+=\ %{fugitive#head(7)}
set statusline+=%=
set statusline+=%y


" Airline
" =======
" Don't mess around with patched fonts and symbols.
let g:airline_powerline_fonts = 0
let g:airline_symbols_ascii = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:taboo_tabline = 0
let g:airline#extensions#taboo#enabled = 0

set noshowmode  " No need to show --INSERT-- anymore now that airline does it.

if has('gui_running')
  let g:airline#extensions#tabline#enabled = 0  " Use GTK tabs in GVim.
endif

" Theme
" =====
if &term =~# '^screen'
  set t_8f=[38;2;%lu;%lu;%lum
  set t_8b=[48;2;%lu;%lu;%lum
endif
if has('gui_running')
  set background=light
  set guicursor+=a:blinkon0  " Disable all cursor blinking.
  set guifont=Ubuntu\ Mono\ 13
else
  set background=dark
  set termguicolors
endif
let g:gruvbox_contrast_light = 'medium'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1
colorscheme gruvbox
:autocmd VimEnter * if exists(':AirlineTheme') | AirlineTheme gruvbox | endif
let &colorcolumn=join(range(100,999),",")
augroup colorscheme_customizations
  if has('autocmd')
    autocmd ColorScheme gruvbox if &background == 'dark' | highlight ColorColumn guibg=#0d0e0f | else | highlight ColorColumn guibg=#fbf1c7 | endif
  endif
augroup END

set rtp+=~/.fzf

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
