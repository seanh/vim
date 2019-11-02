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
" blacklist. Remove it.
let g:ycm_filetype_specific_completion_to_disable = {
      \}
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" Read ~/.global_ycm_extra_conf.py if no local .ycm_extra_conf.py exists.
let g:ycm_global_ycm_extra_conf = '~/.vim/global_ycm_extra_conf.py'
