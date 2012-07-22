"`---------------------------------------- Rus Spellcheck ---------------------------------------- 
"��� Title ��� �������� 
let &titlestring = substitute(expand("%:h"), '.*\\', "", "g")."\\".expand("%:t")
"autocmd BufNewFile,BufRead,BufWinEnter,BufWritePre  * let &titlestring = substitute(expand("%:h"), '.*\\', "", "g")."\\".expand("%:t")
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
  set title
endif


set langmap=���������������������������;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,��������������������������;abcdefghijklmnopqrstuvwxyz
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
setlocal spell spelllang=ru_yo,en_us
set spell!
imap :!setxkbmap us:!setxkbmap us,ru
nmap :!setxkbmap us:!setxkbmap us,ru
"�� ������ � (���������) �������� setxkbmap (����������) ���������� ���������� ��������� (������� ������ �������. � �� �� �������������, � ����� ����� �� ��������). �������, �� ������������� �������. ��������, ���-�� �������� ����� � ��� �����. 
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
imap �d <Esc>vG=<CR>
nmap �d vG=<CR>

"`---------------------------------------- Setup ---------------------------------------- 
"C��� ������������� vimrc ��� ��������� �����:
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

set timeoutlen=200 "����� ��������� �������� ����� ff, tt,zzz ���

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
colorscheme dn     "����� �������� �����
syntax on               " �������� ��������� ����������.
let php_sql_query=1 "���������� SQL ������ PHP �����
let php_htmlInStrings=1 "���������� HTML ������ PHP �����
let php_baselib = 1 "���������� ������� ������� PHP
set nomagic "������� ���������� ���������
set autoread "���� ���� ���������, ������������� �������� �����
set autowriteall "���������� �� This will save the file when you switch buffers, make it etc. See the appropriate :help pages for the exact details.
set t_Co=256 "���� ��� �������� ������������ 256 ������ (����� ��� ����� ������ �� ������ ������), ����� ��� ���������:
set autoindent  
"set autoindent  
"set smartindent      
set nocompatible " �������� ��������������� �������� � Vi (��� Vi ��� � �� �����������).  
set shiftwidth=2
set softtabstop=2
set tabstop=2
set ts=2 "������ ������ ���������
"set nu "�������� ��������� �����
"set nowrap   "�� ��������� ������
set scrolloff=10 "������� ����� ������ � ����� ������ ���������� ��� ����������. ����� ������.
set sidescroll=10        "��������� ������/����� ����� ������ ������� �� ���� � �� �� ��� ��������
set scrolljump=10 "������ ��� ������������� ����������� ������ � ���� ������, ����� ��������� � ������ ��������������
set linebreak "break long lines on a caracter set in 'breakat'
set nowrap "������� �����
set showbreak=�\�\�\�\> "���� ��� �� �������, ����� ������������ ������ �������� � �������� �����, ���������� ����� 'showbreak' � 8 ��������:
"set showbreak=|\|\|\> "���� ��� �� �������, ����� ������������ ������ �������� � �������� �����, ���������� ����� 'showbreak' � 8 ��������:
set listchars=tab:\�\ "SeeTab: toggles between showing tabs and using standard listchars
"set listchars=tab:\�\ "SeeTab: toggles between showing tabs and using standard listchars
"hi NonText			guifg=#0030ff		ctermfg=Orange "���������
set noequalalways "������ ������ �������� ���� ������������� �������
set iminsert=0 "�� ��������� - ��������� ���������
set noswapfile "��������� �������� ������ ������ � �����
"set fileencodings=cp1251 | utf-8 "������ ������������ ��������� ��� ��������������� �� �����������
set fileencodings=utf-8
"����� �� ����������� ����� ������� � �� ���� Vim ������ ������� �� �����. �������� 48-57 
"������������� ������, 128-175 - ����� ������� ���� � ��������� DOS (866), 
"� 192-255 ���������� ���������� ������� ����� � ��������� DOS � ��� ������� ����� � ��������� Windows-1251. 
"set iskeyword=:,@,a-z,A-Z,29,30,36,46,48-57,_,128-175,192-255 
"��� ������� ��� �� ��� ������� �� Delete � ����� ������ � ��� �������������� ���������
autocmd BufRead * '" 
"allow to use backspace instead of "x"
set backspace=2  "BS and Del in insert mode allowed and go thro
"set backspace=indent,eol,start whichwrap+=<,>,[,] "��� ���������� ������ backspace � ������ �������:
set list
set formatoptions=tcroqln1  "break text and comments after small words, recognize numbered lists and do not break intentionally long lines
set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P "������ ������ ���������
"set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P "������ ������ ���������
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
set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P "������ ������ ���������


set wildmenu "����� ������� ���������� 
"set wildmode=list:longest "make cmdline tab completion similar to bash.
"��� ������� Tab ��� ����� ���������� �� ����������� ���������� � ������� ������ �����������.
"set wildmode=list:longest,full

set clipboard=unnamed "������������ ������� \"�������� \"*

"set langmap=�q,�w,�e,�r,�t,�y,�u,�i,�o,�p,�[,�],�a,�s,�d,�f,�g,�h,�j,�k,�l,�',�z,�x,�c,�v,�b,�n,�m,�\,,�.,�`
set langmap=�j "����� ������� ��������: 1. ����������� ���-�� � ����� -> ��������� � vim �� <p> � ��� � ����.
"����������� � vim'� �������� <y> (� �.�.) -> ��������� � ����� ���������. 
set noignorecase "��������� ������� ���� ��� ������
set incsearch           "��� ������ ������������� �� ��������� ����� � �������� ������ ������
set showmatch matchtime=3 "- when bracket is inserted, briefly jump to the matching one
"setlocal list "�������� ��������� ��������� ��������
"��������� ��������� ��������� ��������
"setlocal listchars=tab:�\ ,trail:�
set listchars+=precedes:<,extends:>     "���������� ������� > ��� < ���� ����, ��� �����/������ ������
set showmatch "�������� ������
set history=500 "���������� ������� ������
set undolevels=1000
"set backup " �������� ���������� ��������� �����
"function! BackupDir() " ��������� ����� ��������� ����� ���������
"	let l:backupdir='Q:\' 	" ��������� ������� ��� ���������� ��������� �����
"	if !isdirectory(l:backupdir) 	" ���� ������� �� ����������, �������� ��� ����������
"		call mkdir(l:backupdir, 'p', 0700)
"	endif 
"	let &backupdir=l:backupdir	" ������������� ������� ��� ��������� �����
"	let &backupext=strftime('%Y-%m-%d')	" ������������� ���������� ����� ��������� �����
"endfunction
"autocmd! bufwritepre * call BackupDir() " �������� ����� ������� ������� �� ����
set novisualbell " ��������� ����������� ������
set t_vb= 
set mouse=a
set mousemodel=popup
set hidden " �� ��������� �����, ����� ������������� �� ������ ��� ��������� ������������� ��������� ������ � ���� � ��� �� ������ ��� ������������� ���������� ������ ��� ����� �������������� ����� ����
set fo+=cr " Fix <Enter> for comment
set sessionoptions=curdir,buffers,tabpages " ����� �������
set updatecount=30 "disk after 30 keystrokes to write swap file


"---------------------------------------- Tags ---------------------------------------- 
set tags=./tags,tags
"let php_noShortTags = 1 "�� ������������ �������� ���� PHP ��� ������ PHP ������
" �������������� ����
set complete=""
" �� �������� ������
set complete+=.
" �� ������ �������� �������
set complete+=b
" �� ����� 
set complete+=t
" dictionary
set complete+=k

"set keywordprg=dictionary
let tlist_php_settings = 'php;c:class;f:function' " v:variable ��� ������� � �����
" ��������� ��� Tlist (��������� ������ ������� ���� � ���� ��������� �� ����)
"let g:Tlist_Show_One_File = 1
"set completeopt-=preview
"set completeopt+=longest
"set mps-=[:]
"---------------------------------------- Tags ---------------------------------------- 

"---------------------------------------- Folding ---------------------------------------- 
autocmd BufNewFile,BufRead,BufWinEnter *.jch,*.php,*.js let php_folding = 0
"set foldcolumn=4 "������ ������������
"let php_folding = 0 "��������� �������� ������������� (��� ���������� ����� ������)
autocmd BufNewFile,BufRead,BufWinEnter *.jch,*.php,*.js set foldmethod=expr
"set foldmethod=manual
set foldminlines=2
set foldnestmax=5 "deepest fold is 3 levels. set nofoldenable dont fold by default. 
set nofoldenable        "dont fold by default
autocmd BufNewFile,BufRead,BufWinEnter *.jch,*.php,*.js set foldexpr=getline(v:lnum-1)=~'^\\s*$'&&getline(v:lnum)=~'\\S'?'>1':1
"� ������ ������� 
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

"---------------------------------------- ����� ---------------------------------------- 
imap � <Esc><Right><Up><Down><Esc>"aPa
imap � <Esc><Right><Up><Down><Esc>"bPa
imap <m-2> <Esc><Right><Up><Down><Esc>"sPa
imap <m-2> <Esc><Right><Up><Down><Esc>"sPa
vmap � <Esc><Right><Up><Down><Esc>"aPa
vmap � <Esc><Right><Up><Down><Esc>"bPa
vmap <m-2> <Esc><Right><Up><Down><Esc>"sPa
vmap <m-2> <Esc><Right><Up><Down><Esc>"sPa
imap � <Esc><Right><Esc>"ayea<Left>
imap � <Esc><Right><Esc>"byea<Left>
imap <Ctrl-2> <Esc><Right><Esc>"syea<Left>
vmap � <Esc><Right><Esc>"ayea<Left>
vmap � <Esc><Right><Esc>"byea<Left>
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
"---------------------------------------- ����� ---------------------------------------- 
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
imap �^ <Esc>:set hlsearch<CR>/\m
nmap �^ :set hlsearch<CR>/\m

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

"F2-ALT ����� �����
nmap <m-F2> Ni
imap <m-F2> <Esc>Ni
nmap �i Ni
imap �i <Esc>Ni
imap <M-:> <Esc>A;<CR>
vmap <M-:> <Esc>A;<CR>

autocmd BufNewFile,BufRead,BufWinEnter *.jch,*.php imap <silent><F3> <Esc>:w\|:call PHPsynCHK()<Enter>\|:!@to_ftp.cmd %<CR><CR>k\|w<CR>i
autocmd BufNewFile,BufRead,BufWinEnter *.jch,*.php vmap <silent><F3> <Esc>:w\|:call PHPsynCHK()<Enter>\|:!@to_ftp.cmd %<CR><CR>k\|w<CR>i
autocmd BufNewFile,BufRead,BufWinEnter *.jch,*.php nmap <silent><F3> :w\|:call PHPsynCHK()<Enter>\|:!@to_ftp.cmd %<CR><CR>k\|w<CR>i
autocmd BufNewFile,BufRead,BufWinEnter *.js imap <silent><F3> <Esc>:w\|:call PHPsynCHK()<Enter>\|:!@to_ftp.cmd %<CR><CR>ki
autocmd BufNewFile,BufRead,BufWinEnter *.js vmap <silent><F3> <Esc>:w\|:call PHPsynCHK()<Enter>\|:!@to_ftp.cmd %<CR><CR>ki
autocmd BufNewFile,BufRead,BufWinEnter *.js nmap <silent><F3> :w\|:call PHPsynCHK()<Enter>\|:!@to_ftp.cmd %<CR><CR>ki
imap �j <F3>
vmap �j <F3>
vmap �j <F3>

"F4
vmap <F4> :bd!<CR>:q!<CR>
nmap <F4> :bd!<CR>:q!<CR>
imap <F4> <Esc>:bd!<CR>:q!<CR>
cmap <F4> <Esc>:bd!<CR>:q!<CR>
imap �k <Esc>:w<CR>:bd!<CR>
nmap �k :w<CR>:bd!<CR>
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
nmap <silent>�l :TlistToggle<CR>
imap <silent>�l <Esc>:TlistToggle<CR>

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


"F12 - ������ ��������
nmap <S-F12> :MarksBrowser<cr>
imap <S-F12> <esc>:MarksBrowser<cr>
"---------------------------------------- F1-12 ---------------------------------------- 

"---------------------------------------- Alt ------------------------------------------

"Alt-R Open file
"imap � <Esc>gf<C-W>K<c-o>zR<Esc>:let g:project_bol=0<Esc>i
"nmap � gf<C-W>K<Esc>zR<Esc>:let g:project_bol=0<Esc>i
imap � <Esc>gf<c-o>zM<C-W>o
"<c-o>zR<Esc>:let g:project_bol=0<Esc>i
nmap � gf\|zMzM\|<C-W>o<Esc>
"<Esc>zR<Esc>:let g:project_bol=0<Esc>i


"Alt-5 ����� ������
vmap <m-5> <c-o>%
imap <m-5> <c-o>%
nmap <m-5> %
imap � <><Left>
imap � ()<Left>
imap � \|\|
imap � &&

"������
imap � {
imap � [
imap � }
imap � ]

"�������
imap � ""<Esc>T"i
imap � ''<Esc>T'i
nmap � ''<Esc>T'i

"Alt-0
imap � ++;
nmap <m-g> gd

"Alt-/
nmap � A//<Esc>A
imap <M-/> <c-o>A//<Esc>^A "������� � ������ �������
imap <M-;> <c-o>A;<Left>
nmap <M-Del> <Del>
imap <M-j> <Esc><S-j>
nmap <M-j> <S-j>
imap <M-i> if ()<Esc>T(i
"imap <M-i> if<M-f>
imap <M-,> <><LEFT>
imap <M-#> ##<LEFT>

"Alt-End
imap �� <Home><Backspace><c-o>j
nmap �� ei<Home><Backspace><c-o>j

"Use Alt+Mouse to select blockwise (MS Word like)
noremap <M-LeftMouse> <LeftMouse><Esc><C-V>
noremap <M-LeftDrag> <LeftDrag>
imap <M-l> else {
imap <M-b> <br />

"����� Alt-8
imap � <c-o>:set hlsearch<CR><c-o>*<Left>
nmap <m-8> :set hlsearch<CR>*<Left>i
"������ �� ������� (8-9)
imap � <c-o>F(
imap � <c-o>f(
nmap � F(
nmap � f(
"Alt-8 ����� ���x ����
imap � <c-o>gd
"---------------------------------------- Alt ---------------------------------------- 

"---------------------------------------- Ctrl ---------------------------------------- 

"CTRL-F ��� omni completion
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

imap �m <Esc>:setlocal shiftwidth=2<CR>\|:setlocal softtabstop=2<CR>\|:setlocal tabstop=2<CR>i
nmap �m :setlocal shiftwidth=2<CR>\|:setlocal softtabstop=2<CR>\|:setlocal tabstop=2<CR>i

"� �������� ������ ���������� �� Shift-Insert � Ctrl-Insert
cmap �� <C-v>
vmap �� <C-v>
nmap �� <C-v>
imap �� <C-v>
cmap �� <C-c>
vmap �� <C-c>
nmap �� <C-c>
imap �� <C-c>

"Ctlr-Del
imap �� <c-o>dd
nmap �� ddi

"Ctlr-Del
imap �� <Home><Del><Del><Down>
nmap �� <Home>2x<Down>
nmap �� diw
vmap �� diw

"Alt-Up Alt-Down
nmap �� k<Home>i<c-o>F$
imap �� <c-o>k<End><c-o>F$
vmap �� <c-o>k<End><c-o>F$
imap �� <Down><Home><Left><c-o>f$
vmap �� <Down><Home><Left><c-o>f$
nmap �� <Down><Home><Left>i<c-o>f$
"Ctrl - Enter
imap �� <Home><Tab><c-o>j<Home>
nmap �� i<Home><Tab><c-o>j<Home>
"Ctrl - Up Ctrl - Down
imap �� <Esc>a<Up><Up><Up><Up><Up>
imap �� <Esc>a<Down><Down><Down><Down><Down>
nmap �� <Esc>a<Up><Up><Up><Up><Up>
nmap �� <Esc>a<Down><Down><Down><Down><Down>
imap �� <Esc>a<c-o>zj
nmap �� <Esc>azj
imap �� <Esc>a<Up><c-o>zk<c-o>zj
nmap �� <Esc>a<Up>zkzj

"�������� �� ������� {}
imap <c-5> <c-o>%
nmap <C-]> <C-]><Enter>f$
"imap <C-k> <Down>

"�� ctrl+tab ������������� ����� ��������?
imap �� <Esc>:bp<Enter>i
imap �� <Esc>:bn<Enter>i
nmap �� :bp<Enter>
nmap �� :bn<Enter>
nmap �v :bn<Enter>
imap �v <Esc>:bn<Enter>

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

"����������� ��� � FAR� �� Ctrl-Right
imap <C-Left> <c-o>b
imap <C-Right> <c-o>3w<c-o>b
nmap <C-Left> b
nmap <C-Right> wwwb
nmap <C-Right> wwwb
cmap �h <Enter>
nmap �h //<Enter>
imap �h <c-o>//<Enter>

"Shift+Del Ctrl+Del = �������� ����� ����� CTRL � ����� SHIFT
imap �� <c-o>e<c-w><Del>
nmap �� ei<c-w><Del>
imap �� <c-o>F$
imap �� <c-o>f$
nmap �� F$
nmap �� f$
vmap �� <c-o>F$
vmap �� <c-o>f$

"Ctrl-\
imap  <c-o>vgH<C-c>
nmap  vgH<C-c>

"����� ������ �������
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
" ������ � �������� �� Shift-Enter
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
imap � <Esc>ci"

"����� Home
nmap <Home> ^
imap <Home> <c-o>I

"��������� Page Up/Down, ����� ������ ������� � ��� �� ������
nmap <PageUp> <C-U><C-U>
imap <PageUp> <C-O><C-U><C-O><C-U>
nmap <PageDown> <C-D><C-D>
imap <PageDown> <C-O><C-D><C-O><C-D>
inoremap [ []<Left>

"make <Backspace> act as <Delete> in Visual mode?
vmap <BS> x 
"imap � &nbsp;
"---------------------------------------- Keys ---------------------------------------- 