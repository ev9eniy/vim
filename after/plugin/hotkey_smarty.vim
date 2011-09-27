" --------------------------------------- smarty --------------------------------------
au BufRead,BufNewFile *.tpl set filetype=smarty
"au BufRead,BufNewFile *.tpl set filetype=smarty
"additionally, if you would like dictionary completion, feel free to add something like this:
au Filetype smarty set dict+=~\VIM\VIMFILES\DICT\TWIG.DIC
au Filetype smarty set dict+=~\VIM\VIMFILES\DICT\HTML.DIC
au Filetype smarty set complete+=k 
au Filetype smarty inoremap {% {%  %}<LEFT><LEFT><Esc>i
au Filetype smarty inoremap {{ {{  }}<LEFT><LEFT><Esc>i
au Filetype smarty inoremap {# {#  #}<LEFT><LEFT><Esc>i

    "Copy class.class.class.class
autocmd BufNewFile,BufRead,BufWinEnter *.tpl imap ну <c-o>ve<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.tpl imap нуну <c-o>ve<S-left>e<S-left>e<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.tpl imap нунуну <c-o>ve<S-left>e<S-left>e<S-left>e<S-left>e<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.tpl imap нунунуну <c-o>ve<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.tpl imap нунунунуну <c-o>ve<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.tpl imap нунунунунуну <c-o>ve<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.tpl nmap ну ve<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.tpl nmap нуну ve<S-left>e<S-left>e<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.tpl nmap нунуну ve<S-left>e<S-left>e<S-left>e<S-left>e<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.tpl nmap нунунуну ve<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.tpl nmap нунунунуну ve<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.tpl nmap нунунунунуну <c-o>ve<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.tpl imap <M-i> {%if <C-V><End>{%endif<Esc>T}2<Left><Left>i
autocmd BufNewFile,BufRead,BufWinEnter *.tpl nmap <M-i> i{%if <C-V><End>{%endif<Esc>T}2<Left><Left>i
autocmd BufNewFile,BufRead,BufWinEnter *.tpl imap ff {%for in <C-V><End>{%endfor<Home><Right><Right><Right><Right><Right><Right><Right><Space><Esc>i
autocmd BufNewFile,BufRead,BufWinEnter *.tpl nmap ff i{%for in <C-V><End>{%endfor<Home><Right><Right><Right><Right><Right><Right><Right><Space><Esc>i
autocmd BufNewFile,BufRead,BufWinEnter *.tpl imap <silent><F3> <Esc>:w\|:!@validate.cmd %<CR><CR>ki
autocmd BufNewFile,BufRead,BufWinEnter *.tpl vmap <silent><F3> <Esc>:w\|:!@validate.cmd %<CR><CR>ki
autocmd BufNewFile,BufRead,BufWinEnter *.tpl nmap <silent><F3> :w\|:!@validate.cmd %<CR><CR>ki
autocmd BufNewFile,BufRead,BufWinEnter *.tpl imap inc include '<C-V>'<Left>
autocmd BufNewFile,BufRead,BufWinEnter *.tpl nmap inc include '<C-V>'<Left>

" Better indent support for PHP by making it possible to indent HTML sections
" as well.
if exists("b:did_indent")
  finish
endif

