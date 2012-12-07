"au BufRead,BufNewFile *.css set t_Co=256



autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=htmlcomplete#CompleteTags

au BufRead,BufNewFile,BufWinEnter *.html autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
au BufRead,BufNewFile,BufWinEnter *.css autocmd FileType css set omnifunc=csscomplete#CompleteCSS
au BufRead,BufNewFile,BufWinEnter *.xml set omnifunc=xmlcomplete#CompleteTags
au BufRead,BufNewFile,BufWinEnter *.html setlocal filetype=html,htmlm4
au BufRead,BufNewFile,BufWinEnter *.xml setlocal filetype=xml 
au BufRead,BufNewFile,BufWinEnter *.css setlocal filetype=css 
au BufRead,BufNewFile,BufWinEnter *.css,*.html imap <silent><F3> <Esc>:w\|:!@to_ftp.cmd %<CR><CR>ki
au BufRead,BufNewFile,BufWinEnter *.css,*.html vmap <silent><F3> <Esc>:w\|:!@to_ftp.cmd %<CR><CR>ki
au BufRead,BufNewFile,BufWinEnter *.css,*.html nmap <silent><F3> :w\|:!@to_ftp.cmd %<CR><CR>ki
au BufRead,BufNewFile,BufWinEnter *.css set dict+=$HOME.\VIMFILES\DICT\plueprint.dic
au BufRead,BufNewFile,BufWinEnter *.css set dict+=$HOME.\VIMFILES\DICT\css21.dic

"C-Insert

autocmd BufNewFile,BufRead,BufWinEnter *.css imap �� <c-o>ve<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.css imap ���� <c-o>vf]<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.css imap ������ <c-o>v2f]<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.css imap �������� <c-o>v3f]<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.css imap ���������� <c-o>v4f]<C-c>
autocmd BufNewFile,BufRead,BufWinEnter *.css nmap �� ve<C-c>i
autocmd BufNewFile,BufRead,BufWinEnter *.css nmap ���� vf]<C-c>i
autocmd BufNewFile,BufRead,BufWinEnter *.css nmap ������ v2f]<C-c>i
autocmd BufNewFile,BufRead,BufWinEnter *.css nmap �������� v3f]<C-c>i
autocmd BufNewFile,BufRead,BufWinEnter *.css nmap ���������� v4f]<C-c>i


"au BufRead,BufNewFile *.css set foldmethod=marker  
"au BufRead,BufNewFile *.css set foldmarker=(start),(end)

" Vim filetype plugin file
" Language:         CSS
" Maintainer:       Nikolai Weibull <now@bitwi.se>
" Latest Revision:  2008-07-09

"if exists("b:did_ftplugin")
"  finish
"endif
"let b:did_ftplugin = 1
"
"let s:cpo_save = &cpo
"set cpo&vim
"
"let b:undo_ftplugin = "setl com< cms< inc< fo< ofu<"
"
"setlocal comments=s1:/*,mb:*,ex:*/ commentstring&
"setlocal formatoptions-=t formatoptions+=croql
"setlocal omnifunc=csscomplete#CompleteCSS
"
"let &l:include = '^\s*@import\s\+\%(url(\)\='
"
"let &cpo = s:cpo_save
"unlet s:cpo_save