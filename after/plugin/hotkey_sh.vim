" autocmd BufNewFile,BufRead,BufWinEnter *.sh set filetype=sh
autocmd BufNewFile,BufRead,BufWinEnter *.sh set dict+=~\VIM\VIMFILES\DICT\BASH.DIC
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap <M-l> else
" autocomplete from
autocmd BufNewFile,BufRead,BufWinEnter *.sh set complete=""
" current buffer
autocmd BufNewFile,BufRead,BufWinEnter *.sh set complete+=.
" from tags
autocmd BufNewFile,BufRead,BufWinEnter *.sh set complete+=t
" dictionary
autocmd BufNewFile,BufRead,BufWinEnter *.sh set complete+=k
" from other open buffers/tabs
autocmd BufNewFile,BufRead,BufWinEnter *.sh set complete+=b
autocmd BufNewFile,BufRead,BufWinEnter *.sh set tags +=ctags

" automatically open and close the popup menu / preview window
autocmd BufNewFile,BufRead,BufWinEnter *.sh au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
autocmd BufNewFile,BufRead,BufWinEnter *.sh set completeopt=menuone,menu,longest,preview
" autocomplete options
"autocmd BufNewFile,BufRead,BufWinEnter *.sh set completeopt-=preview
"autocmd BufNewFile,BufRead,BufWinEnter *.sh set completeopt+=longest
autocmd BufNewFile,BufRead,BufWinEnter *.sh set mps-=[:]

autocmd BufNewFile,BufRead,BufWinEnter *.sh set csprg=cscope.exe
autocmd BufNewFile,BufRead,BufWinEnter *.sh let g:CCTreeDisplayMode = 3
autocmd BufNewFile,BufRead,BufWinEnter *.sh let g:CCTreeWindowVertical = 0
autocmd BufNewFile,BufRead,BufWinEnter *.sh highlight CCTreeHiSymbol  gui=bold guibg=darkblue guifg=peachpuff  
autocmd BufNewFile,BufRead,BufWinEnter *.sh highlight CCTreeHiMarkers  gui=bold guifg=darkgreen guibg=lightyellow

"set keywordprg=dictionary
" actionscript language
autocmd BufNewFile,BufRead,BufWinEnter *.sh let tlist_actionscript_settings = 'actionscript;c:class;f:method;p:property;v:variable'

autocmd BufNewFile,BufRead,BufWinEnter *.sh setlocal ofu=actionscriptcomplete#Complete

"---------------mxmlc-----------
"setlocal makeprg=c://php//mxmlc.cmd\ %
"setlocal errorformat=\%f(%l):\ col:\ %c\ Error:\ %m
"---------------SWFTools--------
autocmd BufNewFile,BufRead,BufWinEnter *.sh setlocal makeprg=c://php//as3comp.cmd\ %
autocmd BufNewFile,BufRead,BufWinEnter *.sh setlocal errorformat=\%f:%l:%c:\ %m
autocmd BufNewFile,BufRead,BufWinEnter *.sh omap <C-q> <Esc>
autocmd BufNewFile,BufRead,BufWinEnter *.sh nmap <C-q> i
autocmd BufNewFile,BufRead,BufWinEnter *.sh vmap <C-q> i
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap <silent><C-q> <Esc>:w\|:!flv_run.cmd %<CR><CR>\|:call PHPsynCHK()<Enter>i
autocmd BufNewFile,BufRead,BufWinEnter *.sh nmap <M-p> A<Enter> echo '<C-v>:$<C-v>'<Esc>T+i<C-v><Esc>A<Home>PREfix
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap <M-p> <Esc>A<Enter> echo '#<C-v>:$<C-v>'<Esc>T+i<C-v><Esc>A<Home>PREfix
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap PREfix <C-o>:s/\m[\'/[\"/g<CR><C-o>:s/\m\']/\"]/g<CR>
autocmd BufNewFile,BufRead,BufWinEnter *.sh nmap <M-e> A<Enter> echo <C-v>:<C-v><Esc>T:i
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap <M-e> <Esc>A<Enter> echo <C-v>:<C-v><Esc>T:i

autocmd BufNewFile,BufRead,BufWinEnter *.sh imap <M-.> ..<LEFT>
"Ctrl -      '' => ''
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap  ''<Space>=><Space>'',<Esc>3T'<Left>i
"Ctrl =      => 
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap <M--> <Space>=><Space>
"Alt+-       ==''
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap <C-=> = ""<Esc>T'i
"Alt+=       = ;
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap <M-=> <c-o>A=<Space>;<Left>
"Alt+Shift+- !=
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap ъ !=
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap ?? #!/bin/bash<S-Enter><Enter>#END<Up>
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap ii ifФ
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap <я-f> funЯЕЬЫФ
""imap ff foreach ( as ){<Esc>T(i
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap frr forФ
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap <C-f> funФ
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap <M-i> if<M-f>
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap tt `expr length <c-v>`<Esc>T(i
"imap ff foreach ( <Esc><C-v>i as  <Esc><C-v>i){<Left>
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap ff forinФ
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap zz cut ''<Esc>T,i
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap ee echo<space>

"C-Insert
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap ну <c-o>ve<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap нуну <c-o>vf]<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap нунуну <c-o>v2f]<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap нунунуну <c-o>v3f]<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap нунунунуну <c-o>v4f]<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.sh nmap ну ve<C-c>i
autocmd BufNewFile,BufRead,BufWinEnter *.sh nmap нуну vf]<C-c>i
autocmd BufNewFile,BufRead,BufWinEnter *.sh nmap нунуну v2f]<C-c>i
autocmd BufNewFile,BufRead,BufWinEnter *.sh nmap нунунуну v3f]<C-c>i
autocmd BufNewFile,BufRead,BufWinEnter *.sh nmap нунунунуну v4f]<C-c>i

autocmd BufNewFile,BufRead,BufWinEnter *.sh imap inc source<Left><Left><Left>

autocmd BufNewFile,BufRead,BufWinEnter *.sh imap  break;
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap aa array();<Esc>T(i
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap nn \r\n
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap foo <C-v> = fopen( <Esc><C-v>i,'w');
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap fpu fputs( <Esc><C-v>i,);<Esc>T)<LEFT>i
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap ppp preg_replace("//","",);<Esc>T(<Right><Right>i
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap pp preg_match("//",,$tmp);<Esc>T(<Right><Right>i
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap gg is<Esc>aset()<Left>
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap <M-s> substr_count(,)<Esc>T(i
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap Ж _value
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap Т _title
"autocmd BufNewFile,BufRead,BufWinEnter *.sh imap т $this->
autocmd BufNewFile,BufRead,BufWinEnter *.sh inoremap т <C-R>=MyThisOrCompletePHP()<CR>
autocmd BufNewFile,BufRead,BufWinEnter *.sh nnoremap т <C-R>=MyThisOrCompletePHP()<CR>

autocmd BufNewFile,BufRead,BufWinEnter *.sh inoremap { {<Enter>}<Up><End><Esc>i
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap <C-/> <c-o>I#<Esc>j^i
autocmd BufNewFile,BufRead,BufWinEnter *.sh nmap <C-/> I#<Esc>j^i

"Ctlr-Del
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap нь <Home><Del><Down>
autocmd BufNewFile,BufRead,BufWinEnter *.sh nmap нь <Home>1x<Down>
autocmd BufNewFile,BufRead,BufWinEnter *.sh nmap нь diw
autocmd BufNewFile,BufRead,BufWinEnter *.sh vmap нь diw
autocmd BufNewFile,BufRead,BufWinEnter *.sh imap <C-Space> <Space><Space><Left>