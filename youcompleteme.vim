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
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
