" Gutentags
" =========
"
" * Requires Exuberant Ctags to be installed (sudo apt install exuberant-ctags)
"
" * Automatically identifies project root folders, e.g. by the presence of a .git dir.
"
" * Creates and updates per-project ctags files on save
"
" * You can turn on Gutentags status info in Airline with:
"
"   let g:airline#extensions#gutentags#enabled = 1
"
"   This is done in airline.vim rather than in this file.
"   Shows "Gen. ctags" whenever you save, as it's updating tags.
"
" * When the current file is a project file then these commands are available:
"
"   * :GutentagsUpdate - Update the project's tags file with the tags from the current buffer
"   * :GutentagsUpdate! - Update the project's tags file with the tags from all files in the project

" Store tags files in this directory instead of in each project's directory.
let g:gutentags_cache_dir = "~/.vim/.gutentags_cache_dir"

" Exclude .tox dirs from being scanned for tags.
let g:gutentags_ctags_exclude = ["*/.tox/*"]

" Don't generate tags files automatically because it noticeably slows down Vim.
" Run :GutentagsUpdate (current buffer only) or :GutentagsUpdate! (whole project)
" manually instead.
let g:gutentags_generate_on_missing = 0
let g:gutentags_generate_on_new = 0
let g:gutentags_generate_on_write = 0
