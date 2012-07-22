autocmd BufNewFile,BufRead,BufWinEnter *.js nmap <silent><F12> :!ctag_js.cmd<CR><CR>
autocmd BufNewFile,BufRead,BufWinEnter *.js imap <silent><F12> <Esc>:!ctag_js.cmd<CR><CR>

autocmd BufNewFile,BufRead,BufWinEnter *.js setlocal dictionary+=$HOME.\VIMFILES\DICT\jq.dic
autocmd BufNewFile,BufRead,BufWinEnter *.js set dict+=$HOME.\VIMFILES\DICT\plueprint.dic
autocmd BufNewFile,BufRead,BufWinEnter *.js set omnifunc=javascriptcomplete#CompleteJS
autocmd BufNewFile,BufRead,BufWinEnter *.js let g:tlist_javascript_settings = 'javascript;v:var;c:class;p:prototype;m:method;f:function;o:object'
autocmd BufNewFile,BufRead,BufWinEnter *.js imap aa {};<Esc>T{i

"autocmd BufNewFile,BufRead,BufWinEnter *.js set makeprg=c://php//jsl\ -nologo\ -nofilelisting\ -nosummary\ -nocontext\ -conf\ c://php//jsl.default.conf\ -process\ %
"autocmd BufNewFile,BufRead,BufWinEnter *.js set makeprg=c://php//jsl\ -nologo\ -nofilelisting\ -nosummary\ -nocontext\ -conf\ c://php//jsl.default.conf\ -process\ %
autocmd BufNewFile,BufRead,BufWinEnter *.js set makeprg=C://PHP//jsl\ -nologo\ -nofilelisting\ -nosummary\ -nocontext\ -conf\ C://PHP//jsl.default.conf\ -process\ %


autocmd BufNewFile,BufRead,BufWinEnter *.js set errorformat=%f(%l):\ %m
"replace
autocmd BufNewFile,BufRead,BufWinEnter *.js imap ppp replace(//,"");<Esc>T(<Right><Right>i
autocmd BufNewFile,BufRead,BufWinEnter *.js imap pp match(//)<Esc>T(<Right>i
"console.debug - echo
autocmd BufNewFile,BufRead,BufWinEnter *.js imap ee <Esc>A<Enter>if (window.console) console.info("#<C-v>: "+<C-v>);<Esc>T(<Right>iPREfix
autocmd BufNewFile,BufRead,BufWinEnter *.js imap <silent><M-e> <Esc>A<Enter>if (window.console) console.warn("#<C-v>: "+<C-v>);<Esc>T(iPREfix
autocmd BufNewFile,BufRead,BufWinEnter *.js imap PREfix <C-o>:s/\m[\'/[\"/g<CR><C-o>:s/\m\']/\"]/g<CR>
"console.group('#<C-v>: ');

autocmd BufNewFile,BufRead,BufWinEnter *.js nmap <silent><M-p> A<Enter>if (window.console) console.dir(<C-v>);
autocmd BufNewFile,BufRead,BufWinEnter *.js imap <silent><M-p> <Esc>A<Enter>if (window.console) console.dir(<C-v>);
autocmd BufNewFile,BufRead,BufWinEnter *.js nmap <silent><M-e> A<Enter>if (window.console) console.warn("#<C-v>: "+<C-v>);
autocmd BufNewFile,BufRead,BufWinEnter *.js imap congr <Esc>A<Enter>if (window.console) console.group("#<C-v>");
autocmd BufNewFile,BufRead,BufWinEnter *.js imap congrn <Esc>A<Enter>if (window.console) console.groupEnd("#<C-v>");

"Alt + .
autocmd BufNewFile,BufRead,BufWinEnter *.js imap <silent><M-.> ++<LEFT>
autocmd BufNewFile,BufRead,BufWinEnter *.js imap <silent>ff $.each(<C-v>, function(_title,_value){<Enter>});<Up><End>
autocmd BufNewFile,BufRead,BufWinEnter *.js nmap <silent>ff $.each(<C-v>, function(_title,_value){<Enter>});<Up><End>
"autocmd BufNewFile,BufRead,BufWinEnter *.js imap <silent>ff jea<M-f>
"autocmd BufNewFile,BufRead,BufWinEnter *.js nmap <silent>ff ijea<M-f>

autocmd BufNewFile,BufRead,BufWinEnter *.js imap <silent>?? / /<script type="text/javascript"><Enter>jQuery(document).ready(function(){  <S-Enter><Enter>});<Enter>//</script><Up><Up><Tab>
autocmd BufNewFile,BufRead,BufWinEnter *.js imap <silent>for( for (i=0;i;i++){<Enter>});<Up><End>
"Ctrl -      '' => ''
autocmd BufNewFile,BufRead,BufWinEnter *.js imap <silent> ''<Space>:<Space>'',<Esc>3T'<Left>i
"Ctrl =      => 
autocmd BufNewFile,BufRead,BufWinEnter *.js imap <silent><M--> <Space>:<Space>
"Alt+-       ==''
autocmd BufNewFile,BufRead,BufWinEnter *.js imap <silent><C-=> ''===<C-v><Esc>2T'i
"Alt+=       = ;
autocmd BufNewFile,BufRead,BufWinEnter *.js imap <silent><M-=> <c-o>A=<Space>;<Left>
"Alt-{ { }
autocmd BufNewFile,BufRead,BufWinEnter *.js imap <silent><m-{> <End>{<Enter>}<Up><End><Esc>a
autocmd BufNewFile,BufRead,BufWinEnter *.js imap <silent>ii if (){<Enter>}<Up><End><Esc>T(i
"autocmd BufNewFile,BufRead,BufWinEnter *.js imap <silent>ii if<M-f>
"tt length
autocmd BufNewFile,BufRead,BufWinEnter *.js imap tt .length
"zz = split
autocmd BufNewFile,BufRead,BufWinEnter *.js imap zz .split('');<Esc>T(<Right>i

"Alt+Shift+- !=
autocmd BufNewFile,BufRead,BufWinEnter *.js imap <silent>ъ !==

"Copy class.class.class.class
autocmd BufNewFile,BufRead,BufWinEnter *.js imap ну <c-o>ve<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.js imap нуну <c-o>ve<S-left>e<S-left>e<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.js imap нунуну <c-o>ve<S-left>e<S-left>e<S-left>e<S-left>e<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.js imap нунунуну <c-o>ve<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.js imap нунунунуну <c-o>ve<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.js imap нунунунунуну <c-o>ve<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.js nmap ну ve<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.js nmap нуну ve<S-left>e<S-left>e<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.js nmap нунуну ve<S-left>e<S-left>e<S-left>e<S-left>e<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.js nmap нунунуну ve<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.js nmap нунунунуну ve<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.js nmap нунунунунуну <c-o>ve<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<S-left>e<C-c>

"Alt-4 
"autocmd BufNewFile,BufRead,BufWinEnter *.js imap <m-4> ("#")<Esc>T#<left>a
"autocmd BufNewFile,BufRead,BufWinEnter *.js nmap <m-4> a("#")<Esc>T#<left>a
autocmd BufNewFile,BufRead,BufWinEnter *.js imap <m-4> $<M-f>
autocmd BufNewFile,BufRead,BufWinEnter *.js nmap <m-4> i$<M-f>

"autocmd BufNewFile,BufRead,BufWinEnter *.js imap <C-f> function (){<Enter>}<Up><End><Esc>T(<Left><Left>a
"autocmd BufNewFile,BufRead,BufWinEnter *.js nmap <C-f> <Esc>function(){<Enter>}<Up><End><Esc>T(<Left><Left>a
autocmd BufNewFile,BufRead,BufWinEnter *.js imap <C-f> fun<M-f>
autocmd BufNewFile,BufRead,BufWinEnter *.js nmap <C-f> ifun<M-f>
autocmd BufNewFile,BufRead,BufWinEnter *.js nmap imap Ж value
autocmd BufNewFile,BufRead,BufWinEnter *.js nmap imap Т title
autocmd BufNewFile,BufRead,BufWinEnter *.js inoremap т <C-R>=MyThisOrCompleteJS()<CR>
autocmd BufNewFile,BufRead,BufWinEnter *.js nnoremap т <C-R>=MyThisOrCompleteJS()<CR>
autocmd BufNewFile,BufRead,BufWinEnter *.js call g:XPTaddBundle('javascript', 'jquery')