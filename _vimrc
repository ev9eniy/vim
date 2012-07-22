set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" Use neocomplcache.

"Setting examples:
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

"autocmd BufNewFile,BufRead,BufWinEnter *.as 
let g:neocomplcache_enable_at_startup = 1

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
"This variable controls the number of the input completioning at the time of key input automatically.
let g:neocomplcache_auto_completion_start_length=2
"In a buffer or dictionary files, this variable controls		length of keyword becoming the object of the completion at		the minimum.
let g:neocomplcache_min_keyword_length=3
	" Define dictionary.
let	g:neocomplcache_temporary_dir=$HOME.'//VIMFILES//VIEW'

"Change start length of automatic completion.
let g:NeoComplCacheAutoCompletionLength=3
"For input-saving, this variable controls whether you can 		
"choose a candidate with a alphabet or number displayed 		
"beside a candidate after '-'.  When you input 'ho-a', 		
"neocomplcache will select candidate 'a'.
let g:neocomplcache_enable_quick_match=0

"		When neocomplcache displays candidates, this option controls
"		whether neocomplcache selects the first candidate
"		automatically.  If you enable this option, neocomplcache's
"		completion behaivior is like |AutoComplPop|.
let g:neocomplcache_enable_auto_select=0

"		This variable controls whether neocomplcache use |CursorHoldI| event
"		when complete candidates.
let g:neocomplcache_enable_cursor_hold_i=1

"		This variable defines time of automatic completion by a milli second unit. 		Default value is 300.
let g:neocomplcache_cursor_hold_i_time=50


"		When you input a capital letter, this variable controls
"		whether neocomplcache takes an ambiguous searching as an end
"		of the words in it.  For example, neocomplcache come to
"		match it with ArgumentsException when you input it with AE.
let g:neocomplcache_enable_camel_case_completion=1


"		When you input _, this variable controls whether
"		neocomplcache takes an ambiguous searching as an end of the
"		words in it.  For example, neocomplcache come to match it
"		with 'public_html' when you input it with 'p_h'.
let g:neocomplcache_enable_underbar_completion=1

"		This variable set a pattern of the buffer name. If matched it,
"		neocomplcache does not complete automatically. When it is an
"		empty character string, it becomes invalid.
"let g:neocomplcache_lock_buffer_name_pattern="if"


"		This variable controls the number of the input completioning
"		at the time of manual completion.  It is convenient when you
"		reduce this value, but may get heavy when you deleted a
"		letter in <C-h> or <BS> at popup indication time.
		let g:neocomplcache_manual_completion_start_length=0

	
		"When neocomplcache looks for candidate completion, this
		"variable controls whether neocomplcache ignores the upper-
		"and lowercase.  If it is 1, neocomplcache ignores case.
let	  g:neocomplcache_enable_ignore_case=0

let g:Tlist_Ctags_Cmd='ctags'
