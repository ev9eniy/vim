"`---------------------------------------- Rus Spellcheck ---------------------------------------- 
"Для Title для битрикса 
let &titlestring = substitute(expand("%:h"), '.*\\', "", "g")."\\".expand("%:t")
"autocmd BufNewFile,BufRead,BufWinEnter,BufWritePre  * let &titlestring = substitute(expand("%:h"), '.*\\', "", "g")."\\".expand("%:t")
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
  set title
endif


set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
setlocal spell spelllang=ru_yo,en_us
set spell!
imap :!setxkbmap us:!setxkbmap us,ru
nmap :!setxkbmap us:!setxkbmap us,ru
"по кнопке Ж (двоеточие) утилитка setxkbmap (линуксовая) выставляет английскую раскладку (сначала удаляя русскую. а то не переключается, а потом снова ее добавляя). Топорно, но универсальное решение. Возможно, что-то подобное можно и под винду. 
" Switches spelling
menu Spl.next ]s
menu Spl.prev [s
menu Spl.word_good zg
menu Spl.word_wrong zw
menu Spl.word_ignore zG
"imap <F7> <C-6>
"nmap <F7> <C-6>
imap <F7> <Esc>:set spell!<CR><Esc>i
nmap <F7> :set spell!<CR><Esc>i

"imap <C-F7> <Esc>:emenu Spl.<TAB>
"nmap <C-F7> :emenu Spl.<TAB>
imap Оd <Esc>vG=<CR>
nmap Оd vG=<CR>

"`---------------------------------------- Setup ---------------------------------------- 
"Cамо пересчитывает vimrc при изменении оного:
"autocmd! bufwritepost ~/.hotkey execute "normal! :source ~/.vimrc"
autocmd! bufwritepost :source $HOME."\after\plugin\hotkey.vim"
if has('cscope')
    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out  
    " else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose  
endif

set timeoutlen=200 "Чтобы напибрать спокойно текст ff, tt,zzz итд

"--------------------AUTO SAVE -------------------------
"When you start reading a file, set a buffer variable to the current time: 
"au BufRead,BufNewFile * let b:start_time=localtime()

"Set a CursorHold event to check to see if enough time has elapsed since the last save and save if not: 
"au CursorHold * call UpdateFile()

"Define a function! to save the file if needed: 
" only write if needed and update the start time after the save
"function! UpdateFile()
"  if ((localtime() - b:start_time) >= 20)
"    update
"    let b:start_time=localtime()
"  else
"    echo "Only " . (localtime() - b:start_time) . " seconds have elapsed so far."
"  endif
"endfunction
"
""Reset the start time explicitly after each save. 
"au BufWritePre * let b:start_time=localtime()



"loose focus auto wirte
:au FocusLost * :wa
"then whenever the mouse leaves the gvim window, the edited file will be saved to disk. 
":call FocusLost_SaveFiles()
" Put this in vimrc, add custom commands in the function.
"function! FocusLost_SaveFiles()
"  exe ":au FocusLost" expand("%") ":wa"
"endfunction

"au CursorHold * call UpdateFile()
"au CursorHold * w!

"function! UpdateFile()
"  if ((localtime() - b:start_time) >= 1)
"     silent w
"    update
"    let b:start_time=localtime()
"  else
"    echo "Only " . (localtime() - b:start_time) . " seconds have elapsed so far."
"  endif
"endfunction

"set updatetime=90000
"set updatecount=90000
"set nottimeout
"--------------------AUTO SAVE -------------------------

"To decrease message size, use the 'shortmess' option. Add the following line to your vimrc:
set shortmess=a
"This will use abbreviations for status messages to make lines shorter. (There are several other flags for 'shortmess' that can shorten messages even more. :help 'shortmess')
"To give more space for displaying messages, you can increase the height of the command line to 2 or greater:
set cmdheight=2
"The default command height is 1. Increasing cmdheight will allow more room for commands, although it will take some space away from editing.
":silent !echo Hello
"If the command generates any output, you may need to manually refresh the screen once you return to Vim (by typing Ctrl-L or entering :redraw!). (If you're running a GUI version of Vim, :silent may keep you from seeing any output from the command at all!)
"[edit] 


set modifiable 
set write
filetype plugin on
filetype indent on
behave mswin
set nocp "omni
colorscheme dn     "меням цветовую схему
syntax on               " включить подсветку синтаксиса.
let php_sql_query=1 "Подстветка SQL внутри PHP строк
let php_htmlInStrings=1 "Подстветка HTML внутри PHP строк
let php_baselib = 1 "Подстветка базовых функций PHP
set nomagic "Нотации регулярных выражений
set autoread "Если файл изменился, автоматически обновить буфер
set autowriteall "Записывать всё This will save the file when you switch buffers, make it etc. See the appropriate :help pages for the exact details.
set t_Co=256 "Если ваш терминал поддерживает 256 цветов (вроде все новые версии на данный момент), лучше это поставить:
set autoindent  
"set autoindent  
"set smartindent      
set nocompatible " Включаем несовместимость настроек с Vi (ибо Vi нам и не понадобится).  
set shiftwidth=2
set softtabstop=2
set tabstop=2
set ts=2 "задать размер табуляции
"set nu "Включаем нумерацию строк
"set nowrap   "не разрывать строку
set scrolloff=10 "сколько строк вверху и внизу экрана показывать при скроллинге. Очень удобно.
set sidescroll=10        "прокрутка вправо/влево когда строка заежает за край и вы по ней ползаете
set scrolljump=10 "Теперь нет необходимости передвигать курсор к краю экрана, чтобы подняться в режиме редактирования
set linebreak "break long lines on a caracter set in 'breakat'
set nowrap "перенос строк
set showbreak=•\•\•\•\> "Если вам не хочется, чтобы перенесенные строки мешались с номерами строк, установите опцию 'showbreak' в 8 пробелов:
"set showbreak=|\|\|\> "Если вам не хочется, чтобы перенесенные строки мешались с номерами строк, установите опцию 'showbreak' в 8 пробелов:
set listchars=tab:\¦\ "SeeTab: toggles between showing tabs and using standard listchars
"set listchars=tab:\¦\ "SeeTab: toggles between showing tabs and using standard listchars
"hi NonText			guifg=#0030ff		ctermfg=Orange "Подцветка
set noequalalways "всегда делать активное окно максимального размера
set iminsert=0 "по умолчанию - латинская раскладка
set noswapfile "Отключить создание файлов бекапа и свапа
"set fileencodings=cp1251 | utf-8 "Список используемых кодировок для автоматического их определения
set fileencodings=utf-8
"Здесь мы перечисляем какие символы и их коды Vim должен считать за буквы. Диапазон 48-57 
"соответствует цифрам, 128-175 - части русских букв в кодировке DOS (866), 
"а 192-255 охватывает оставшиеся русские буквы в кодировке DOS и все русские буквы в кодировке Windows-1251. 
"set iskeyword=:,@,a-z,A-Z,29,30,36,46,48-57,_,128-175,192-255 
"Как сделать что бы при нажатии на Delete в конце строки к ней присоединялась следующая
autocmd BufRead * '" 
"allow to use backspace instead of "x"
set backspace=2  "BS and Del in insert mode allowed and go thro
"set backspace=indent,eol,start whichwrap+=<,>,[,] "Для нормальной работы backspace в режиме вставки:
set list
set formatoptions=tcroqln1  "break text and comments after small words, recognize numbered lists and do not break intentionally long lines
set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P "Формат строки состояния
"set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P "Формат строки состояния
set laststatus=2
"set listchars=tab:\|\ "SeeTab: toggles between showing tabs and using standard listchars
"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h "help file flag
set statusline+=%y "filetype
set statusline+=%r "read only flag
set statusline+=%m "modified flag
set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P "Формат строки состояния


set wildmenu "Более удобное дополнение 
"set wildmode=list:longest "make cmdline tab completion similar to bash.
"При нажатии Tab имя файла дополнится до наибольшего совпадения и выведет список альтернатив.
"set wildmode=list:longest,full

set clipboard=unnamed "Приравниваем регистр \"регистру \"*

"set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,э',яz,чx,сc,мv,иb,тn,ьm,б\,,ю.,ё`
set langmap=оj "Таким образом получаем: 1. Скопировали что-то в винде -> вставляем в vim по <p> и иже с ними.
"Скопировали в vim'е клавишей <y> (и т.п.) -> Вставляем в винде нормально. 
set noignorecase "Учитывать регистр букв при поиске
set incsearch           "при поиске перескакивать на найденный текст в процессе набора строки
set showmatch matchtime=3 "- when bracket is inserted, briefly jump to the matching one
"setlocal list "Включить подсветку невидимых символов
"Настройка подсветки невидимых символов
"setlocal listchars=tab:·\ ,trail:·
set listchars+=precedes:<,extends:>     "показывать символы > или < если есть, что слева/справа строки
set showmatch "проверка скобок
set history=500 "увеличение истории команд
set undolevels=1000
"set backup " включить сохранение резервных копий
"function! BackupDir() " сохранять умные резервные копии ежедневно
"	let l:backupdir='Q:\' 	" определим каталог для сохранения резервной копии
"	if !isdirectory(l:backupdir) 	" если каталог не существует, создадим его рекурсивно
"		call mkdir(l:backupdir, 'p', 0700)
"	endif 
"	let &backupdir=l:backupdir	" переопределим каталог для резервных копий
"	let &backupext=strftime('%Y-%m-%d')	" переопределим расширение файла резервной копии
"endfunction
"autocmd! bufwritepre * call BackupDir() " выполним перед записью буффера на диск
set novisualbell " Выключаем надоедливый звонок
set t_vb= 
set mouse=a
set mousemodel=popup
set hidden " Не выгружать буфер, когда переключаемся на другой Это позволяет редактировать несколько файлов в один и тот же момент без необходимости сохранения каждый раз когда переключаешься между ними
set fo+=cr " Fix <Enter> for comment
set sessionoptions=curdir,buffers,tabpages " Опции сесссий
set updatecount=30 "disk after 30 keystrokes to write swap file


"---------------------------------------- Tags ---------------------------------------- 
set tags=./tags,tags
"let php_noShortTags = 1 "Не использовать короткие теги PHP для поиска PHP блоков
" Автозавершение слов
set complete=""
" Из текущего буфера
set complete+=.
" Из других открытых буферов
set complete+=b
" из тегов 
set complete+=t
" dictionary
set complete+=k

"set keywordprg=dictionary
let tlist_php_settings = 'php;c:class;f:function' " v:variable Что глядеть в тагах
" Настройки для Tlist (показвать только текущий файл в окне навигации по коду)
"let g:Tlist_Show_One_File = 1
"set completeopt-=preview
"set completeopt+=longest
"set mps-=[:]
"---------------------------------------- Tags ---------------------------------------- 

"---------------------------------------- Folding ---------------------------------------- 
autocmd BufNewFile,BufRead,BufWinEnter *.jch,*.php,*.js let php_folding = 0
"set foldcolumn=4 "отступ декоративный
"let php_folding = 0 "Закрывать фолдинги автоматически (мне показалось очень удобно)
autocmd BufNewFile,BufRead,BufWinEnter *.jch,*.php,*.js set foldmethod=expr
"set foldmethod=manual
set foldminlines=2
set foldnestmax=5 "deepest fold is 3 levels. set nofoldenable dont fold by default. 
set nofoldenable        "dont fold by default
autocmd BufNewFile,BufRead,BufWinEnter *.jch,*.php,*.js set foldexpr=getline(v:lnum-1)=~'^\\s*$'&&getline(v:lnum)=~'\\S'?'>1':1
"С плюсом вначале 
"set foldtext='+'.v:folddashes.substitute(GetFirstLineWithChars(),'\\\/\\\/\\\|\\*\\\|\\*\\\|{{{\\d\\=','','g')
autocmd BufNewFile,BufRead,BufWinEnter *.jch,*.php,*.js set foldtext=substitute(GetFirstLineWithChars(),'\\\/\\\/\\\|\\*\\\|\\*\\\|{{{\\d\\=','','g')
function! GetFirstLineWithChars()
	let line_num = 0
	let charline = matchstr(getline(v:foldstart), '.*')
	"let charline = matchstr(getline(v:foldstart), '[a-zA-Z][a-zA-Z ]*')
	while strlen(charline) == 0
		let line_num = line_num + 1
		let charline = matchstr(getline(v:foldstart + line_num), '.*')
		"let charline = matchstr(getline(v:foldstart + line_num), '[a-zA-Z][a-zA-Z ]*')
	endw
	return charline
endfunction
hi folded guibg=black guifg=yellow gui=bold
set fillchars=|
autocmd BufWinLeave *.* mkview "And as an added bonus, for those new to text folding, add this to your .vimrc file too
autocmd BufWinEnter *.* silent loadview 
"---------------------------------------- Folding ---------------------------------------- 

"---------------------------------------- Macros ---------------------------------------- 

function! ToggleMacros()
	if !exists("s:togglet_macros")
		let s:togglet_macros=0
	endif
	if s:togglet_macros==0
		let s:togglet_macros=1
		normal qf
	else
		normal q
		let @z='i'.@f
		let s:togglet_macros=0
		"unlet s:togglet_macros
	endif
endfunction

function! ToggleRecord()
	if !exists("s:togglet_records")
		let s:togglet_records=1
	endif
	if s:togglet_records==1
		let s:togglet_records=0
		normal @z
	else
		"let @q='i'.@q
"		echo @z
"		let @q=substitute(@q, '^i','', "g")
"		let @q=aaa
		normal @@
	endif
endfunction


"imap <LEADER-.> <C-o>q<Insert>
"imap qq <C-o>:let @q="i".@q<Enter><Insert>
"imap <C-.> <C-o>qq
"imap <silent> <LEADER-.> <Esc>:call ToggleMacros()<CR>

imap <silent> <C-.>   <c-o>:call ToggleMacros()<CR>
nmap <silent> <C-.>   :call ToggleMacros()<CR>
imap <silent> <c-`>   <c-o>:call ToggleRecord()<CR>
imap <silent> <a-`>   ``<Left>
nmap <silent> <a-`>   ``<Left>
"imap ` <c-o>@@
"imap <M-`> <C-o>q
"imap <C-`> <C-o>q
"imap <LEADER-.> <C-o>q<Insert>
"imap qq <C-o>:let @q="i".@q<Enter><Insert>
"imap <C-.> <C-o>qq
"imap ` <C-o>@q<Left><del>
"imap <M-`> <C-o>q
"imap <C-`> <C-o>q
"imap <LEADER-.> <C-o>q<Insert>
"---------------------------------------- Macros ---------------------------------------- 

"---------------------------------------- Метки ---------------------------------------- 
imap щ <Esc><Right><Up><Down><Esc>"aPa
imap и <Esc><Right><Up><Down><Esc>"bPa
imap <m-2> <Esc><Right><Up><Down><Esc>"sPa
imap <m-2> <Esc><Right><Up><Down><Esc>"sPa
vmap щ <Esc><Right><Up><Down><Esc>"aPa
vmap и <Esc><Right><Up><Down><Esc>"bPa
vmap <m-2> <Esc><Right><Up><Down><Esc>"sPa
vmap <m-2> <Esc><Right><Up><Down><Esc>"sPa
imap с <Esc><Right><Esc>"ayea<Left>
imap б <Esc><Right><Esc>"byea<Left>
imap <Ctrl-2> <Esc><Right><Esc>"syea<Left>
vmap с <Esc><Right><Esc>"ayea<Left>
vmap б <Esc><Right><Esc>"byea<Left>
vmap <Ctrl-2> <Esc><Right><Esc>"syea<Left>
imap <C-1> <C-o>ma
imap <M-1> <C-o>`a
imap <C-2> <C-o>ma
imap <M-2> <C-o>`a
imap <C-3> <C-o>mc
imap <M-3> <C-o>`c
imap <C-4> <C-o>md
imap <M-4> <C-o>`d
imap <C-5> <C-o>mz
imap <M-5> <C-o>`z
imap <C-6> <C-o>ma
imap <M-6> <C-o>`a
nmap <C-1> ma
nmap <M-1> `a
nmap <C-2> ma
nmap <M-2> `a
nmap <C-3> mc
nmap <M-3> `c
nmap <C-4> md
nmap <M-4> `d
nmap <C-5> mz
nmap <M-5> `z
nmap <C-6> ma
nmap <M-6> `a
"---------------------------------------- Метки ---------------------------------------- 
"---------------------------------------- Setup ---------------------------------------- 

"---------------------------------------- F1-12 ---------------------------------------- 
"F1
"nmap <F1> :wa
imap <F1> <Esc>:wa<Enter>i<Right>
"vmap <F1> :wa

"nmap <F1> :cs find s <C-R>=expand("<cword>")<CR><CR>	
"imap <F1> <Esc>:cs find s <C-R>=expand("<cword>")<CR><CR>i
"imap <F1> <Esc>:set hlsearch<CR>/\m#\$<CR>i
"nmap <F1> :set hlsearch<CR>/\m#\$<CR>i
imap <S-F1> <Esc>:set hlsearch<CR>:%s/\m//g<Left><Left><Left>
nmap <S-F1> :set hlsearch<CR>\|:%s/\m//g<Left><Left><Left>
vmap <S-F1> :set hlsearch<CR>\|:%s/\m//g<Left><Left><Left>

"<F1-Ctrl>
imap О^ <Esc>:set hlsearch<CR>/\m
nmap О^ :set hlsearch<CR>/\m

"F2
nmap <silent><F2> :w!\|:call PHPsynCHK()<Enter><CR>ki
imap <silent><F2> <Esc>:w!\|:call PHPsynCHK()<Enter><CR>ki
vmap <silent><F2> <Esc>:w!\|:call PHPsynCHK()<Enter><CR>ki
function! PHPsynCHK()
    let winnum =winnr() " get current window number
    silent !@cls
    silent make
    silent cw " open the error window if it contains error
    " return to the window with cursor set on the line of the first error (if any)
    silent execute winnum . "wincmd w"
endfunction 

"F2-ALT поиск назад
nmap <m-F2> Ni
imap <m-F2> <Esc>Ni
nmap Оi Ni
imap Оi <Esc>Ni
imap <M-:> <Esc>A;<CR>
vmap <M-:> <Esc>A;<CR>

autocmd BufNewFile,BufRead,BufWinEnter *.jch,*.php imap <silent><F3> <Esc>:w\|:call PHPsynCHK()<Enter>\|:!@to_ftp.cmd %<CR><CR>k\|w<CR>i
autocmd BufNewFile,BufRead,BufWinEnter *.jch,*.php vmap <silent><F3> <Esc>:w\|:call PHPsynCHK()<Enter>\|:!@to_ftp.cmd %<CR><CR>k\|w<CR>i
autocmd BufNewFile,BufRead,BufWinEnter *.jch,*.php nmap <silent><F3> :w\|:call PHPsynCHK()<Enter>\|:!@to_ftp.cmd %<CR><CR>k\|w<CR>i
autocmd BufNewFile,BufRead,BufWinEnter *.js imap <silent><F3> <Esc>:w\|:call PHPsynCHK()<Enter>\|:!@to_ftp.cmd %<CR><CR>ki
autocmd BufNewFile,BufRead,BufWinEnter *.js vmap <silent><F3> <Esc>:w\|:call PHPsynCHK()<Enter>\|:!@to_ftp.cmd %<CR><CR>ki
autocmd BufNewFile,BufRead,BufWinEnter *.js nmap <silent><F3> :w\|:call PHPsynCHK()<Enter>\|:!@to_ftp.cmd %<CR><CR>ki
imap Оj <F3>
vmap Оj <F3>
vmap Оj <F3>

"F4
vmap <F4> :bd!<CR>:q!<CR>
nmap <F4> :bd!<CR>:q!<CR>
imap <F4> <Esc>:bd!<CR>:q!<CR>
cmap <F4> <Esc>:bd!<CR>:q!<CR>
imap Оk <Esc>:w<CR>:bd!<CR>
nmap Оk :w<CR>:bd!<CR>
vmap <S-F4> :q!<CR>
nmap <S-F4> :q!<CR>
imap <S-F4> <Esc>:q!<CR>
cmap <S-F4> <Esc>:q!<CR>

"If you have multiple split windows in your vim window then :bd closes the split window of the current file... so I like to use something a little more advanced:
"map fc <Esc>:call CleanClose(1)
"map fq <Esc>:call CleanClose(0)
"function! CleanClose(tosave)
"if (a:tosave == 1)
"    w!
"endif
"let todelbufNr = bufnr("%")
"let newbufNr = bufnr("#")
"if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
"    exe "b".newbufNr
"else
"    bnext
"endif
"
"if (bufnr("%") == todelbufNr)
"    new
"endif
"exe "bd".todelbufNr
"endfunction


"F5
"imap <silent> <F5> <Esc>:call ToggleProjectFix()<CR>
"nmap <silent> <F5> :call ToggleProjectFix()<CR>
function! ToggleProjectFix()
   if exists("g:project_bol")
	if g:project_bol==0
		Project
		let g:project_bol=1
	else
		Project
		let g:project_bol=0
	endif
	end
   if !exists("g:project_bol")
"	let g:project_bol=1
		Project .project.vim
		set foldlevel=100
		let g:project_bol=1
	end
endfunction
"<Alt-F5>
nmap <silent>Оl :TlistToggle<CR>
imap <silent>Оl <Esc>:TlistToggle<CR>

"F6
nmap <silent>  <F5>  :call ToggleNERD()<CR>
imap <silent>  <F5>  <Esc>:call ToggleNERD()<CR>
function! ToggleNERD()
	if !exists("s:togglet")
		let s:togglet=1
	endif
	if s:togglet==0
		NERDTreeClose
		let s:togglet=1
	else
		NERDTree		
		let s:togglet=0
		set foldlevel=100
	endif
endfunction
nmap <silent> <S-F6> :call SeeTab()<cr>
vmap <silent> <S-F6> <esc>:call SeeTab()<cr>
imap <silent> <S-F6> <esc>:call SeeTab()<cr>
function! SeeTab()
  if !exists("g:SeeTabEnabled")
     let g:SeeTabEnabled=0
	 hi SpecialKey ctermfg=black
  end
	 if g:SeeTabEnabled==0 
     let g:SeeTabEnabled=1 
	 hi SpecialKey ctermfg=black
  else
     let g:SeeTabEnabled=0 
	 hi SpecialKey ctermfg=darkgray
  endif
endfunc

"F7
"F8
imap <silent> <F8> <Esc>:call ToggleEncode()<CR>
nmap <silent> <F8> :call ToggleEncode()<CR>
imap <silent> <S-F8> <Esc>:emenu Encoding.<TAB>
nmap <silent> <S-F8> :emenu Encoding.<TAB>
function! ToggleEncode()
	if !exists("s:encode_flag")
		let s:encode_flag=1
	endif
	if s:encode_flag==0
		e ++enc=cp1251 ++ff=dos
		let s:encode_flag=1
	else       
		e ++enc=utf8
		let s:encode_flag=0
	endif
endfunction
set wcm=<Tab>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>

" Save the current buffer and execute the Tortoise SVN interface's diff program
"map <silent> ,tdiff :w<CR>:silent !"C:\Progra~1\TortoiseSVN\bin\TortoiseProc.exe /command:diff /path:"%" /notempfile /closeonend"<CR>
" Save the current buffer and execute the Tortoise SVN interface's log
"map <silent> ,tlog :w<CR>:silent !"C:\Progra~1\TortoiseSVN\bin\TortoiseProc.exe /command:log /path:"%" /notempfile /closeonend"<CR>
" Save the current buffer and execute the Tortoise SVN interface's revision graph
"map <silent> ,trevs :w<CR>:silent !"C:\Progra~1\TortoiseSVN\bin\TortoiseProc.exe /command:revisiongraph epath:"%" /notempfile /closeonend"<CR>
" Save the current buffer and execute the Tortoise SVN interface's blame program
"map <silent> ,tblame :call TortoiseBlame()<CR>
"imap <silent> <S-F7> <c-o>:call TortoiseBlame()<CR>
"function! TortoiseBlame()
"  " Save the buffer
"  silent execute(':w')
"  " Now run Tortoise to get the blame dialog to display
"  let filename = expand("%")
"  let linenum = line(".")
"  silent execute('!C:\Progra~1\TortoiseSVN\bin\TortoiseProc.exe /command:commit /path:"' . filename . '" /line:' . linenum . ' /notempfile /noquestion /ignoreexternals /nonrecursive /rev:1234 /closeonend:4')
""  execute('!/C/Progra~1/TortoiseSVN/bin/TortoiseProc.exe /command:blame /path:' . filename . ' /line:' . linenum . ' /notempfile /closeonend')
"endfunction

func! CommitSVNAll()
	let buflist = []
	for b in range(1, bufnr('$'))
		if buflisted(b) && filereadable(bufname(b))
			call add(buflist, fnamemodify(bufname(b), ':p'))
		endif
	endfor
	let files = join(buflist, '*')
	if files != ''
		silent exec '!start "C:\Program Files\TortoiseSVN\bin\TortoiseProc.exe" /command:commit /path:"'.files.'" /closeonend:4'
	else
		call confirm('No files loaded')
	endif
endfunc

"call CommitSVNAll()


"F9 Save the current buffer and execute the Tortoise SVN interface's revision graph
nmap <F9> <c-o>:call CommitSVNAll()<CR>
vmap <F9>  <c-o>:call CommitSVNAll()<CR>
imap <F9> <c-o>:call CommitSVNAll()<CR>

"F9 Diff
imap <silent> <S-F9> <Esc>:w<CR>:silent !"C:\Progra~1\TortoiseSVN\bin\TortoiseProc.exe /command:diff /path:"%" /notempfile /closeonend"<CR>
nmap <silent> <S-F9> :w<CR>:silent !"C:\Progra~1\TortoiseSVN\bin\TortoiseProc.exe /command:diff /path:"%" /notempfile /closeonend"<CR>


"F11
nmap <F11> <Esc>:BufExplorer<cr>
vmap <F11> <esc>:BufExplorer<cr>
imap <F11> <esc><esc>:BufExplorer<cr>
imap <silent> <S-F11> <c-o>:call PhpDocSingle()<CR>
nmap <silent> <S-F11> :call PhpDocSingle()<CR>
vmap <silent> <S-F11> <c-o>:call PhpDocSingle()<CR>


"F12 - список закладок
nmap <S-F12> :MarksBrowser<cr>
imap <S-F12> <esc>:MarksBrowser<cr>
"---------------------------------------- F1-12 ---------------------------------------- 

"---------------------------------------- Alt ------------------------------------------

"Alt-R Open file
"imap т <Esc>gf<C-W>K<c-o>zR<Esc>:let g:project_bol=0<Esc>i
"nmap т gf<C-W>K<Esc>zR<Esc>:let g:project_bol=0<Esc>i
imap т <Esc>gf<c-o>zM<C-W>o
"<c-o>zR<Esc>:let g:project_bol=0<Esc>i
nmap т gf\|zMzM\|<C-W>o<Esc>
"<Esc>zR<Esc>:let g:project_bol=0<Esc>i


"Alt-5 Поиск скобки
vmap <m-5> <c-o>%
imap <m-5> <c-o>%
nmap <m-5> %
imap ¬ <><Left>
imap № ()<Left>
imap Ь \|\|
imap · &&

"Скобки
imap ы {
imap Ы [
imap э }
imap Э ]

"Кавычки
imap ў ""<Esc>T"i
imap § ''<Esc>T'i
nmap § ''<Esc>T'i

"Alt-0
imap ° ++;
nmap <m-g> gd

"Alt-/
nmap Ї A//<Esc>A
imap <M-/> <c-o>A//<Esc>^A "Коменты в режиме комманд
imap <M-;> <c-o>A;<Left>
nmap <M-Del> <Del>
imap <M-j> <Esc><S-j>
nmap <M-j> <S-j>
imap <M-i> if ()<Esc>T(i
"imap <M-i> if<M-f>
imap <M-,> <><LEFT>
imap <M-#> ##<LEFT>

"Alt-End
imap ОО <Home><Backspace><c-o>j
nmap ОО ei<Home><Backspace><c-o>j

"Use Alt+Mouse to select blockwise (MS Word like)
noremap <M-LeftMouse> <LeftMouse><Esc><C-V>
noremap <M-LeftDrag> <LeftDrag>
imap <M-l> else {
imap <M-b> <br />

"Поиск Alt-8
imap ё <c-o>:set hlsearch<CR><c-o>*<Left>
nmap <m-8> :set hlsearch<CR>*<Left>i
"Пргать по скобкам (8-9)
imap Є <c-o>F(
imap Ё <c-o>f(
nmap Є F(
nmap Ё f(
"Alt-8 Поиск всеx слов
imap з <c-o>gd
"---------------------------------------- Alt ---------------------------------------- 

"---------------------------------------- Ctrl ---------------------------------------- 

"CTRL-F для omni completion
"imap <C-F> <C-X><C-O>

function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-N>"
        endif
    endif
endfunction
"inoremap <Tab> <C-R>=SuperCleverTab()<cr>

"inoremap <Tab> <C-N>

function! MyThisOrCompletePHP()
let col = col('.')-1
if !col || getline('.')[col-1] !~ '\k'
	return "$this\-\>"
else
	return "\-\>"
endif
endfunction

function! MyThisOrCompleteJS()
let col = col('.')-1
if !col || getline('.')[col-1] !~ '\k'
	return "this\."
else
	return "\."
endif
endfunction



function! MyTabOrComplete()
let col = col('.')-1
if !col || getline('.')[col-1] !~ '\k'
return "\<tab>"
else
return "\<C-N>"
endif
endfunction
inoremap <Tab> <C-R>=MyTabOrComplete()<CR>
nnoremap <Tab> <C-R>=MyTabOrComplete()<CR>

imap Оm <Esc>:setlocal shiftwidth=2<CR>\|:setlocal softtabstop=2<CR>\|:setlocal tabstop=2<CR>i
nmap Оm :setlocal shiftwidth=2<CR>\|:setlocal softtabstop=2<CR>\|:setlocal tabstop=2<CR>i

"В командом режими копировать по Shift-Insert и Ctrl-Insert
cmap ОФ <C-v>
vmap ОФ <C-v>
nmap ОФ <C-v>
imap ОФ <C-v>
cmap ОХ <C-c>
vmap ОХ <C-c>
nmap ОХ <C-c>
imap ОХ <C-c>

"Ctlr-Del
imap ОЩ <c-o>dd
nmap ОЩ ddi

"Ctlr-Del
imap ОШ <Home><Del><Del><Down>
nmap ОШ <Home>2x<Down>
nmap ОШ diw
vmap ОШ diw

"Alt-Up Alt-Down
nmap ОЖ k<Home>i<c-o>F$
imap ОЖ <c-o>k<End><c-o>F$
vmap ОЖ <c-o>k<End><c-o>F$
imap ОС <Down><Home><Left><c-o>f$
vmap ОС <Down><Home><Left><c-o>f$
nmap ОС <Down><Home><Left>i<c-o>f$
"Ctrl - Enter
imap ОГ <Home><Tab><c-o>j<Home>
nmap ОГ i<Home><Tab><c-o>j<Home>
"Ctrl - Up Ctrl - Down
imap ОЕ <Esc>a<Up><Up><Up><Up><Up>
imap ОР <Esc>a<Down><Down><Down><Down><Down>
nmap ОЕ <Esc>a<Up><Up><Up><Up><Up>
nmap ОР <Esc>a<Down><Down><Down><Down><Down>
imap ОУ <Esc>a<c-o>zj
nmap ОУ <Esc>azj
imap ОИ <Esc>a<Up><c-o>zk<c-o>zj
nmap ОИ <Esc>a<Up>zkzj

"Перескок по скобкам {}
imap <c-5> <c-o>%
nmap <C-]> <C-]><Enter>f$
"imap <C-k> <Down>

"по ctrl+tab переключаться между буферами?
imap ОЗ <Esc>:bp<Enter>i
imap ОТ <Esc>:bn<Enter>i
nmap ОЗ :bp<Enter>
nmap ОТ :bn<Enter>
nmap Оv :bn<Enter>
imap Оv <Esc>:bn<Enter>

"undo T-Lib need
"imap <C-p> <Esc>:UndoBranchViewer<CR>
"nmap <C-p> :UndoBranchViewer<CR>
"imap <silent><C-q> <Esc>:b1\|:w\|:!php_debug_start.cmd %<CR><CR>\|:call PHPsynCHK()<Enter>i

"Ctrl-A
imap <C-a> <c-o>zM
nmap <C-a> zM

"Ctrl-S
imap <C-s> <c-o>zR
nmap <C-s> zR

imap <C-Space> &nbsp;
"nmap <C-[> <C-t>f$
imap <C-/> <c-o>I//<Esc>j^i
nmap <C-/> I//<Esc>j^i
imap <C-r> <c-o>u
"imap <C-k> <Esc>vw<C-c>:help <C-v><Enter>
"nmap <C-k> vw<C-c>:help <C-v><Enter>
"imap <C-k> <C-X><C-K>
"nmap <C-k> <C-X><C-K>

"Перемешение как в FARе по Ctrl-Right
imap <C-Left> <c-o>b
imap <C-Right> <c-o>3w<c-o>b
nmap <C-Left> b
nmap <C-Right> wwwb
nmap <C-Right> wwwb
cmap Оh <Enter>
nmap Оh //<Enter>
imap Оh <c-o>//<Enter>

"Shift+Del Ctrl+Del = удаление всего слова CTRL и части SHIFT
imap ОЧ <c-o>e<c-w><Del>
nmap ОЧ ei<c-w><Del>
imap ОК <c-o>F$
imap ОМ <c-o>f$
nmap ОК F$
nmap ОМ f$
vmap ОК <c-o>F$
vmap ОМ <c-o>f$

"Ctrl-\
imap  <c-o>vgH<C-c>
nmap  vgH<C-c>

"Фишка быбора команды
imap <C-$> <C-N> 

imap <C-e> <c-o>:set nohlsearch<CR><C-o>:s/\m\['/["/g<CR><C-o>:s/\m'\]/"]/g<CR>

"Ctrl-Z Undo
noremap <C-Z> u
inoremap <C-Z> <C-O>u

"CTRL-A is Select all
"noremap <C-A> gggH<C-O>G
"inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
"cnoremap <C-A> <C-C>gggH<C-O>G
"onoremap <C-A> <C-C>gggH<C-O>G
"snoremap <C-A> <C-C>gggH<C-O>G
"xnoremap <C-A> <C-C>ggVG

"CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

"CTRL-V and SHIFT-Insert are Paste
map <C-V>		"+gP
cmap <C-V>		<C-R>+

"CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.

"Shift-Insert FIX Uses the paste.vim autoload script.
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
imap <silent> <C-'> <Esc>:OScan taglist_under_cursor<CR>
nmap <silent> <C-'> :OScan taglist_under_cursor<CR>
"---------------------------------------- Ctrl ---------------------------------------- 

"---------------------------------------- Shift ---------------------------------------- 
map <S-Insert>		"+gP
cmap <S-Insert>		<C-R>+
imap <S-Insert>		<C-V>
vmap <S-Insert>		<C-V>
nmap <s-pageup> :bp<Enter>
nmap <s-pagedown> :bn<Enter>
" Входим в редактор по Shift-Enter
imap <S-Enter> <End><Enter>
vmap <S-Enter> <End><Enter>
nmap <S-Enter> i<End><Enter>
" You can also change the modifiers and the mousekey to anything else that is valid, e.g:
noremap <S-RightMouse> <LeftMouse><Esc><C-V>
noremap <S-RightDrag> <LeftDrag> 
"---------------------------------------- Shift ---------------------------------------- 

"---------------------------------------- Keys ---------------------------------------- 

"Shift-insert
nmap X ci"

"Ctrl-insert
imap ш <Esc>ci"

"Умный Home
nmap <Home> ^
imap <Home> <c-o>I

"Привычные Page Up/Down, когда курсор остаётся в той же строке
nmap <PageUp> <C-U><C-U>
imap <PageUp> <C-O><C-U><C-O><C-U>
nmap <PageDown> <C-D><C-D>
imap <PageDown> <C-O><C-D><C-O><C-D>
inoremap [ []<Left>

"make <Backspace> act as <Delete> in Visual mode?
vmap <BS> x 
"imap о &nbsp;
"---------------------------------------- Keys ---------------------------------------- 