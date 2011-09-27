" Better indent support for PHP by making it possible to indent HTML sections
" as well.
if exists("b:did_indent")
  finish
endif

autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp nmap <silent><F12> :!@ctag_php.cmd<CR><CR>
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap <silent><F12> <Esc>:!@ctag_php.cmd<CR><CR>

autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp omap <C-q> <Esc>
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp nmap <C-q> i
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp vmap <C-q> i
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap <silent><C-q> <Esc>:w\|:!php_debug_start.cmd %<CR><CR>\|:call PHPsynCHK()<Enter>i

autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp setlocal include=\\\(require\\\|include\\\)\\\(_once\\\)\\\?
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp setlocal iskeyword+=$
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp setlocal formatoptions-=t
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp setlocal formatoptions+=croql
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp setlocal comments=sr:/*,mb:*,ex:*/,://,b:#
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp setlocal define=define
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp compiler php
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp setlocal cindent
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp setlocal cinkeys=0{,0},:,!^F,o,O,e
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp setlocal cinoptions=:1s,p1s,t0,)40,*40
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp setlocal cinwords=if,elseif,else,while,do,for,foreach,switch,case
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp setlocal matchpairs=(:),{:},[:]
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp set omnifunc=phpcomplete#CompletePHP

autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp set dict+=~\VIM\VIMFILES\DICT\bitrix.dic
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp set dict+=~\VIM\VIMFILES\DICT\bitrix_comp.dic
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp set dict+=~\VIM\VIMFILES\DICT\PHP.DIC
"autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp setlocal complete+=k
"autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp setlocal dictionary+=$HOME/.vimfiles/dic/phpfunclist
"autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp setlocal dictionary+=$HOME/.vimfiles/dic/phpproto
"autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp setlocal dictionary+=$HOME/.vimfiles/dic/funclist

autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp set filetype=php

autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap <M-.> ..<LEFT>
"Ctrl -      '' => ''
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap  ''<Space>=><Space>'',<Esc>3T'<Left>i
"Ctrl =      => 
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap <M--> <Space>=><Space>
"Alt+-       ==''
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap <C-=> ==''<Esc>T'i
"Alt+=       = ;
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap <M-=> <c-o>A=<Space>;<Left>
"Alt+Shift+- !=
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap ﬂ !=
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap ?? <?php<S-Enter><Enter>?><Up>
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap ?+ <?=?><Left><Left>
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap ii if (){<Esc>T(i
""imap ff foreach ( as ){<Esc>T(i
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap frr for ($i=0;$i;$i++){<Esc>T(i
"autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap <C-f> <Esc>^iif (<C-v>)<C-{><Esc>A}<Esc>T(i
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap <C-f> fun<M-f>
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp nmap <C-f> ifun<M-f>

autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap tt strlen()<Esc>T(i
"imap ff foreach ( <Esc><C-v>i as  <Esc><C-v>i){<Left>
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap ff foreach ( <Esc><C-v>i as  <Esc><C-v>i_title => <Esc><C-v>i_value){<Left><c-o>3T<space>
"autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap ff foreach ( <Esc><C-v>i as  <Esc><C-v>i_title =>  <Esc><C-v>i_value){<Left><c-o>3T<space>
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap zz =split('',);<Esc>T,i
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap ee echo 
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp nmap <M-p> A<Enter>if(function_exists(print_r2))$query[ '#<C-v>' <RIGHT>=<C-v>;else echo '<pre>'.print_r().'</pre>';<Esc>T(i<C-v>PREfix
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap <M-p> <Esc>A<Enter>if(function_exists(print_r2))$query[ '#<C-v>' <RIGHT>=<C-v>;else echo '<pre>'.print_r().'</pre>';<Esc>T(i<C-v>PREfix
"autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp nmap <M-p> A<Enter>echo '<pre>#<C-v>: '; if(function_exists(print_r2))print_r2(<C-v>);else print_r(); echo '</pre>';<Esc>T(i<C-v>PREfix
"autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap <M-p> <Esc>A<Enter>echo '<pre>#<C-v>: '; if(function_exists(print_r2))print_r2(<C-v>);else print_r(); echo '</pre>';<Esc>T(i<C-v>PREfix
"autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp nmap <M-p> A<Enter>echo "<pre style=\"background-color:white;z-index:1000;position:reletive;\">".'#<C-v>: '; print_r(<C-v>); echo '</pre>';<Esc>T(iPREfix
"autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap <M-p> <Esc>A<Enter>echo "<pre style=\"background-color:white;z-index:1000;position:reletive;\">".'#<C-v>: '; print_r(<C-v>); echo '</pre>';<Esc>T(iPREfix
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap PREfix <C-o>:s/\m[\'/[\"/g<CR><C-o>:s/\m\']/\"]/g<CR>
"font-family:12px Arial;white-space:pre-wrap;white-space:-moz-pre-wrap;white-space:-o-pre-wrap;white-space:-pre-wrap;word-wrap:break-word
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap <M-e> <Esc>A<Enter>echo '#<C-v>: <pre>'; if(function_exists(print_r2)) print_r2(<C-v>); else print_r(<C-v>);echo "</pre><br />\r\n";<Esc>A<Home>PREfix
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp nmap <M-e> A<Enter>echo '#<C-v>: <pre>'; if(function_exists(print_r2)) print_r2(<C-v>); else print_r(<C-v>); echo "</pre><br />\r\n";<Esc>A<Home>PREfix
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap <C-e> <Esc>A<Enter>echo '#<C-v>: '; echo(<C-v>); echo "<br />\r\n";<Esc>A<Home>PREfix
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp nmap <C-e> A<Enter>echo '#<C-v>: '; echo(<C-v>); echo "<br />\r\n";<Esc>A<Home>PREfix

autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap FB <Esc>A<Enter>fb::info(<C-v>,'#<C-v>');<Esc>A<Home>PREfix
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp nmap FB A<Enter>fb::info(<C-v>,'#<C-v>');<Esc>A<Home>PREfix
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp nmap FGB fb::group('#<C-v>',array('Collapsed' => true,'Color' => 'gray'));<CR>fb::groupEnd('#<C-v>');<Up>
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap FGB fb::group('#<C-v>',array('Collapsed' => true,'Color' => 'gray'));<CR>fb::groupEnd('#<C-v>');<Up>
"C-Insert
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap Œ’ <c-o>ve<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap Œ’Œ’ <c-o>vf]<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap Œ’Œ’Œ’ <c-o>v2f]<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap Œ’Œ’Œ’Œ’ <c-o>v3f]<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap Œ’Œ’Œ’Œ’Œ’ <c-o>v4f]<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp nmap Œ’ ve<C-c>i
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp nmap Œ’Œ’ vf]<C-c>i
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp nmap Œ’Œ’Œ’ v2f]<C-c>i
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp nmap Œ’Œ’Œ’Œ’ v3f]<C-c>i
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp nmap Œ’Œ’Œ’Œ’Œ’ v4f]<C-c>i
" œÓ‚ÂÍ‡ ÒËÌÚ‡ÍÒËÒ‡ PHP
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp set makeprg=c://php//php\ -q\ -l\ %
"autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp set makeprg=C://DOCUME~1////PHP//php\ -n\ -q\ -l\ %
"autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp set makeprg=c://php//php\ -q\ -l\ %
"
" ‘ÓÏ‡Ú ‚˚‚Ó‰‡ Ó¯Ë·ÓÍ PHP
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp set errorformat=%m\ in\ %f\ on\ line\ %l

autocmd BufNewFile,BufRead,BufWinEnter *.cphp set makeprg=phpcheck\ %
autocmd BufNewFile,BufRead,BufWinEnter *.cphp set errorformat=%f\:%l\	%m

autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap inc include('');<Left><Left><Left>

autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap  break;
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap aa array()<Esc>T(i
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap nn "\r\n"
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap foo <C-v> = fopen( <Esc><C-v>i,'w');
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap fpu fputs( <Esc><C-v>i,);<Esc>T)<LEFT>i
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap ppp preg_replace("//","",);<Esc>T(<Right><Right>i
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap pp preg_match("//",,$tmp);<Esc>T(<Right><Right>i
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap gg is<Esc>aset()<Left>
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap <M-s> substr_count(,)<Esc>T(i
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap ˆ _value
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap Ù _title
"autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp imap ‘ $this->
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp inoremap ‘ <C-R>=MyThisOrCompletePHP()<CR>
autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp nnoremap ‘ <C-R>=MyThisOrCompletePHP()<CR>


autocmd BufNewFile,BufRead,BufWinEnter *.php,*.cphp inoremap { {<Enter>}<Up><End><Esc>i
