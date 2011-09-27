" Vim color file
" Maintainer:	Bohdan Vlasyuk <bohdan@vstu.edu.ua>
" Last Change:	2006 Apr 30

" darkblue -- for those who prefer dark background
" [note: looks bit uglier with come terminal palettes,
" but is fine on default linux console palette.]

set bg=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "dn"

hi Normal		guifg=#c0c0c0 guibg=#000040						ctermfg=yellow ctermbg=black
hi ErrorMsg		guifg=#ffffff guibg=#287eff						ctermfg=green ctermbg=black
hi Visual		guifg=#8080ff guibg=fg		gui=reverse				ctermfg=white ctermbg=lightgray cterm=reverse
hi VisualNOS	guifg=#8080ff guibg=fg		gui=reverse,underline	ctermfg=white ctermbg=fg cterm=reverse,underline
hi Todo			guifg=#d14a14 guibg=#1248d1						ctermfg=red	ctermbg=black
hi Search		guifg=#90fff0 guibg=#2050d0						ctermfg=white ctermbg=darkcyan cterm=underline term=underline
hi IncSearch	guifg=#b0ffff guibg=#2050d0							ctermfg=white ctermbg=darkcyan

hi SpecialKey		guifg=gray			ctermfg=darkgray
hi Directory		guifg=gray			ctermfg=grey
hi Title			guifg=magenta gui=none ctermfg=magenta cterm=bold
hi WarningMsg		ctermfg=green ctermbg=black
hi WildMenu			guifg=white guibg=lightgray ctermfg=white ctermbg=lightgray cterm=none term=none
hi ModeMsg			guifg=#22cce2		ctermfg=darkgray
hi MoreMsg			ctermfg=darkgreen	ctermfg=darkgreen
hi Question			guifg=green gui=none ctermfg=green cterm=none
hi NonText			guifg=#0030ff		ctermfg=gray

hi StatusLine	guifg=blue guibg=darkgray gui=none		ctermfg=blue ctermbg=black term=none cterm=none
hi StatusLineNC	guifg=black guibg=darkgray gui=none		ctermfg=black ctermbg=black term=none cterm=none
hi VertSplit	guifg=black guibg=darkgray gui=none		ctermfg=black ctermbg=black term=none cterm=none

hi Folded	guifg=#808080 guibg=#000040			ctermfg=darkgrey ctermbg=black cterm=bold term=bold
hi FoldColumn	guifg=#808080 guibg=#000040			ctermfg=darkgrey ctermbg=black cterm=bold term=bold
hi LineNr	guifg=#90f020			ctermfg=green cterm=none

hi DiffAdd	guibg=darkblue	ctermbg=darkblue term=none cterm=none
hi DiffChange	guibg=darkmagenta ctermbg=magenta cterm=none
hi DiffDelete	ctermfg=blue ctermbg=gray gui=bold guifg=Blue guibg=Darkgray
hi DiffText	cterm=bold ctermbg=darkgray gui=bold guibg=Red

hi Cursor	guifg=black guibg=white ctermfg=cyan ctermbg=lightgray
hi lCursor	guifg=black guibg=white ctermfg=black ctermbg=black


hi Comment	guifg=#80a0ff ctermfg=darkcyan
hi Constant	ctermfg=yellow guifg=#ffa0a0 cterm=none
hi Special	ctermfg=white guifg=Orange cterm=none gui=none
hi Identifier	ctermfg=grey guifg=#40ffff cterm=none
hi Statement	ctermfg=white cterm=none guifg=#ffff60 gui=none
hi PreProc	ctermfg=white guifg=#ff80ff gui=none cterm=none
"hi type		ctermfg=white guifg=#60ff60 gui=none cterm=none
highlight Type		 ctermfg=green						  guifg=#00c000
hi Underlined	cterm=underline term=underline
hi Ignore	guifg=bg ctermfg=bg

hi Number ctermfg=cyan guifg=#60ff60 gui=none cterm=none
"(){}
hi Delimiter ctermfg=white
";
hi javaSpecial guifg=white ctermfg=white
hi Macro		ctermfg=white
"\r\n
hi specialchar	ctermfg=darkred
" isset()
hi SpecialComment ctermfg=white
".*
hi Typedef	ctermfg=white
"if
hi Conditional	ctermfg=white
"php
hi Debug		ctermfg=darkred
"php"
hi Tag		ctermfg=darkred
" include
hi Include	ctermfg=white
""//hi Define ctermfg=red
"Фолдинг
hi Folded ctermbg=black ctermfg=darkgray
""hi Folded	guifg=#808080 guibg=#000040			ctermfg=darkred ctermbg=black cterm=bold term=bold
""hi FoldColumn	guifg=#808080 guibg=#000040			ctermfg=darkred ctermbg=black cterm=bold term=bold

" - Номера строк
hi LineNr ctermfg=darkgray ctermbg=black
""Меню автодополнения
hi Pmenu ctermbg=darkgray ctermfg=white
hi PmenuSel  ctermfg=black ctermbg=white

hi Error ctermfg=black ctermbg=red
hi SpecialKey guifg=white ctermfg=darkgrey
""hi TabLineSel ctermfg=black ctermbg=white
"hi Underlined  ctermfg=black ctermbg=white
"hi VertSplit ctermfg=black ctermbg=white
"hi TabLineSel ctermfg=black ctermbg=white
"hi StatusLine  ctermfg=black ctermbg=white
"hi StatusLineNC  ctermfg=black ctermbg=white

""hi TabLine guibg=#4d8080 guifg=fg gui=underline
""hi TabLineFill guibg=#4d8080 guifg=fg gui=underline

"" - Всякие "~" внизу экрана
"highlight NonText ctermbg=black ctermfg=gray
""- statusline текущего окна
"highlight StatusLine cterm=none ctermbg=236 
""- остальных окон
"highlight StatusLineNC cterm=none ctermbg=236 ctermfg=243 
""Строка для табов:
"""highlight TabLine cterm=none ctermbg=236 ctermfg=145
"highlight TabLineFill ctermfg=236                     "
"highlight TabLineSel cterm=none ctermbg=240 ctermfg=253
""Вертикальный разделитель окон:
""highlight VertSplit ctermfg=236
"hi String	ctermfg=gray
"hi Character	ctermfg=white
"hi Boolean	ctermfg=green
"""hi Float		ctermfg=red
"hi Label		ctermfg=blue
hi Keyword	ctermfg=gray
hi Identifier_blue ctermfg=6
hi Identifier_oxra ctermfg=5
hi javaScriptMemberClose ctermfg=1
hi javaScriptMemberShow ctermfg=9
hi javaScriptEvent ctermfg=2
"1 darkblue
"9 lightblue
hi MatchParen ctermfg=4 ctermbg=16
"2 darkgreen
"10 lightGreen

"3 darkcyan
"11 lightCyan

"5 darkPurple
"13 LightPurple

"6 darkoxra
"14 lightoxra

"7 lightgray
"8 darkgray

"12 Red
"4 darkRed

"15 white
"16 black
"hi Function  ctermfg=darkPurple ctermbg=darkPurple
"hi htmlH1  ctermfg=gray ctermbg=darkgray
"hi htmlH2  ctermfg=gray ctermbg=darkgray
"hi htmlH3  ctermfg=gray ctermbg=darkgray
"hi htmlH4  ctermfg=gray ctermbg=darkgray
"hi htmlH5  ctermfg=gray ctermbg=darkgray
"hi htmlH6  ctermfg=gray ctermbg=darkgray
"hi htmlHead  ctermfg=gray ctermbg=darkgray
"hi htmlTitle ctermfg=gray ctermbg=darkgray
"hi htmlRegion ctermfg=gray ctermbg=darkgray
"hi phpFoldHtmlInside ctermfg=gray ctermbg=darkgray
"hi htmlTop ctermfg=gray ctermbg=darkgray
""hi htmlBold guibg=bg guifg=fg gui=bold
""hi htmlItalic guibg=bg guifg=fg gui=italic
""hi htmlUnderline guibg=bg guifg=fg gui=underline
""hi htmlBoldItalic guibg=bg guifg=fg gui=bold,italic
""hi htmlBoldUnderline guibg=bg guifg=fg gui=bold,underline
""hi htmlBoldUnderlineItalic guibg=bg guifg=fg gui=bold,underline,italic
""hi htmlUnderlineItalic guibg=bg guifg=fg gui=underline,italic