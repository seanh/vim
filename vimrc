set nowrap
set cursorline     " Highlight the current line.
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
" Files that the wildmenu (e.g. tab-complete when typing an :e <path> command)
" should ignore. CtrlP also uses this.
set wildignore+=*.swp,*.bak,*.pyc,*.class,*.egg-info/*,*/node_modules/*


" Leader key
" ==========
let mapleader="\<CR>"


" Non-leader key mappings
" =======================

" Spacebar enters command mode.
nnoremap <Space> :

" Reflow a paragraph or a selected block with Q:
nnoremap Q gqap
vnoremap Q gq

nnoremap <leader>w :w<Enter>:SyntasticCheck<Enter>


" Window sizes
" ------------
nnoremap <leader>1 :set lines=52 \| set columns=88<Enter>
nnoremap <leader>2 :set lines=52 \| set columns=177<Enter>
nnoremap <leader>3 :set lines=52 \| set columns=266<Enter>


" Notes
" -----
nnoremap <leader>n :CtrlP ~/notes<Enter>
nnoremap <leader>N :e ~/notes<Enter>


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
" Tip: That Yank register ("0) always contains the last yanked text and is not
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


" Syntax highlighting
" ===================
set showmatch  " Highlight matching brackets.


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
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0


" Filetype settings
" ===============
" Vim's default is that <Tab> inserts a single, 8-column-wide tab character.
" set expandtab makes Vim use spaces instead of tabs.
" set tabstop=2 shiftwidth=2 softtabstop=2 makes Vim use two-column wide tabs,
" or two spaces if expandtab is on, you always want these three to be the same.
set expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead *.jinja2   set filetype=jinja2
autocmd Filetype css        setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype scss       setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype html       setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype jinja2     setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype python     setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype ruby       setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2


" CtrlP
" =====
" <Ctrl-p> is the default mapping to launch CtrlP.
set shell=/bin/sh  " fish causes problems with CtrlP.
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_switch_buffer = 'et'
map <c-b> :CtrlPBuffer<Enter>
nnoremap <leader>t :CtrlPTag<Enter>
nnoremap <leader>b :CtrlPBufTag<Enter>
nnoremap <leader>a :CtrlPBufTagAll<Enter>
nnoremap <leader>m :CtrlPMRU<Enter>
nnoremap <leader><Enter> :CtrlPBuffer<Enter>
map <c-c> :CtrlPClearAllCaches<Enter>


" IndentLine
" ==========
let g:indentLine_enabled = 0

map <C-y> :call yapf#YAPF()<cr>


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
