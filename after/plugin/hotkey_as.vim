autocmd BufNewFile,BufRead,BufWinEnter *.as nmap <silent><F12> :!ctag_actionscript3.cmd<CR><CR>
autocmd BufNewFile,BufRead,BufWinEnter *.as imap <silent><F12> <Esc>:!ctag_actionscript3.cmd<CR><CR>

autocmd BufNewFile,BufRead,BufWinEnter *.as setlocal include=\\\(import\\\)\\\(_once\\\)\\\?
autocmd BufNewFile,BufRead,BufWinEnter *.as setlocal iskeyword+=$
autocmd BufNewFile,BufRead,BufWinEnter *.as setlocal formatoptions-=t
autocmd BufNewFile,BufRead,BufWinEnter *.as setlocal formatoptions+=croql
autocmd BufNewFile,BufRead,BufWinEnter *.as setlocal comments=sr:/*,mb:*,ex:*/,://,b:#
autocmd BufNewFile,BufRead,BufWinEnter *.as setlocal define=define
autocmd BufNewFile,BufRead,BufWinEnter *.as setlocal cindent
autocmd BufNewFile,BufRead,BufWinEnter *.as setlocal cinkeys=0{,0},:,!^F,o,O,e
autocmd BufNewFile,BufRead,BufWinEnter *.as setlocal cinoptions=:1s,p1s,t0,)40,*40
autocmd BufNewFile,BufRead,BufWinEnter *.as setlocal cinwords=if,elseif,else,while,do,for,foreach,switch,case
autocmd BufNewFile,BufRead,BufWinEnter *.as setlocal matchpairs=(:),{:},[:]

autocmd BufNewFile,BufRead,BufWinEnter *.mxml set filetype=mxml
autocmd BufNewFile,BufRead,BufWinEnter *.as set filetype=actionscript
autocmd BufNewFile,BufRead,BufWinEnter *.as hi Function ctermfg=15 ctermbg=16
autocmd BufNewFile,BufRead,BufWinEnter *.as hi Operator ctermfg=10 ctermbg=16
autocmd BufNewFile,BufRead,BufWinEnter *.as hi asType ctermfg=9 ctermbg=16
autocmd BufNewFile,BufRead,BufWinEnter *.as hi asConstant ctermfg=9 ctermbg=16
autocmd BufNewFile,BufRead,BufWinEnter *.as hi as3Packages ctermfg=9 ctermbg=16
autocmd BufNewFile,BufRead,BufWinEnter *.as hi as3Constants ctermfg=9 ctermbg=16
autocmd BufNewFile,BufRead,BufWinEnter *.as hi as3Classes ctermfg=5 ctermbg=16
autocmd BufNewFile,BufRead,BufWinEnter *.as hi actionScriptMethods ctermfg=13 ctermbg=16
autocmd BufNewFile,BufRead,BufWinEnter *.as hi HTML_href ctermfg=darkblue ctermbg=darkgray

autocmd BufNewFile,BufRead,BufWinEnter *.as set dict+=$HOME.\VIMFILES\DICT\AS3.DIC
" autocomplete from
autocmd BufNewFile,BufRead,BufWinEnter *.as set complete=""
" current buffer
autocmd BufNewFile,BufRead,BufWinEnter *.as set complete+=.
" from tags
autocmd BufNewFile,BufRead,BufWinEnter *.as set complete+=t
" dictionary
autocmd BufNewFile,BufRead,BufWinEnter *.as set complete+=k
" from other open buffers/tabs
autocmd BufNewFile,BufRead,BufWinEnter *.as set complete+=b
autocmd BufNewFile,BufRead,BufWinEnter *.as set tags +=ctags

" automatically open and close the popup menu / preview window
autocmd BufNewFile,BufRead,BufWinEnter *.as au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
autocmd BufNewFile,BufRead,BufWinEnter *.as set completeopt=menuone,menu,longest,preview
" autocomplete options
"autocmd BufNewFile,BufRead,BufWinEnter *.as set completeopt-=preview
"autocmd BufNewFile,BufRead,BufWinEnter *.as set completeopt+=longest
autocmd BufNewFile,BufRead,BufWinEnter *.as set mps-=[:]

autocmd BufNewFile,BufRead,BufWinEnter *.as set csprg=cscope.exe
autocmd BufNewFile,BufRead,BufWinEnter *.as let g:CCTreeDisplayMode = 3
autocmd BufNewFile,BufRead,BufWinEnter *.as let g:CCTreeWindowVertical = 0
autocmd BufNewFile,BufRead,BufWinEnter *.as highlight CCTreeHiSymbol  gui=bold guibg=darkblue guifg=peachpuff  
autocmd BufNewFile,BufRead,BufWinEnter *.as highlight CCTreeHiMarkers  gui=bold guifg=darkgreen guibg=lightyellow

"set keywordprg=dictionary
" actionscript language
autocmd BufNewFile,BufRead,BufWinEnter *.as let tlist_actionscript_settings = 'actionscript;c:class;f:method;p:property;v:variable'

autocmd BufNewFile,BufRead,BufWinEnter *.as setlocal ofu=actionscriptcomplete#Complete

"---------------mxmlc-----------
"setlocal makeprg=c://php//mxmlc.cmd\ %
"setlocal errorformat=\%f(%l):\ col:\ %c\ Error:\ %m
"---------------SWFTools--------
autocmd BufNewFile,BufRead,BufWinEnter *.as setlocal makeprg=c://php//as3comp.cmd\ %
autocmd BufNewFile,BufRead,BufWinEnter *.as setlocal errorformat=\%f:%l:%c:\ %m
"LoadImage.as:3:7: error: syntax error, unexpected import
autocmd BufNewFile,BufRead,BufWinEnter *.as omap <C-q> <Esc>
autocmd BufNewFile,BufRead,BufWinEnter *.as nmap <C-q> i
autocmd BufNewFile,BufRead,BufWinEnter *.as vmap <C-q> i
autocmd BufNewFile,BufRead,BufWinEnter *.as imap <silent><C-q> <Esc>:w\|:!flv_run.cmd %<CR><CR>\|:call PHPsynCHK()<Enter>i
autocmd BufNewFile,BufRead,BufWinEnter *.as nmap <M-p> A<Enter> trace('@@INFO@@#<C-v>:'+);<Esc>T+i<C-v><Esc>A<Home>PREfix
autocmd BufNewFile,BufRead,BufWinEnter *.as imap <M-p> <Esc>A<Enter> trace('@@INFO@@#<C-v>:'+);<Esc>T+i<C-v><Esc>A<Home>PREfix
autocmd BufNewFile,BufRead,BufWinEnter *.as imap PREfix <C-o>:s/\m[\'/[\"/g<CR><C-o>:s/\m\']/\"]/g<CR>
autocmd BufNewFile,BufRead,BufWinEnter *.as nmap <M-e> A<Enter> trace('@@@WARNING<C-v>:'+);<Esc>T+i<C-v><Esc>A<Home>PREfix
autocmd BufNewFile,BufRead,BufWinEnter *.as imap <M-e> <Esc>A<Enter> trace('@@WARNING@@<C-v>:'+);<Esc>T+i<C-v><Esc>A<Home>PREfix
autocmd BufNewFile,BufRead,BufWinEnter *.as imap ?? <Enter><Home><Del><Del><Enter><Up><End><Enter>package {<End><Enter>import flash.display.MovieClip;<Enter>import flash.events.MouseEvent;<Enter>public class extends MovieClip {<End><Enter>public function() {

autocmd BufNewFile,BufRead,BufWinEnter *.as imap <M-.> ..<LEFT>
"Ctrl -      '' => ''
autocmd BufNewFile,BufRead,BufWinEnter *.as imap  ''<Space>=><Space>'',<Esc>3T'<Left>i
"Ctrl =      => 
autocmd BufNewFile,BufRead,BufWinEnter *.as imap <M--> <Space>=><Space>
"Alt+-       ==''
autocmd BufNewFile,BufRead,BufWinEnter *.as imap <C-=> ==''<Esc>T'i
"Alt+=       = ;
autocmd BufNewFile,BufRead,BufWinEnter *.as imap <M-=> <c-o>A=<Space>;<Left>
"Alt+Shift+- !=
autocmd BufNewFile,BufRead,BufWinEnter *.as imap ъ !=
autocmd BufNewFile,BufRead,BufWinEnter *.as imap ?? <?php<S-Enter><Enter>?><Up>
autocmd BufNewFile,BufRead,BufWinEnter *.as imap ii if (){<Esc>T(i
""imap ff foreach ( as ){<Esc>T(i
autocmd BufNewFile,BufRead,BufWinEnter *.as imap frr for ($i=0;$i;$i++){<Esc>T(i
autocmd BufNewFile,BufRead,BufWinEnter *.as imap <C-f> <Esc>^iif (<C-v>)<C-{><Esc>A}<Esc>T(i
autocmd BufNewFile,BufRead,BufWinEnter *.as imap tt strlen()<Esc>T(i
"imap ff foreach ( <Esc><C-v>i as  <Esc><C-v>i){<Left>
autocmd BufNewFile,BufRead,BufWinEnter *.as imap ff foreach ( <Esc><C-v>i as  <Esc><C-v>i_title =>  <Esc><C-v>i_value){<Left><c-o>3T<space>
autocmd BufNewFile,BufRead,BufWinEnter *.as imap zz split('',);<Esc>T,i
autocmd BufNewFile,BufRead,BufWinEnter *.as imap ee trace

"C-Insert
autocmd BufNewFile,BufRead,BufWinEnter *.as imap ну <c-o>ve<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.as imap нуну <c-o>vf]<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.as imap нунуну <c-o>v2f]<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.as imap нунунуну <c-o>v3f]<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.as imap нунунунуну <c-o>v4f]<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.as nmap ну ve<C-c>i
autocmd BufNewFile,BufRead,BufWinEnter *.as nmap нуну vf]<C-c>i
autocmd BufNewFile,BufRead,BufWinEnter *.as nmap нунуну v2f]<C-c>i
autocmd BufNewFile,BufRead,BufWinEnter *.as nmap нунунуну v3f]<C-c>i
autocmd BufNewFile,BufRead,BufWinEnter *.as nmap нунунунуну v4f]<C-c>i

autocmd BufNewFile,BufRead,BufWinEnter *.as imap inc include('');<Left><Left><Left>

autocmd BufNewFile,BufRead,BufWinEnter *.as imap  break;
autocmd BufNewFile,BufRead,BufWinEnter *.as imap aa array();<Esc>T(i
autocmd BufNewFile,BufRead,BufWinEnter *.as imap nn "\r\n"
autocmd BufNewFile,BufRead,BufWinEnter *.as imap foo <C-v> = fopen( <Esc><C-v>i,'w');
autocmd BufNewFile,BufRead,BufWinEnter *.as imap fpu fputs( <Esc><C-v>i,);<Esc>T)<LEFT>i
autocmd BufNewFile,BufRead,BufWinEnter *.as imap ppp preg_replace("//","",);<Esc>T(<Right><Right>i
autocmd BufNewFile,BufRead,BufWinEnter *.as imap pp preg_match("//",,$tmp);<Esc>T(<Right><Right>i
autocmd BufNewFile,BufRead,BufWinEnter *.as imap gg is<Esc>aset()<Left>
autocmd BufNewFile,BufRead,BufWinEnter *.as imap <M-s> substr_count(,)<Esc>T(i
autocmd BufNewFile,BufRead,BufWinEnter *.as imap Ж _value
autocmd BufNewFile,BufRead,BufWinEnter *.as imap Т _title
"autocmd BufNewFile,BufRead,BufWinEnter *.as imap т $this->
autocmd BufNewFile,BufRead,BufWinEnter *.as inoremap т <C-R>=MyThisOrCompletePHP()<CR>
autocmd BufNewFile,BufRead,BufWinEnter *.as nnoremap т <C-R>=MyThisOrCompletePHP()<CR>

autocmd BufNewFile,BufRead,BufWinEnter *.as inoremap { {<Enter>}<Up><End><Esc>i