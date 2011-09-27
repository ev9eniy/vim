" Vim syntax file
" Language:	JavaScript
" Maintainer:	Claudio Fleiner <claudio@fleiner.com>
" Updaters:	Scott Shattuck (ss) <ss@technicalpursuit.com>
" URL:		http://www.fleiner.com/vim/syntax/javascript.vim
" Changes:	(ss) added keywords, reserved words, and other identifiers
"		(ss) repaired several quoting and grouping glitches
"		(ss) fixed regex parsing issue with multiple qualifiers [gi]
"		(ss) additional factoring of keywords, globals, and members
" Last Change:	2006 Jun 19

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
" tuning parameters:
" unlet javaScript_fold

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'javascript'
endif

" Drop fold if it set but vim doesn't support it.
if version < 600 && exists("javaScript_fold")
  unlet javaScript_fold
endif

syn case ignore


syn keyword javaScriptCommentTodo      TODO FIXME XXX TBD contained
syn match   javaScriptLineComment      "\/\/.*" contains=@Spell,javaScriptCommentTodo
syn match   javaScriptCommentSkip      "^[ \t]*\*\($\|[ \t]\+\)"
syn region  javaScriptComment	       start="/\*"  end="\*/" contains=@Spell,javaScriptCommentTodo
syn match   javaScriptSpecial	       "\\\d\d\d\|\\."
syn region  javaScriptStringD	       start=+"+  skip=+\\\\\|\\"+  end=+"\|$+  contains=javaScriptSpecial,@htmlPreproc
syn region  javaScriptStringS	       start=+'+  skip=+\\\\\|\\'+  end=+'\|$+  contains=javaScriptSpecial,@htmlPreproc

syn match   javaScriptSpecialCharacter "'\\.'"
syn match   javaScriptNumber	       "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn region  javaScriptRegexpString     start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gi]\{0,2\}\s*$+ end=+/[gi]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline

syn keyword javaScriptConditional	if else switch
syn keyword javaScriptRepeat		while for do in
syn keyword javaScriptBranch		break continue
syn keyword javaScriptOperator		new delete instanceof typeof
"syn keyword javaScriptType		
syn keyword javaScriptStatement		return with
syn keyword javaScriptBoolean		true false
syn keyword javaScriptNull		null undefined
"syn keyword javaScriptIdentifier	arguments this var
syn keyword javaScriptType	       arguments this var const Array Boolean Date Function Number Object String RegExp
syn keyword javaScriptStatement        return with
syn keyword javaScriptBoolean	       true false null

syn keyword javaScriptLabel		case default
syn keyword javaScriptException		try catch finally throw
syn keyword javaScriptMessage		alert confirm prompt status
syn keyword javaScriptGlobal		self window top parent
syn keyword javaScriptMember		replace ajax ajaxSetup boxModel browser data datepicker.ATOM datepicker.COOKIE datepicker.formatDate datepicker.ISO_8601 datepicker.parseDate datepicker.regional datepicker.RFC_1036 datepicker.RFC_1123 datepicker.RFC_2822 datepicker.RFC_822 datepicker.RFC_850 datepicker.RSS datepicker.setDefaults datepicker.TIMESTAMP datepicker.W3C each extend fn.extend get getJSON getScript grep inArray makeArray map merge param post support support.boxModel trim unique accordion add addClass after andSelf animate append appendTo attr before bind blur change children click clone contents css data datepicker dblclick dequeue dialog die disableSelection draggable droppable each effect empty end eq error fadeTo filter find focus get hasClass height hover html index insertAfter insertBefore is keydown keypress keyup length live load map mousedown mousemove mouseout mouseover mouseup next nextAll noConflict not offset one parent parents prepend prependTo prev prevAll progressbar queue ready replaceAll replaceWith resizable resize scroll select selectable serialize serializeArray siblings size slice slider slideToggle  sortable stop submit switchClass tabs text toggle toggleClass trigger triggerHandler unbind unload val width wrap wrapAll wrapInner parseInt parseFloat
syn keyword javaScriptMemberClose	hide slideUp fadeOut removeData remove removeAttr removeClass removeData setTimeout
syn keyword javaScriptMemberShow	show slideDown fadeIn

"attr href click hover show hide fadeIn fadeOut SlideDown SlideUp remove replace children datasave togglePopup children next nextAll parent parents prev prevAll siblings contents end andSelf map 
syn keyword javaScriptEvent		success ajaxComplete ajaxError ajaxSend ajaxStart ajaxStop ajaxSuccess get post ajax Event dblclick blur change click focus keydown keypress keyup load mousedown mousemove mouseout mouseover mouseup resize scroll select submit unload error
syn keyword javaScriptDeprecated	escape unescape
syn keyword javaScriptReserved		abstract boolean byte char class const debugger double enum export extends final float goto implements import int interface long native package private protected public short static super synchronized throws transient volatile 

syn cluster jFunctions      contains=jCore,jAttributes,jTraversing,jManipulation,jCSS,jEvents,jAjax,jUtilities
syn keyword jCore           contained each size length selector context eq get index
syn keyword jCore           contained data removeData queue dequeue
syn keyword jCore           contained extend noConflict
syn keyword jAttributes     contained attr removeAttr addClass removeClass toggleClass html text val
syn keyword jTraversing     contained eq filter is map not slice
syn keyword jTraversing     contained add children closest contents find next nextAll parent parents prev prevAll siblings
syn keyword jTraversing     contained andSelf end
syn keyword jManipulation   contained append appendTo preprend prependTo
syn keyword jManipulation   contained after before insertAfter insertBefore
syn keyword jManipulation   contained wrap wrapAll wrapInner
syn keyword jManipulation   contained replaceWith replaceAll
syn keyword jManipulation   contained empty remove
syn keyword jManipulation   contained clone
syn keyword jCSS            contained css
syn keyword jCSS            contained offset offsetParent position scrollTop scrollLeft
syn keyword jCSS            contained height width innerHeight innerWidth outerHeight outerWidth
syn keyword jEvents         contained ready
syn keyword jEvents         contained bind one trigger triggerHandler unbind
syn keyword jEvents         contained live die
syn keyword jEvents         contained hover toggle
syn keyword jEvents         contained blur change click dblclick error focus keydown keypress keyup load
syn keyword jEvents         contained mousedown mouseenter mouseleave mousemove mouseout mouseover mouseup resize scroll select submit unload
syn keyword jEffects        contained show hide toggle
syn keyword jEffects        contained slideDown slideUp slideToggle
syn keyword jEffects        contained fadeIn fadeOut fadeTo
syn keyword jEffects        contained animate stop
syn keyword jAjax           contained ajax load get getJSON getScript post
syn keyword jAjax           contained ajaxComplete ajaxError ajaxSend ajaxStart ajaxStop ajaxSuccess
syn keyword jAjax           contained ajaxSetup serialize serializeArray
syn keyword jUtilities      contained support browser boxModel
syn keyword jUtilities      contained extend grep makeArray map inArray merge unique
syn keyword jUtilities      contained isArray isFunction
syn keyword jUtilities      contained trim param


syn region  javaScriptStringD          start=+"+  skip=+\\\\\|\\"+  end=+"\|$+  contains=javaScriptSpecial,@htmlPreproc,@jSelectors
syn region  javaScriptStringS          start=+'+  skip=+\\\\\|\\'+  end=+'\|$+  contains=javaScriptSpecial,@htmlPreproc,@jSelectors

syn cluster jSelectors      contains=jId,jClass,jOperators,jBasicFilters,jContentFilters,jVisibility,jChildFilters,jForms,jFormFilters
"syn match   jId             contained /[\\"\\'\\S0-9A-Za-z_\-]*#[\\"\\'\\S0-9A-Za-z_\-]*/
syn match   jId             contained /[0-9A-Za-z_\-]*#[0-9A-Za-z_\-]\+/
syn match   jClass          contained /\.[0-9A-Za-z_\-]\+/
syn match   jOperators      contained /*\|>\|>|\~/
syn match   jBasicFilters   contained /:(first\|last\|not\|eveb\|odd\|eq\|gt\|lt\|header\|animated)/
syn match   jContentFilters contained /:(contains\|empty\|has\|parent)/
syn match   jVisibility     contained /:(hidden\|visible)/
syn match   jChildFilters   contained /:(nth\|first\|last\|only)-child/
syn match   jForms          contained /:(input\|text\|password\|radio\|checkbox\|submit\|image\|reset\|button\|file)/
syn match   jFormFilters    contained /:(enabled\|disabled\|checked\|selected)/


if exists("javaScript_fold")
    syn match	javaScriptFunction      "\<function\>"
    syn region	javaScriptFunctionFold	start="\<function\>.*[^};]$" end="^\z1}.*$" transparent fold keepend

    syn sync match javaScriptSync	grouphere javaScriptFunctionFold "\<function\>"
    syn sync match javaScriptSync	grouphere NONE "^}"

    setlocal foldmethod=syntax
    setlocal foldtext=getline(v:foldstart)
else
    syn keyword	javaScriptFunction      function
    syn match	javaScriptBraces	   "[{}\[\]]"
    syn match	javaScriptParens	   "[()]"
endif

syn sync fromstart
syn sync maxlines=100

if main_syntax == "javascript"
  syn sync ccomment javaScriptComment
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_javascript_syn_inits")
  if version < 508
    let did_javascript_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  "add
  HiLink jQuery          Constant

  HiLink jCore           Identifier
  HiLink jAttributes     Identifier
  HiLink jTraversing     Identifier
  HiLink jManipulation   Identifier
  HiLink jCSS            Identifier
  HiLink jEvents         Identifier
  HiLink jEffects        Identifier
  HiLink jAjax           Identifier
  HiLink jUtilities      Identifier

  HiLink jId             Identifier_oxra
  HiLink jClass          Identifier_blue
  HiLink jOperators      Special
  HiLink jBasicFilters   Statement
  HiLink jContentFilters Statement
  HiLink jVisibility     Statement
  HiLink jChildFilters   Statement
  HiLink jForms          Statement
  HiLink jFormFilters    Statement
"add
  HiLink javaScriptComment		Comment
  HiLink javaScriptLineComment		Comment
  HiLink javaScriptCommentTodo		Todo
  HiLink javaScriptSpecial		Special
  HiLink javaScriptStringS		String
  HiLink javaScriptStringD		String
  HiLink javaScriptCharacter		Character
  HiLink javaScriptSpecialCharacter	javaScriptSpecial
  HiLink javaScriptNumber		javaScriptValue
  HiLink javaScriptConditional		Conditional
  HiLink javaScriptRepeat		Repeat
  HiLink javaScriptBranch		Conditional
  HiLink javaScriptOperator		Operator
  HiLink javaScriptType			Type
"  HiLink javaScriptFunction Type
  HiLink javaScriptStatement		Statement
  HiLink javaScriptFunction		Function
  HiLink javaScriptBraces		Function
  HiLink javaScriptError		Error
  HiLink javaScrParenError		javaScriptError
  HiLink javaScriptNull			Keyword
  HiLink javaScriptBoolean		Boolean
  HiLink javaScriptRegexpString		String

  HiLink javaScriptIdentifier		Identifier
  HiLink javaScriptLabel		Label
  HiLink javaScriptException		Exception
  HiLink javaScriptMessage		Keyword
  HiLink javaScriptGlobal		Keyword
  HiLink javaScriptMember		Keyword
"  HiLink javaScriptEvent                Keyword
  HiLink javaScriptDeprecated		Exception 
  HiLink javaScriptReserved		Keyword
  HiLink javaScriptDebug		Debug
  HiLink javaScriptConstant		Label
  HiLink javaScriptType		     Type
  HiLink javaScriptStatement	     Statement
  HiLink javaScriptBoolean	     Boolean

  delcommand HiLink
endif

let b:current_syntax = "javascript"
if main_syntax == 'javascript'
  unlet main_syntax
endif

" vim: ts=8
