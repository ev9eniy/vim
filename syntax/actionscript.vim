" Vim syntax file
" Language:	actionScript
" Maintainer:	Igor Dvorsky <amigo@modesite.net>
" URL:		http://www.modesite.net/vim/actionscript.vim
" Last Change:	2002 Sep 12
" Updated to support AS 2.0 2004 March 12 by Richard Leider  (richard@appliedrhetoric.com)
" Updated to support new AS 2.0 Flash 8 Language Elements 2005 September 29 (richard@appliedrhetoric.com)
" Updated to support AS 3.0 Language Elements 2009 March 03 (richard@appliedrhetoric.com)


" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
  finish
endif
  let main_syntax = 'actionscript'
endif

syn region  asStringDQ	      start=+"+  skip=+\\\\\|\\"+  end=+"+
syn region  asStringSQ	      start=+'+  skip=+\\\\\|\\'+  end=+'+
"syn match   asNumber          "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn region  asRegExp          start=+/+ skip=+\\\\\|\\/+ end=+/[gismx]\?\s*$+ end=+/[gismx]\?\s*[;,)]+me=e-1 oneline
" TODO: E4X
  syn cluster phpClValues add=asNumber
  syn match asNumber contained display /\<[1-9]\d*\>/
  syn match asNumber contained display /-[1-9]\d*\>/
  syn match asNumber contained display /+[1-9]\d*\>/
  syn match asNumber contained display /\<0x\x\{1,8}\>/
  syn match asNumber contained display /\<0\d*\>/ contains=asOctalError
  syn match phpOctalError contained display /[89]/


syn keyword asCommentTodo     TODO FIXME XXX TBD contained

syn match   asComment         "//.*$" contains=asCommentTodo
syn region  asComment         start="/\*"  end="\*/" contains=asCommentTodo

syn keyword asDirective       import include
syn match   asDirective       "\<use\s\+namespace\>"

syn keyword asAttribute       public private internal protected override final dynamic native static

syn keyword asDefinition      const var class extends interface implements package namespace
syn match   asDefinition        "\<function\(\s\+[gs]et\)\?\>"

syn keyword asGlobal          NaN Infinity undefined eval parseInt parseFloat isNaN isFinite decodeURI decodeURIComponent encodeURI encodeURIComponent

syn keyword asType            Object Array String Boolean Number Date Error XML int 
syn keyword asType            int uint void *

syn keyword asStatement       if else do while for with switch case default continue break return throw try catch finally
syn match   asStatement       "\<for\s\+each\>"

syn keyword asIdentifier      super this

syn keyword asConstant        null true false
syn keyword asOperator        new in is as typeof instanceof delete

syn match   asBraces          "[{}]"

" Flex metadata
syn keyword asMetadataTag     Bindable DefaultProperty Effect Event Exclude IconFile MaxChildren ResourceBundle Style contained
syn match   asMetadata        "^\s*\[.*" contains=asMetadataTag,asStringDQ,asComment

syn sync fromstart
syn sync maxlines=300

"ADD

" based on "JavaScript" VIM syntax by Claudio Fleiner <claudio@fleiner.com>

syn case ignore
syn match   actionScriptLineComment			"\/\/.*$"
syn match   actionScriptCommentSkip			"^[ \t]*\*\($\|[ \t]\+\)"
syn region  actionScriptCommentString			start=+"+  skip=+\\\\\|\\"+  end=+"+ end=+\*/+me=s-1,he=s-1 contains=actionScriptSpecial,actionScriptCommentSkip,@htmlPreproc
syn region  actionScriptComment2String			start=+"+  skip=+\\\\\|\\"+  end=+$\|"+  contains=actionScriptSpecial,@htmlPreproc
syn region  actionScriptComment				start="/\*"  end="\*/" contains=actionScriptCommentString,actionScriptCharacter,actionScriptNumber
syn match   actionScriptSpecial				"\\\d\d\d\|\\."
syn region  actionScriptStringD				start=+"+  skip=+\\\\\|\\"+  end=+"+  contains=actionScriptSpecial,@htmlPreproc
syn region  actionScriptStringS				start=+'+  skip=+\\\\\|\\'+  end=+'+  contains=actionScriptSpecial,@htmlPreproc
syn match   actionScriptSpecialCharacter		"'\\.'"
syn match   actionScriptNumber				"-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn keyword actionScriptConditional		 	if else and or not
syn keyword actionScriptRepeat				do while for in
syn keyword actionScriptCase				break continue switch case default
syn keyword actionScriptConstructor			new
syn keyword actionScriptObjects				arguments Array Boolean Date _global Math Number Object String super var this Accessibility Color Key _level Mouse _root Selection Sound Stage System TextFormat LoadVars XML XMLSocket XMLNode LoadVars Button TextField TextSnapshot CustomActions Error ContextMenu ContextMenuItem NetConnection NetStream Video PrintJob MovieClipLoader StyleSheet Camera LocalConnection Microphone SharedObject MovieClip
syn keyword actionScriptStatement			return with
syn keyword actionScriptFunction			function on onClipEvent
syn keyword actionScriptValue				true false undefined null NaN void
syn keyword actionScriptArray				concat join length pop push reverse shift slice sort sortOn splice toString unshift
syn keyword actionScriptDate				getDate getDay getFullYear getHours getMilliseconds getMinutes getMonth getSeconds getTime getTimezoneOffset getUTCDate getUTCDay getUTCFullYear getUTCHours getUTCMilliseconds getUTCMinutes getUTCMonth getUTCSeconds getYear setDate setFullYear setHours setMilliseconds setMinutes setMonth setSeconds setTime setUTCDate setUTCFullYear setUTCHours setUTCMilliseconds setUTCMinutes setUTCMonth setUTCSeconds setYear UTC 
syn keyword actionScriptMath				abs acos asin atan atan2 ceil cos E exp floor log LOG2E LOG10E LN2 LN10 max min PI pow random round sin sqrt SQRT1_2 SQRT2 tan -Infinity Infinity
syn keyword actionScriptNumberObj			MAX_VALUE MIN_VALUE NaN NEGATIVE_INFINITY POSITIVE_INFINITY valueOf 
syn keyword actionScriptObject				addProperty __proto__ registerClass toString unwatch valueOf watch
syn keyword actionScriptString				charAt charCodeAt concat fromCharCode indexOf lastIndexOf length slice split substr substring toLowerCase toUpperCase add le lt gt ge eq ne chr mbchr mblength mbord mbsubstring ord
syn keyword actionScriptColor				getRGB getTransform setRGB setTransform
syn keyword actionScriptKey					addListener BACKSPACE CAPSLOCK CONTROL DELETEKEY DOWN END ENTER ESCAPE getAscii getCode HOME INSERT isDown isToggled LEFT onKeyDown onKeyUp PGDN PGUP removeListener RIGHT SHIFT SPACE TAB UP ALT
syn keyword actionScriptMouse				hide onMouseDown onMouseUp onMouseMove show onMouseWheel
syn keyword actionScriptSelection			getBeginIndex getCaretIndex getEndIndex getFocus setFocus setSelection	
syn keyword actionScriptSound				attachSound duration getBytesLoaded getBytesTotal getPan getTransform getVolume loadSound onLoad onSoundComplete position setPan setTransform setVolume start stop onID3
syn keyword actionScriptStage				align height onResize scaleMode width
syn keyword actionScriptSystem				capabilities hasAudioEncoder hasAccessibility hasAudio hasMP3 language manufacturer os pixelAspectRatio screenColor screenDPI screenResolution.x screenResolution.y version hasVideoEncoder security useCodepage exactSettings hasEmbeddedVideo screenResolutionX screenResolutionY input isDebugger serverString hasPrinting playertype hasStreamingAudio hasScreenBroadcast hasScreenPlayback hasStreamingVideo avHardwareDisable localFileReadDisable windowlesDisable active update description forceSimple noAutoLabeling shortcut silent
syn keyword actionScriptTextFormat			align blockIndent bold bullet color font getTextExtent indent italic leading leftMargin rightMargin size tabStops target underline url	
syn keyword actionScriptCommunication		contentType getBytesLoaded getBytesTotal load loaded onLoad send sendAndLoad toString	addRequestHeader fscommand MMExecute
syn keyword actionScriptXMLSocket			close connect onClose onConnect onData onXML
syn keyword actionScriptTextField			autoSize background backgroundColor border borderColor bottomScroll embedFonts _focusrect getDepth getFontList getNewTextFormat getTextFormat hscroll html htmlText maxChars maxhscroll maxscroll multiline onChanged onScroller onSetFocus _parent password _quality removeTextField replaceSel replaceText restrict selectable setNewTextFormat setTextFormat text textColor textHeight textWidth type variable wordWrap condenseWhite mouseWheelEnabled textFieldHeight textFieldWidth ascent descent
syn keyword actionScriptMethods				callee caller _alpha attachMovie beginFill beginGradientFill clear createEmptyMovieClip createTextField _currentframe curveTo _droptarget duplicateMovieClip enabled endFill focusEnabled _framesloaded getBounds globalToLocal gotoAndPlay gotoAndStop _height _highquality hitArea hitTest lineStyle lineTo loadMovie loadMovieNum loadVariables loadVariablesNum localToGlobal moveTo _name nextFrame onDragOut onDragOver onEnterFrame onKeyDown onKeyUp onKillFocus onMouseDown onMouseMove onMouseUp onPress onRelease onReleaseOutside onRollOut onRollOver onUnload play prevFrame removeMovieClip _rotation setMask _soundbuftime startDrag stopDrag swapDepths tabChildren tabIndex _target _totalframes trackAsMenu unloadMovie unloadMovieNum updateAfterEvent _url useHandCursor _visible _width _x _xmouse _xscale _y _ymouse _yscale tabEnabled asfunction call setInterval clearInterval setProperty stopAllSounds #initclip #endinitclip delete unescape escape eval apply prototype getProperty getTimer getURL getVersion ifFrameLoaded #include instanceof nextScene parseFloat parseInt prevScene print printAsBitmap printAsBitmapNum printNum scroll set targetPath tellTarget toggleHighQuality trace typeof isActive getInstanceAtDepth getNextHighestDepth getNextDepth getSWFVersion getTextSnapshot isFinite isNAN updateProperties _lockroot get install list uninstall showMenu onSelect builtInItems save zoom quality loop rewind forward_back customItems caption separatorBefore visible attachVideo bufferLength bufferTime currentFps onStatus pause seek setBuffertime smoothing time bytesLoaded bytesTotal addPage paperWidth paperHeight pageWidth pageHeight orientation loadClip unloadClip getProgress onLoadStart onLoadProgress onLoadComplete onLoadInit onLoadError styleSheet copy hideBuiltInItem transform activityLevel allowDomain allowInsecureDomain attachAudio bandwidth deblocking domain flush fps gain getLocal getRemote getSize index isConnected keyFrameInterval liveDelay loopback motionLevel motionTimeOut menu muted names onActivity onSync publish rate receiveAudio receiveVideo setFps setGain setKeyFrameInterval setLoopback setMode setMotionLevel setQuality setRate setSilenceLevel setUseEchoSuppression showSettings setClipboard silenceLevel silenceTimeOut useEchoSuppression
syn match   actionScriptBraces				"([{}])"
syn keyword actionScriptException 			try catch finally throw name message
syn keyword actionScriptXML					attributes childNodes cloneNode createElement createTextNode docTypeDecl status firstChild hasChildNodes lastChild insertBefore nextSibling nodeName nodeType nodeValue parentNode parseXML previousSibling removeNode xmlDecl ignoreWhite
syn keyword actionScriptArrayConstant 		CASEINSENSITIVE DESCENDING UNIQUESORT RETURNINDEXEDARRAY NUMERIC
syn keyword actionScriptStringConstant 		newline
syn keyword actionScriptEventConstant 		press release releaseOutside rollOver rollOut dragOver dragOut enterFrame unload mouseMove mouseDown mouseUp keyDown keyUp data
syn keyword actionScriptTextSnapshot 		getCount setSelected getSelected getText getSelectedText hitTestTextNearPos findText setSelectColor
syn keyword actionScriptID3 				id3 artist album songtitle year genre track comment COMM TALB TBPM TCOM TCON TCOP TDAT TDLY TENC TEXT TFLT TIME TIT1 TIT2 TIT3 TKEY TLAN TLEN TMED TOAL TOFN TOLY TOPE TORY TOWN TPE1 TPE2 TPE3 TPE4 TPOS TPUB TRCK TRDA TRSN TRSO TSIZ TSRX TSSE TYER WXXX
syn keyword actionScriptAS2 				class extends public private static interface implements import dynamic evaluate package const include use protected native internal override final 
syn keyword actionScriptStyleSheet 			parse parseCSS getStyle setStyle getStyleNames
syn keyword flash8Functions                             onMetaData onCuePoint flashdisplay flashexternal flashfilters flashgeom flashnet flashtext addCallback applyFilter browse cancel clone colorTransform  containsPoint containsRectangle copyChannel copyPixels createBox createGradientBox deltaTransformPoint dispose download draw equals fillRect floodFill generateFilterRect getColorBoundsRect getPixel getPixel32 identity inflate inflatePoint interpolate intersection intersects invert isEmpty loadBitmap merge noise normalize offsetPoint paletteMap perlinNoise pixelDissolve polar rotate scale setAdvancedAntialiasingTable setEmpty setPixel setPixel32 subtract threshold transformPoint translate union upload
syn keyword flash8Constants  				ALPHANUMERIC_FULL ALPHANUMERIC_HALF CHINESE JAPANESE_HIRAGANA JAPANESE_KATAKANA_FULL JAPANESE_KATAKANA_HALF KOREAN UNKNOWN
syn keyword flash8Properties 				appendChild cacheAsBitmap opaqueBackground scrollRect keyPress #initclip #endinitclip kerning letterSpacing onHTTPStatus lineGradientStyle IME windowlessDisable hasIME hideBuiltInItems onIMEComposition getEnabled setEnabled getConversionMode setConversionMode setCompositionString doConversion idMap antiAliasType available bottom bottomRight concatenatedColorTransform concatenatedMatrix creationDate creator fileList maxLevel modificationDate pixelBounds rectangle rgb top topLeft attachBitmap beginBitmapFill blendMode filters getRect scale9Grid gridFitType sharpness thickness
syn keyword flash8Classes 			BevelFilter BitmapData BitmapFilter BlurFilter ColorMatrixFilter ColorTransform ConvolutionFilter DisplacementMapFilter DropShadowFilter ExternalInterface FileReference FileReferenceList GlowFilter GradientBevelFilter GradientGlowFilter Matrix Point Rectangle TextRenderer StageAlign

syn keyword as3Properties 			compare pixelSnapping loaderInfo  mask  mouseX  mouseY  parent  root  rotation  scaleX  scaleY  x  y mouseChildren numChildren fontName  fontStyle  enumerate  hasGlyphs frame accessibilityImplementation focusRect mouseEnabled content loadeeInfo actionScriptVersion  applicationDomain  frameRate  loaderURL  parameters  securityRelationshipFlags  shared  swfVersion currentFrame  currentLabel  currentScene  framesLoaded  scenes  totalFrames labels numFrames downState hitTestState overState soundTransform upState buttonMode dropTarget focus showDefaultContextMenu  stageFocusRect  stageHeight  stageWidth alwaysShowSelection  bottomScrollV  caretIndex  defaultTextFormat  fontList  maxScrollH  maxScrollV  numLines  scrollH  scrollV  selectionBeginIndex  selectionEndIndex activity mouseTarget contextMenuOwner fullYear month hours minutes seconds milliseconds fullYearUTC monthUTC dateUTC hoursUTC minutesUTC secondsUTC millisecondsUTC timezoneOffset day dayUTC errorID prefix uri localName  ignoreProcessingInstructions ignoreWhitespace ignoreWhitespace ignoreWhitespace hasComplexContent hasSimpleContent inScopeNamespaces namespaceDeclarations nodeKind processingInstructions setChildren setLocalName setName setNamespace setSettings toXMLString ignoreComments attribute child childIndex children comments descendants defaultSettings elements prettyPrinting prettyIndent settings actionsList horizontalScrollPolicy verticalScrollPolicy horizontalLineScrollSize verticalLineScrollSize horizontalScrollPosition verticalScrollPosition maxHorizontalScrollPosition maxVerticalScrollPosition useBitmapScrolling horizontalPageScrollSize verticalPageScrollSize horizontalScrollBar verticalScrollBar percentLoaded autoLoad scaleContent maintainAspectRatio selected autoRepeat emphasized autoRepeat selectedColor hexValue editable showTextField colors imeMode rowCount  selectedIndex     labelField labelFunction selectedItem dropdown value dataProvider dropdownWidth prompt sortableColumns itemEditorInstance columns minColumnWidth rowHeight headerHeight showHeaders sortIndex sortDescending editedItemRenderer editedItemPosition label labelPlacement maximum minimum nextValue previousValue stepSize direction indeterminate percentComplete mode groupName group selectedData numRadioButtons scrollPosition minScrollPosition minScrollPosition maxScrollPosition pageSize pageScrollSize pageScrollSize direction allowMultipleSelection selectedIndices selectedItems lineScrollSize tickInterval snapInterval liveDragging displayAsPassword sourceField sourceFunction columnCount columnWidth innerWidth innerHeight scrollTarget listData sortable resizable itemEditor editorDataField dataField dataField cellRenderer headerRenderer headerText minWidth sortCompareFunction column FieldlineScrollSize sortOptions icon owner row mouseFocusEnabled focusManager itemRenderer reason rowIndex columnIndex item delta keyCode triggerEvent clickTarget autoReplace languageCodeArray stringIDArray onUpdate myInstance defaultButton defaultButtonEnabled nextTabIndex showFocusIndicator defaultButton defaultButtonEnabled nextTabIndex showFocusIndicator registerInstance getComponentStyle clearComponentStyle setComponentStyle fromXMLString getValue getSingleValue getYForX getCubicCoefficients getCubicRoots getQuadraticRoots fromXML  interpolateTransform interpolateColor setTint getValue easingFunction functionName setValue getTween getScaleX setScaleX getScaleY setScaleY getSkewXRadians setSkewXRadians getSkewYRadians setSkewYRadians getSkewX setSkewX getSkewY getSkewY setSkewY getRotationRadians setRotationRadians getRotation setRotation rotateAroundInternalPoint rotateAroundExternalPoint matchInternalPointWithExternal getCurrentKeyframe getNextKeyframe setValue getColorTransform getFilters addKeyframe interpolateFilters interpolateFilter easeIn easeOut easeInOut easeNone transformationPoint autoRewind positionMatrix repeatCount motion isPlaying orientToPath points a b c d brightness tintColor tintMultiplier points affectsTweenable skewX skewY tweens easeQuadPercent tweenScale tweenSnap tweenSync firstFrame rotateDirection rotateTimes blank keyframes keyframesCompact easeNone ease elementType symbolName instanceName linkageID dimensions resume contentAppearance obj prop func begin useSeconds looping finish vp captionCuePointObject captionTarget playWhenEnoughDownloaded seekSeconds seekPercent playheadPercentage preview activeVideoPlayerIndex autoPlay bitrate bufferingBar bufferingBarHidesAndDisablesOthers backButton cuePoints forwardButton fullScreenBackgroundColor fullScreenButton fullScreenSkinDelay fullScreenTakeOver idleTimeout isRTMP isLive metadata metadataLoaded muteButton ncMgr pauseButton playButton playheadTime playheadUpdateInterval playPauseButton preferredHeight preferredWidth progressInterval registrationX registrationY registrationWidth registrationHeight scrubbing seekBar seekBarInterval seekBarScrubTolerance seekToPrevOffset skin skinAutoHide skinBackgroundAlpha skinBackgroundColor skinFadeTime skinScaleMaximum stateResponsive stopButton totalTime visibleVideoPlayerIndex volume volumeBar volumeBarIntervalvolumeBarScrubTolerance showCaptions autoLayout captionTargetName captionButton flvPlaybackName videoPlayerIndex simpleFormatting helperDone videoPlayer timeout streamName streamLength streamWidth volumeBarInterval volumeBarScrubTolerance streamHeight oldBounds oldRegistrationBounds info fallbackServerName code ncConnected ncReconnected iNCManagerClass netStreamClientClass lock unlock rect  accessibilityProperties doubleClickEnabled contentLoaderInfo sharedEvents sameDomain childAllowsParent parentAllowsChild bytes currentLabels displayState fullScreenSourceRect fullScreenWidth fullScreenHeight activating isDefaultPrevented bubbles volumeBarInterval videoHeight cancelable currentTarget relatedObject shiftKey charCode keyLocation ctrlKey altKey localX localY buttonDown stageX stageY level changeList objectID distance angle highlightColor highlightAlpha shadowColor shadowAlpha blurX blurY knockout strength matrixX matrixY divisor bias preserveAlpha mapBitmap mapPoint componentX componentY hideObject alphas ratios redMultiplier greenMultiplier blueMultiplier alphaMultiplier redOffset greenOffset blueOffset alphaOffset tx ty offset songName leftPeak rightPeak videoWidth extension macType client connected client defaultObjectEncoding objectEncoding proxyType connectedProxyType usingTLS bytesAvailable endian dataFormat method requestHeaders hasTLS conversionMode securityDomain currentDomain totalMemory fontSize insideCutoff outsideCutoff sandboxType styleNames useRichTextClipboard displayMode charCount forwardAndBack isAccessible numLock nextNameIndex nextName delay  currentCount running namespaceURI

syn keyword as3Classes				Bitmap BitmapDataChannel CapsStyle DisplayObject DisplayObjectContainer FrameLabel GradientType Graphics InteractiveObject InterpolationMethod JointStyle LineScaleMode Loader MorphShape Scene Shape SimpleButton SpreadMethod Sprite StageQuality StageScaleMode StaticText TextFieldAutoSize TextFieldType ActivityEvent ContextMenuEvent RegExp Namespace uint XMLList constructor QName XMLUI AccImpl ButtonAccImpl CheckBoxAccImpl ComboBoxAccImpl DataGridAccImpl LabelButtonAccImpl ListAccImpl RadioButtonAccImpl SelectableListAccImpl TileListAccImpl UIComponentAccImpl BaseScrollPane ScrollPane UILoader BaseButton ButtonLabelPlacement CheckBox ColorPicker ComboBox DataGrid Label LabelButton NumericStepper ProgressBar ProgressBarDirection ProgressBarMode RadioButton RadioButtonGroup ScrollBar ScrollBarDirection ScrollPolicy SelectableList Slider SliderDirection TextArea TextInput TileList UIScrollBar DataGridCellEditor DataGridColumn HeaderRenderer CellRenderer ICellRenderer ImageCell TileListData IndeterminateBar DataChangeType InvalidationType UIComponent SimpleCollectionItem DataGridEventReason TileListCollectionItem InteractionInputType SliderEventClickTarget Locale LivePreviewParent IFocusManager IFocusManagerComponent IFocusManagerGroup StyleManager Animator MotionEvent BezierEase BezierSegment CustomEase FunctionEase ITween Keyframe MatrixTransformer FLVPlayback FLVPlaybackCaptioning NCManager VideoScaleMode VideoState SimpleEase Tweenables Back Bounce Circular Cubic Elastic Exponential Quadratic Quartic Quintic Sine Blinds Fade Fly Iris Photo Squeeze Transition TransitionManager Tween Wipe Strong CuePointType INCManager NCManagerNative VideoAlign AccessibilityProperties AVM1Movie IBitmapDrawable StageDisplayState LoaderInfo EventDispatcher EventPhase IEventDispatcher BitmapFilterQuality BitmapFilterType DisplacementMapFilterMode ID3Info SoundChannel SoundLoaderContext SoundMixer FileFilter IDynamicPropertyOutput IDynamicPropertyWriter ObjectEncoding Responder SharedObjectFlushStatus DoynamicPropertyWriter Socket URLLoader URLLoaderDataFormat URLRequest URLRequestHeader URLRequestMethod URLStream URLVariables PrintJobOptions PrintJobOrientation IMEConversionMode LoaderContext SecurityDomain SecurityPanel CSMSettings FontType TextColorType TextDisplayMode TextFormatAlign TextLineMetrics ContextMenuBuiltInItems ByteArray Dictionary IDataInput IDataOutput IExternalizable Proxy XMLDocument XMLNodeType
syn keyword as3Packages					flash display errors events fl mx utils adobe containers controls dataGridClasses listClasses progressBarClasses core lang livepreview managers motion easing transitions external geom media net printing profiler ui
syn keyword as3Functions			getPixels setPixels hitTestObject hitTestPoint addChild  addChildAtareInaccessibleObjectsUnderPoint getChildAt  getChildByName  getChildIndex  getObjectsUnderPoint  removeChild  removeChildAt  setChildIndex addChildAt  areInaccessibleObjectsUnderPoint drawCircle  drawEllipse  drawRect  drawRoundRect  drawRoundRectComplex releaseCapture setCapture loadBytes invalidate  isFocusInaccessible appendText  getCharBoundaries  getCharIndexAtPoint  getFirstCharInParagraph  getImageReference  getLineIndexAtPoint  getLineIndexOfChar  getLineLength  getLineMetrics  getLineOffset  getLineText  getParagraphLength replaceSelectedText every filter forEach map  some toLocaleString toDateString toTimeString toLocaleString toLocaleDateString toLocaleTimeString toUTCString getStackTrace toFixed toExponential toPrecision decodeURI decodeURIComponent encodeURI encodeURIComponent isXMLName hasOwnProperty propertyIsEnumerable isPrototypeOf setPropertyIsEnumerable exec test dotall extended global ignoreCase lastIndex source localeCompare replace match search toLocaleLowerCase toLocaleUpperCase addNamespace insertChildAfter insertChildBefore prependChild removeNamespace installActions uninstallActions getActions accept enableAccessibility getStyleDefinition refreshPane scrollDrag setSize setMouseState drawFocus toggle itemToLabel addItem addItemAt removeAll removeItem removeItemAt getItemAt replaceItemAt sortItems sortItemsOn addColumnAt removeColumnAt removeAllColumns getColumnAt getColumnIndex getColumnCount spaceColumnsEqually editField itemToCellRenderer createItemEditor destroyItemEditor getCellRendererAt scrollToIndex resizableColumns addColumn iconField iconFunction setProgress reset getGroup addRadioButton removeRadioButton getRadioButtonIndex getRadioButtonAt setScrollProperties clearSelection invalidateList invalidateItem invalidateItemAt isItemSelected scrollToSelected scrollToSelected setRendererStyle getRendererStyle clearRendererStyle getNextIndexAtLetter mergeStyles clearStyle move validateNow drawNow addItemsAt addItems getItemIndex replaceItem toArray getDefaultLang setDefaultLang addXMLPath addDelayedInstance checkXMLStatus setLoadCallback loadString loadStringEx setString initialize loadLanguageXML getNextFocusManagerComponent showFocus hideFocus findFocusManagerComponent showFocus hideFocus findFocusManagerComponent getNextFocusManagerComponent startTransition continueTo yoyo fforward setScale seekToNavCuePoint seekToNextNavCuePoint seekToPrevNavCuePoint addASCuePoint removeASCuePoint findCuePoint findNearestCuePoint findNearestCuePoint setFLVCuePointEnabled isFLVCuePointEnabled bringVideoPlayerToFront getVideoPlayer closeVideoPlayer enterFullScreenDisplayState findNextCuePointWithName connectToURL connectAgain reconnect swapChildrenAt swapChildren getLoaderInfoByDefinition addEventListener dispatchEvent hasEventListener willTrigger swapChildrenAt formatToString stopPropagation stopImmediatePropagation preventDefault removeEventListener marshallExceptions getCamera getMicrophone containsRect isBuffering checkPolicyFile stopAll computeSpectrum areSoundsInaccessible leftToLeft leftToRight rightToRight rightToLeft pan attachNetStream attachCamera writeDynamicProperty writeDynamicProperties addHeader togglePause registerClassAlias getClassByAlias navigateToURL sendToURL setDirty readBytes writeBytes writeBoolean writeByte writeShort writeInt writeUnsignedInt writeFloat writeDouble writeMultiByte writeUTF writeUTFBytes readBoolean readByte readUnsignedByte readShort readUnsignedShort readInt readUnsignedInt readFloat readDouble readMultiByte readUTF readUTFBytes writeObject readObject decode showRedrawRegions getDefinition hasDefinition currentDomain parentDomain loadPolicyFile exit gc enumerateFonts registerFont getTextRunInfo compress uncompress writeExternal readExternal describeType getQualifiedClassName getDefinitionByName getQualifiedSuperclassName escapeMultiByte unescapeMultiByte setTimeout clearTimeout callProperty hasProperty deleteProperty getDescendants isAttribute getNamespaceForPrefix getPrefixForNamespace 

syn keyword as3Constants			ALPHA BLUE GREEN RED DARKEN  DIFFERENCE  ERASE  HARDLIGHT  LAYER  LIGHTEN  MULTIPLY  NORMAL  OVERLAY  SCREEN  NONE  SQUARE LINEAR RADIAL LINEAR_RGB BEVEL MITER HORIZONTAL VERTICAL LOADER_SECURITY_CHILD_ALLOWS_PARENT  LOADER_SECURITY_PARENT_ALLOWS_CHILD  LOADER_SECURITY_SAME_DOMAIN ALWAYS AUTO NEVER PAD REFLECT REPEAT BOTTOM_LEFT  BOTTOM_RIGHT  TOP_LEFT  TOP_RIGHT  BEST  HIGH  LOW  MEDIUM  EXACT_FIT  NO_BORDER  NO_SCALE  SHOW_ALL CENTER MENU_ITEM_SELECT  MENU_SELECT  ACTIVATE  ADDED  CHANGE  COMPLETE  DEACTIVATE  ENTER_FRAME  INIT  MOUSE_LEAVE  OPEN  REMOVED  RENDER  RESIZE  SELECT  SOUND_COMPLETE  TAB_CHILDREN_CHANGE  TAB_ENABLED_CHANGE  TAB_INDEX_CHANGE  TIMER_COMPLETE AT_TARGET  BUBBLING_PHASE  CAPTURING_PHASE  FOCUS_IN  FOCUS_OUT  KEY_FOCUS_CHANGE  MOUSE_FOCUS_CHANGE  HTTP_STATUS  IME_COMPOSITION  IO_ERROR  KEY_DOWN  KEY_UP  CLICK  DOUBLE_CLICK  MOUSE_DOWN  MOUSE_MOVE  MOUSE_OUT  MOUSE_OVER  MOUSE_UP  MOUSE_WHEEL  ROLL_OUT  ROLL_OVER  NET_STATUS  POLICY_FILE  PROGRESS  SOCKET_DATA  SECURITY_ERROR  SYNC  LINK  TEXT_INPUT  TIMER  FULL  INNER  OUTER  CLAMP  IGNORE  WRAP  BINARY  VARIABLES  AMF0  AMF3  POST  LANDSCAPE  PORTRAIT  LOCAL_STORAGE  PRIVACY  SETTINGS_MANAGER  ADVANCED  GLOBAL_ADVANCED_ANTIALIASING_OFF  GLOBAL_ADVANCED_ANTIALIASING_ON  GLOBAL_ADVANCED_ANTIALIASING_TEXTFIELD_CONTROL  DARK_COLOR  LIGHT_COLOR  BOLD_ITALIC  PIXEL  SUBPIXEL  JUSTIFY  CAPS_LOCK  F1  F10  F11  F12  F13  F14  F15  F2  F3  F4  F5  F6  F7  F8  F9  NUMPAD_0  NUMPAD_1  NUMPAD_2  NUMPAD_3  NUMPAD_4  NUMPAD_5  NUMPAD_6  NUMPAD_7  NUMPAD_8  NUMPAD_9  NUMPAD_ADD  NUMPAD_DECIMAL  NUMPAD_DIVIDE  NUMPAD_ENTER  NUMPAD_MULTIPLY  NUMPAD_SUBTRACT  PAGE_DOWN  PAGE_UP  NUM_PAD  STANDARD  BIG_ENDIAN  LITTLE_ENDIAN  ELEMENT_NODE  TEXT_NODE BUTTON_DOWN ITEM_ROLL_OUT ITEM_ROLL_OVER ITEM_FOCUS_OUT ITEM_FOCUS_IN ITEM_EDIT_END ITEM_EDIT_BEGIN ITEM_EDIT_BEGINNING COLUMN_STRETCH HEADER_RELEASE LABEL_CHANGE MANUAL POLLED OFF ITEM_DOUBLE_CLICK ITEM_CLICK THUMB_DRAG THUMB_RELEASE THUMB_PRESS ALL STYLES RENDERER_STYLES STATE DATA_CHANGE PRE_DATA_CHANGE MOVE DATA_CHANGE PRE_DATA_CHANGE INVALIDATE_ALL REMOVE REMOVE_ALL CANCELLED OTHER NEW_COLUMN NEW_ROW KEYBOARD THUMB TIME_CHANGE MOTION_UPDATE MOTION_START MOTION_END CW CCW SCALE_X SCALE_Y SKEW_X SKEW_Y CIRCLE OUT MOTION_STOP MOTION_START MOTION_RESUME MOTION_LOOP MOTION_FINISH MOTION_CHANGE AUTO_LAYOUT CAPTION_CHANGE CAPTION_TARGET_CREATED NAVIGATION FLV ACTIONSCRIPT SHORT_VERSION SOUND_UPDATE STOPPED_STATE_ENTERED STATE_CHANGE SKIN_LOADED SKIN_ERROR SEEKED SCRUB_START SCRUB_FINISH LAYOUT READY PLAYHEAD_UPDATE PLAYING_STATE_ENTERED PAUSED_STATE_ENTERED METADATA_RECEIVED FAST_FORWARD CUE_POINT BUFFERING_STATE_ENTERED AUTO_REWOUND AUTO_LAYOUT SHORT_VERSION CAPTION_TARGET_CREATED CAPTION_CHANGE LAYOUT METADATA_RECEIVED CUE_POINT VERSION SHORT_VERSION DEFAULT_TIMEOUT NO_CONNECTION ILLEGAL_CUE_POINT INVALID_SEEK INVALID_SOURCE INVALID_XML NO_BITRATE_MATCH DELETE_DEFAULT_PLAYER INCMANAGER_CLASS_UNSET NULL_URL_LOAD MISSING_SKIN_STYLE UNSUPPORTED_PROPERTY NETSTREAM_CLIENT_CLASS_UNSET MAINTAIN_ASPECT_RATIO NO_SCALE EXACT_FIT DISCONNECTED STOPPED PLAYING PAUSED BUFFERING LOADING CONNECTION_ERROR REWINDING SEEKING RESIZING ACTIONSCRIPT2 ACTIONSCRIPT3 REMOVED_FROM_STAGE ADDED_TO_STAGE FULL_SCREEN NORMAL FLASH1 FLASH2 FLASH3 FLASH4 FLASH5 FLASH6 FLASH7 FLASH8 FLASH9 FLASH10 ASYNC_ERROR UPLOAD_COMPLETE_DATA FULLSCREEN FLUSHED PENDING REMOTE LOCAL_WITH_FILE LOCAL_WITH_NETWORK LOCAL_TRUSTED REGULAR EMBEDDED DEVICE LCD CRT
syn keyword actionScriptInclude #include #initClip #endInitClip
syn keyword as3Errors EOFError  IllegalOperationError  IOError  MemoryError  ScriptTimeoutError  StackOverflowError ArgumentError DefinitionError EvalError RangeError ReferenceError SecurityError SyntaxError TypeError URIError VerifyError VideoError InvalidSWFError
syn keyword as3Events	DataEvent ErrorEvent Event ScrollEvent ProgressEvent SecurityErrorEvent ComponentEvent ProgressEvent IOErrorEvent ComponentEvent ColorPickerEvent ListEvent MouseEvent TextEvent DataChangeEvent HTTPStatusEvent IMEEvent TimerEvent TweenEvent AutoLayoutEvent CaptionChangeEvent CaptionTargetEvent SoundEvent VideoEvent  SkinErrorEvent LayoutEvent VideoProgressEvent MetadataEvent IVPEvent KeyboardEvent FocusEvent FullScreenEvent AsyncErrorEvent FocusEvent KeyboardEvent NetStatusEvent StatusEvent SyncEvent DataGridEvent SliderEvent

highligh def link asClasses Type
highligh asAIRClasses ctermfg=darkcyan guifg=darkcyan
highligh def link asInterfaces Function
highligh asAIRInterfaces ctermfg=darkblue guifg=darkblue
highligh def link asFunctions Function
highligh asAIRFunctions ctermfg=darkblue guifg=darkblue
highligh def link asConstants Constant
highligh asAIRConstants ctermfg=darkred guifg=darkred

" Top Level
syn keyword asFunctions Array Boolean decodeURI decodeURIComponent encodeURI encodeURIComponent escape int isFinite isNaN isXMLName Number Object parseFloat parseInt String trace uint unescape Vector XML XMLList
syn keyword asClasses ArgumentError arguments Array Boolean Class Date DefinitionError Error EvalError Function int Math Namespace Number Object QName RangeError ReferenceError RegExp SecurityError String SyntaxError TypeError uint URIError Vector VerifyError XML XMLList
syn keyword asConstants Infinity -Infinity NaN undefined

" air.net
syn keyword asAIRClasses ServiceMonitor SocketMonitor URLMonitor

" air.update
syn keyword asAIRClasses ApplicationUpdater ApplicationUpdaterUI

" air.update.events
syn keyword asAIRClasses DownloadErrorEvent StatusFileUpdateErrorEvent StatusFileUpdateEvent StatusUpdateErrorEvent StatusUpdateEvent UpdateEvent

" com.adobe.fiber.runtime.lib
syn keyword asClasses CollectionFunc ConversionFunc DateTimeFunc MathFunc StringFunc

" com.adobe.fiber.services
syn keyword asInterfaces IFiberManagingService IFiberService

" com.adobe.fiber.services.wrapper
syn keyword asClasses AbstractServiceWrapper DataServiceWrapper HTTPServiceWrapper RemoteObjectServiceWrapper WebServiceWrapper

" com.adobe.fiber.styles
syn keyword asInterfaces ILocalizeableMessage IStyle
syn keyword asClasses LocalizeableMessage Style StyleValidator

" com.adobe.fiber.util
syn keyword asClasses FiberUtils

" com.adobe.fiber.valueobjects
syn keyword asInterfaces IModelInstance IModelType IPropertyIterator IValueObject
syn keyword asClasses AbstractEntityMetadata AvailablePropertyIterator

" com.adobe.viewsource
syn keyword asClasses ViewSource

" flash.accessibility
syn keyword asClasses Accessibility AccessibilityImplementation AccessibilityProperties

" flash.data
syn keyword asAIRClasses EncryptedLocalStore SQLCollationType SQLColumnNameStyle SQLColumnSchema SQLConnection SQLIndexSchema SQLMode SQLResult SQLSchema SQLSchemaResult SQLStatement SQLTableSchema SQLTransactionLockType SQLTriggerSchema SQLViewSchema

" flash.desktop
syn keyword asAIRClasses DockIcon Icon InteractiveIcon InvokeEventReason NativeApplication NativeDragActions NativeDragManager NativeDragOptions NotificationType SystemTrayIcon Updater
syn keyword asClasses Clipboard ClipboardFormats ClipboardTransferMode

" flash.display
syn keyword asInterfaces IBitmapDrawable IGraphicsData IGraphicsFill IGraphicsPath IGraphicsStroke
syn keyword asAIRClasses FocusDirection NativeMenu NativeMenuItem NativeWindow NativeWindowDisplayState NativeWindowInitOptions NativeWindowResize NativeWindowSystemChrome NativeWindowType Screen
syn keyword asClasses ActionScriptVersion AVM1Movie Bitmap BitmapData BitmapDataChannel BlendMode CapsStyle ColorCorrection ColorCorrectionSupport DisplayObject DisplayObjectContainer FrameLabel GradientType Graphics GraphicsBitmapFill GraphicsEndFill GraphicsGradientFill GraphicsPath GraphicsPathCommand GraphicsPathWinding GraphicsShaderFill GraphicsSolidFill GraphicsStroke GraphicsTrianglePath InteractiveObject InterpolationMethod JointStyle LineScaleMode Loader LoaderInfo MorphShape MovieClip PixelSnapping Scene Shader ShaderData ShaderInput ShaderJob ShaderParameter ShaderParameterType ShaderPrecision Shape SimpleButton SpreadMethod Sprite Stage StageAlign StageDisplayState StageQuality StageScaleMode SWFVersion TriangleCulling

" flash.errors
syn keyword asClasses EOFError IllegalOperationError InvalidSWFError IOError MemoryError ScriptTimeoutError StackOverflowError
syn keyword asAIRClasses DRMManagerError SQLError SQLErrorOperation

" flash.events
syn keyword asInterfaces IEventDispatcher
syn keyword asAIRClasses BrowserInvokeEvent DRMAuthenticateEvent DRMAuthenticationCompleteEvent DRMAuthenticationErrorEvent DRMErrorEvent DRMStatusEvent FileListEvent HTMLUncaughtScriptExceptionEvent InvokeEvent NativeDragEvent NativeWindowBoundsEvent NativeWindowDisplayStateEvent OutputProgressEvent ScreenMouseEvent SQLErrorEvent SQLEvent SQLUpdateEvent
syn keyword asClasses ActivityEvent AsyncErrorEvent ContextMenuEvent DataEvent ErrorEvent Event EventDispatcher EventPhase FocusEvent FullScreenEvent HTTPStatusEvent IMEEvent IOErrorEvent KeyboardEvent MouseEvent NetStatusEvent ProgressEvent SampleDataEvent SecurityErrorEvent ShaderEvent StatusEvent SyncEvent TextEvent TimerEvent

" flash.external
syn keyword asClasses ExternalInterface

" flash.filesystem
syn keyword asAIRClasses File FileMode FileStream

" flash.filters
syn keyword asClasses BevelFilter BitmapFilter BitmapFilterQuality BitmapFilterType BlurFilter ColorMatrixFilter ConvolutionFilter DisplacementMapFilter DisplacementMapFilterMode DropShadowFilter GlowFilter GradientBevelFilter GradientGlowFilter ShaderFilter

" flash.geom
syn keyword asClasses ColorTransform Matrix Matrix3D Orientation3D PerspectiveProjection Point Rectangle Transform Utils3D Vector3D

" flash.html
syn keyword asAIRClasses HTMLHistoryItem HTMLHost HTMLLoader HTMLPDFCapability HTMLWindowCreateOptions

" flash.media
syn keyword asFunctions scanHardware
syn keyword asClasses Camera ID3Info Microphone Sound SoundChannel SoundCodec SoundLoaderContext SoundMixer SoundTransform Video

" flash.net
syn keyword asFunctions getClassByAlias navigateToURL registerClassAlias sendToURL
syn keyword asInterfaces IDynamicPropertyOutput IDynamicPropertyWriter
syn keyword asAIRClasses URLRequestDefaults
syn keyword asClasses FileFilter FileReference FileReferenceList LocalConnection NetConnection NetStream NetStreamInfo NetStreamPlayOptions NetStreamPlayTransitions ObjectEncoding Responder SharedObject SharedObjectFlushStatus Socket URLLoader URLLoaderDataFormat URLRequest URLRequestHeader URLRequestMethod URLStream URLVariables XMLSocket

" flash.net.drm
syn keyword asAIRClasses AuthenticationMethod DRMContentData DRMManager DRMPlaybackTimeWindow DRMVoucher LoadVoucherSetting

" flash.printing
syn keyword asClasses PrintJob PrintJobOptions PrintJobOrientation

" flash.profiler
syn keyword asFunctions showRedrawRegions

" flash.sampler
syn keyword asFunctions clearSamples getGetterInvocationCount getInvocationCount getMemberNames getSampleCount getSamples getSetterInvocationCount getSize isGetterSetter pauseSampling startSampling stopSampling
syn keyword asClasses DeleteObjectSample NewObjectSample Sample StackFrame

" flash.security
syn keyword asAIRInterfaces IURIDereferencer
syn keyword asAIRClasses ReferencesValidationSetting RevocationCheckSettings SignatureStatus SignerTrustSettings XMLSignatureValidator

" flash.system
syn keyword asFunctions fscommand
syn keyword asClasses ApplicationDomain Capabilities IME IMEConversionMode JPEGLoaderContext LoaderContext Security SecurityDomain SecurityPanel System

" flash.text
syn keyword asClasses AntiAliasType CSMSettings Font FontStyle FontType GridFitType StaticText StyleSheet TextColorType TextDisplayMode TextExtent TextField TextFieldAutoSize TextFieldType TextFormat TextFormatAlign TextLineMetrics TextRenderer TextSnapshot

" flash.text.engine
syn keyword asClasses BreakOpportunity CFFHinting ContentElement DigitCase DigitWidth EastAsianJustifier ElementFormat FontDescription FontLookup FontMetrics FontPosture FontWeight GraphicElement GroupElement JustificationStyle Kerning LigatureLevel LineJustification RenderingMode SpaceJustifier TabAlignment TabStop TextBaseline TextBlock TextElement TextJustifier TextLine TextLineCreationResult TextLineMirrorRegion TextLineValidity TextRotation TypographicCase

" flash.text.ime
syn keyword asInterfaces IIMEClient
syn keyword asClasses CompositionAttributeRange

" flash.ui
syn keyword asClasses ContextMenu ContextMenuBuiltInItems ContextMenuClipboardItems ContextMenuItem Keyboard KeyLocation Mouse MouseCursor

" flash.utils
syn keyword asFunctions clearInterval clearTimeout describeType escapeMultiByte getDefinitionByName getQualifiedClassName getQualifiedSuperclassName getTimer setInterval setTimeout unescapeMultiByte
syn keyword asInterfaces IDataInput IDataOutput IExternalizable
syn keyword asAIRClasses CompressionAlgorithm
syn keyword asClasses ByteArray Dictionary Endian Proxy Timer

" flash.xml
syn keyword asClasses XMLDocument XMLNode XMLNodeType

" flashx.textLayout
syn keyword asClasses BuildInfo

" flashx.textLayout.compose
syn keyword asInterfaces IFlowComposer ISWFContext ITextLineCreator IVerticalJustificationLine
syn keyword asClasses FlowComposerBase FlowDamageType StandardFlowComposer TextFlowLine TextFlowLineLocation TextLineRecycler

" flashx.textLayout.container
syn keyword asInterfaces ISandboxSupport
syn keyword asClasses ColumnState ContainerController ScrollPolicy TextContainerManager

" flashx.textLayout.conversion
syn keyword asInterfaces ITextExporter ITextImporter
syn keyword asClasses ConversionType PlainTextExporter TextConverter

" flashx.textLayout.edit
syn keyword asInterfaces IEditManager IInteractionEventHandler ISelectionManager
syn keyword asClasses EditingMode EditManager ElementRange SelectionFormat SelectionManager SelectionState TextClipboard TextScrap

" flashx.textLayout.elements
syn keyword asInterfaces IConfiguration IFormatResolver
syn keyword asClasses BreakElement Configuration ContainerFormattedElement DivElement FlowElement FlowGroupElement FlowLeafElement GlobalSettings InlineGraphicElement InlineGraphicElementStatus LinkElement LinkState OverflowPolicy ParagraphElement ParagraphFormattedElement SpanElement SpecialCharacterElement SubParagraphGroupElement TabElement TCYElement TextFlow TextRange

" flashx.textLayout.events
syn keyword asClasses CompositionCompleteEvent DamageEvent FlowElementMouseEvent FlowOperationEvent SelectionEvent StatusChangeEvent TextLayoutEvent UpdateCompleteEvent

" flashx.textLayout.factory
syn keyword asClasses StringTextLineFactory TextFlowTextLineFactory TextLineFactoryBase TruncationOptions

" flashx.textLayout.formats
syn keyword asInterfaces ITabStopFormat ITextLayoutFormat
syn keyword asClasses BackgroundColor BaselineOffset BaselineShift BlockProgression Direction FormatValue IMEStatus JustificationRule LeadingModel LineBreak TabStopFormat TextAlign TextDecoration TextJustify TextLayoutFormat TLFTypographicCase VerticalAlign WhiteSpaceCollapse

" flashx.textLayout.operations
syn keyword asClasses ApplyElementIDOperation ApplyElementStyleNameOperation ApplyElementUserStyleOperation ApplyFormatOperation ApplyFormatToElementOperation ApplyLinkOperation ApplyTCYOperation ClearFormatOnElementOperation ClearFormatOperation CompositeOperation CopyOperation CutOperation DeleteTextOperation FlowElementOperation FlowOperation FlowTextOperation InsertInlineGraphicOperation InsertTextOperation ModifyInlineGraphicOperation PasteOperation RedoOperation SplitParagraphOperation UndoOperation

" flashx.textLayout.utils
syn keyword asClasses CharacterUtil NavigationUtil

" flashx.undo
syn keyword asInterfaces IOperation IUndoManager
syn keyword asClasses UndoManager

" mx.accessibility
syn keyword asClasses AccConst AccImpl AccordionHeaderAccImpl AdvancedDataGridAccImpl AlertAccImpl ButtonAccImpl CheckBoxAccImpl ColorPickerAccImpl ComboBaseAccImpl ComboBoxAccImpl DataGridAccImpl DateChooserAccImpl DateFieldAccImpl LabelAccImpl LinkButtonAccImpl ListAccImpl ListBaseAccImpl MenuAccImpl MenuBarAccImpl PanelAccImpl RadioButtonAccImpl SliderAccImpl TabBarAccImpl TitleWindowAccImpl TreeAccImpl UIComponentAccProps

" mx.automation
syn keyword asInterfaces IAutomationClass IAutomationClass2 IAutomationEnvironment IAutomationEventDescriptor IAutomationManager IAutomationManager2 IAutomationMethodDescriptor IAutomationMouseSimulator IAutomationObject IAutomationObjectHelper IAutomationPropertyDescriptor IAutomationTabularData
syn keyword asClasses Automation AutomationClass AutomationError AutomationEventDescriptor AutomationHelper AutomationID AutomationIDPart AutomationManager AutomationMethodDescriptor AutomationPropertyDescriptor

" mx.automation.delegates.advancedDataGrid
syn keyword asClasses AdvancedDataGridAutomationImpl AdvancedDataGridBaseExAutomationImpl AdvancedDataGridGroupItemRendererAutomationImpl AdvancedDataGridItemRendererAutomationImpl AdvancedListBaseAutomationImpl AdvancedListBaseContentHolderAutomationImpl OLAPDataGridAutomationImpl OLAPDataGridGroupRendererAutomationImpl

" mx.automation.delegates.charts
syn keyword asClasses AreaSeriesAutomationImpl AxisRendererAutomationImpl BarSeriesAutomationImpl BubbleSeriesAutomationImpl CartesianChartAutomationImpl ChartBaseAutomationImpl ColumnSeriesAutomationImpl HLOCSeriesBaseAutomationImpl LegendAutomationImpl LegendItemAutomationImpl LineSeriesAutomationImpl PieSeriesAutomationImpl PlotSeriesAutomationImpl SeriesAutomationImpl

" mx.automation.delegates
syn keyword asClasses DragManagerAutomationImpl TextFieldAutomationHelper

" mx.automation.delegates.containers
syn keyword asClasses AccordionAutomationImpl ApplicationAutomationImpl BoxAutomationImpl CanvasAutomationImpl DividedBoxAutomationImpl FormAutomationImpl FormItemAutomationImpl PanelAutomationImpl TabNavigatorAutomationImpl ViewStackAutomationImpl

" mx.automation.delegates.controls
syn keyword asClasses AlertAutomationImpl AlertFormAutomationImpl ButtonAutomationImpl ButtonBarAutomationImpl CheckBoxAutomationImpl ColorPickerAutomationImpl ComboBaseAutomationImpl ComboBoxAutomationImpl DataGridAutomationImpl DataGridItemRendererAutomationImpl DateChooserAutomationImpl DateFieldAutomationImpl LabelAutomationImpl LinkBarAutomationImpl ListAutomationImpl ListBaseAutomationImpl ListBaseContentHolderAutomationImpl ListItemRendererAutomationImpl MenuAutomationImpl MenuBarAutomationImpl MenuBarItemAutomationImpl MenuItemRendererAutomationImpl NavBarAutomationImpl NumericStepperAutomationImpl PopUpButtonAutomationImpl ProgressBarAutomationImpl RadioButtonAutomationImpl ScrollBarAutomationImpl SliderAutomationImpl SWFLoaderAutomationImpl TextAreaAutomationImpl TextInputAutomationImpl TileBaseAutomationImpl TileListItemRendererAutomationImpl ToggleButtonBarAutomationImpl ToolTipAutomationImpl TreeAutomationImpl TreeItemRendererAutomationImpl VideoDisplayAutomationImpl

" mx.automation.delegates.core
syn keyword asClasses ContainerAutomationImpl RepeaterAutomationImpl ScrollControlBaseAutomationImpl UIComponentAutomationImpl UITextFieldAutomationImpl

" mx.automation.delegates.flashflexkit
syn keyword asClasses ContainerMovieClipAutomationImpl FlexContentHolderAutomationImpl UIMovieClipAutomationImpl

" mx.automation.events
syn keyword asClasses AdvancedDataGridHeaderShiftEvent AdvancedDataGridItemSelectEvent AutomationAirEvent AutomationDragEvent AutomationDragEventWithPositionInfo AutomationEvent AutomationRecordEvent AutomationReplayEvent ChartSelectionChangeEvent EventDetails ListItemSelectEvent MarshalledAutomationEvent MenuShowEvent TextSelectionEvent

" mx.binding
syn keyword asInterfaces IBindingClient

" mx.binding.utils
syn keyword asClasses BindingUtils ChangeWatcher

" mx.charts.chartClasses
syn keyword asInterfaces IAxis IAxisRenderer IBar IChartElement IChartElement2 IColumn IDataCanvas IStackable IStackable2
syn keyword asClasses AxisBase AxisLabelSet BoundedValue CartesianCanvasValue CartesianChart CartesianDataCanvas CartesianTransform ChartBase ChartElement ChartItemDragProxy ChartLabel ChartState DataDescription DataTip DataTransform DateRangeUtilities DualStyleObject GraphicsUtilities HLOCSeriesBase InstanceCache LegendData NumericAxis PolarChart PolarDataCanvas PolarTransform RenderData Series StackedSeries

" mx.charts
syn keyword asClasses AreaChart AxisLabel AxisRenderer BarChart BubbleChart CandlestickChart CategoryAxis ChartItem ColumnChart DateTimeAxis GridLines HitData HLOCChart Legend LegendItem LinearAxis LineChart LogAxis PieChart PlotChart

" mx.charts.effects
syn keyword asClasses SeriesEffect SeriesInterpolate SeriesSlide SeriesZoom

" mx.charts.effects.effectClasses
syn keyword asClasses SeriesEffectInstance SeriesInterpolateInstance SeriesSlideInstance SeriesZoomInstance

" mx.charts.events
syn keyword asClasses ChartEvent ChartItemEvent LegendMouseEvent

" mx.charts.renderers
syn keyword asClasses AreaRenderer BoxItemRenderer CandlestickItemRenderer CircleItemRenderer CrossItemRenderer DiamondItemRenderer HLOCItemRenderer LineRenderer ShadowBoxItemRenderer ShadowLineRenderer TriangleItemRenderer WedgeItemRenderer

" mx.charts.series
syn keyword asClasses AreaSeries AreaSet BarSeries BarSet BubbleSeries CandlestickSeries ColumnSeries ColumnSet HLOCSeries LineSeries PieSeries PlotSeries

" mx.charts.series.items
syn keyword asClasses AreaSeriesItem BarSeriesItem BubbleSeriesItem ColumnSeriesItem HLOCSeriesItem LineSeriesItem LineSeriesSegment PieSeriesItem PlotSeriesItem

" mx.charts.series.renderData
syn keyword asClasses AreaSeriesRenderData BarSeriesRenderData BubbleSeriesRenderData ColumnSeriesRenderData HLOCSeriesRenderData LineSeriesRenderData PieSeriesRenderData PlotSeriesRenderData

" mx.charts.styles
syn keyword asClasses HaloDefaults

" mx.collections
syn keyword asInterfaces ICollectionView IGroupingCollection IGroupingCollection2 IHierarchicalCollectionView IHierarchicalCollectionViewCursor IHierarchicalData IList ISummaryCalculator IViewCursor
syn keyword asClasses ArrayCollection ArrayList AsyncListView CursorBookmark DefaultSummaryCalculator Grouping GroupingCollection GroupingCollection2 GroupingField HierarchicalCollectionView HierarchicalCollectionViewCursor HierarchicalData ItemResponder ListCollectionView Sort SortField SummaryField SummaryField2 SummaryObject SummaryRow XMLListCollection

" mx.collections.errors
syn keyword asClasses ChildItemPendingError CollectionViewError CursorError ItemPendingError SortError

" mx.containers.accordionClasses
syn keyword asClasses AccordionHeader

" mx.containers
syn keyword asClasses Accordion ApplicationControlBar Box BoxDirection Canvas ControlBar DividedBox Form FormHeading FormItem FormItemDirection Grid GridItem GridRow HBox HDividedBox Panel TabNavigator Tile TileDirection TitleWindow VBox VDividedBox ViewStack

" mx.containers.dividedBoxClasses
syn keyword asClasses BoxDivider

" mx.containers.errors
syn keyword asClasses ConstraintError

" mx.containers.utilityClasses
syn keyword asInterfaces IConstraintLayout
syn keyword asClasses ConstraintColumn ConstraintRow PostScaleAdapter

" mx.controls.advancedDataGridClasses
syn keyword asInterfaces IAdvancedDataGridRendererProvider
syn keyword asClasses AdvancedDataGridBase AdvancedDataGridBaseSelectionData AdvancedDataGridColumn AdvancedDataGridColumnGroup AdvancedDataGridDragProxy AdvancedDataGridGroupItemRenderer AdvancedDataGridHeaderInfo AdvancedDataGridHeaderRenderer AdvancedDataGridItemRenderer AdvancedDataGridListData AdvancedDataGridRendererDescription AdvancedDataGridRendererProvider AdvancedDataGridSortItemRenderer FTEAdvancedDataGridItemRenderer MXAdvancedDataGridItemRenderer SortInfo

" mx.controls
syn keyword asInterfaces IFlexContextMenu
syn keyword asAIRClasses FileSystemComboBox FileSystemDataGrid FileSystemEnumerationMode FileSystemHistoryButton FileSystemList FileSystemSizeDisplayMode FileSystemTree FlexNativeMenu HTML
syn keyword asClasses AdvancedDataGrid AdvancedDataGridBaseEx Alert Button ButtonBar ButtonLabelPlacement CheckBox ColorPicker ComboBase ComboBox DataGrid DateChooser DateField FormItemLabel HorizontalList HRule HScrollBar HSlider Image Label LinkBar LinkButton List Menu MenuBar MXFTETextInput NavBar NumericStepper OLAPDataGrid PopUpButton PopUpMenuButton ProgressBar ProgressBarDirection ProgressBarLabelPlacement ProgressBarMode RadioButton RadioButtonGroup RichTextEditor Spacer SWFLoader TabBar Text TextArea TextInput TileList ToggleButtonBar ToolTip Tree VideoDisplay VRule VScrollBar VSlider

" mx.controls.dataGridClasses
syn keyword asClasses DataGridBase DataGridColumn DataGridDragProxy DataGridHeader DataGridHeaderBase DataGridItemRenderer DataGridListData DataGridLockedRowContentHolder FTEDataGridItemRenderer MXDataGridItemRenderer

" mx.controls.listClasses
syn keyword asInterfaces IDropInListItemRenderer IListItemRenderer
syn keyword asClasses AdvancedListBase BaseListData ListBase ListBaseContentHolder ListBaseSeekPending ListBaseSelectionData ListData ListItemDragProxy ListItemRenderer ListRowInfo MXItemRenderer TileBase TileBaseDirection TileListItemRenderer

" mx.controls.menuClasses
syn keyword asInterfaces IMenuBarItemRenderer IMenuDataDescriptor IMenuItemRenderer
syn keyword asClasses MenuBarItem MenuItemRenderer MenuListData

" mx.controls.olapDataGridClasses
syn keyword asClasses OLAPDataGridGroupRenderer OLAPDataGridHeaderRendererProvider OLAPDataGridItemRendererProvider OLAPDataGridRendererProvider

" mx.controls.scrollClasses
syn keyword asClasses ScrollBar ScrollBarDirection ScrollThumb

" mx.controls.sliderClasses
syn keyword asClasses Slider SliderDataTip SliderDirection SliderLabel SliderThumb

" mx.controls.textClasses
syn keyword asClasses TextRange

" mx.controls.treeClasses
syn keyword asInterfaces ITreeDataDescriptor ITreeDataDescriptor2
syn keyword asClasses DefaultDataDescriptor MXTreeItemRenderer TreeItemRenderer TreeListData

" mx.controls.videoClasses
syn keyword asClasses CuePointManager VideoError

" mx.core
syn keyword asInterfaces IBorder IButton IChildList IConstraintClient IContainer IDataRenderer IDeferredContentOwner IDeferredInstance IDeferredInstantiationUIComponent IFactory IFlexAsset IFlexDisplayObject IFlexModule IFlexModuleFactory IFontContextComponent IIMESupport IInvalidating ILayoutElement IMXMLObject INavigatorContent IProgrammaticSkin IPropertyChangeNotifier IRawChildrenContainer IRectangularBorder IRepeater IRepeaterClient ISelectableList IStateClient IStateClient2 ISWFBridgeGroup ISWFBridgeProvider ISWFLoader ITextInput IToggleButton IToolTip ITransientDeferredInstance IUIComponent IUID IUITextField IVisualElement IVisualElementContainer
syn keyword asAIRInterfaces IWindow
syn keyword asAIRClasses FlexHTMLLoader Window WindowedApplication
syn keyword asClasses Application BitmapAsset ButtonAsset ByteArrayAsset ClassFactory ComponentDescriptor Container ContainerCreationPolicy ContainerLayout ContextualClassFactory DeferredInstanceFromClass DeferredInstanceFromFunction DesignLayer DragSource EdgeMetrics EventPriority FlexBitmap FlexGlobals FlexLoader FlexMovieClip FlexShape FlexSimpleButton FlexSprite FlexTextField FlexVersion FontAsset FTETextField LayoutContainer MovieClipAsset MovieClipLoaderAsset MXMLObjectAdapter Repeater ScrollControlBase ScrollPolicy SoundAsset SpriteAsset SWFBridgeGroup TextFieldAsset UIComponent UIComponentCachePolicy UIComponentDescriptor UIFTETextField UITextField UITextFormat

" mx.core.windowClasses
syn keyword asAIRClasses StatusBar TitleBar

" mx.data
syn keyword asInterfaces IAccessPrivileges IChangeObject IManaged IPagedList ITokenResponder
syn keyword asClasses AccessPrivileges CacheDataDescriptor Conflict ConflictDetector Conflicts DataManager DataService DataServiceAdapter DataStore ItemReference ManagedAssociation ManagedObjectProxy ManagedOperation ManagedQuery ManualSyncConfiguration MessageBatch MessageCacheItem MessagingDataServiceAdapter PageInformation RPCDataManager RPCDataServiceAdapter UpdateCollectionRange

" mx.data.errors
syn keyword asClasses DataServiceError NoDataAvailableError UnresolvedConflictsError

" mx.data.events
syn keyword asClasses DataConflictEvent DataServiceFaultEvent DataServiceResultEvent UnresolvedConflictsEvent

" mx.data.messages
syn keyword asClasses DataErrorMessage DataMessage PagedMessage SequencedMessage UpdateCollectionMessage

" mx.data.mxml
syn keyword asClasses DataService

" mx.data.utils
syn keyword asClasses Managed

" mx.effects
syn keyword asInterfaces IAbstractEffect IEffect IEffectInstance IEffectTargetHost
syn keyword asClasses AddChildAction AddItemAction AnimateProperty Blur CompositeEffect DefaultListEffect DefaultTileListEffect Dissolve Effect EffectInstance EffectManager EffectTargetFilter Fade Glow Iris MaskEffect Move Parallel Pause RemoveChildAction RemoveItemAction Resize Rotate Sequence SetPropertyAction SetStyleAction SoundEffect Tween TweenEffect UnconstrainItemAction WipeDown WipeLeft WipeRight WipeUp Zoom

" mx.effects.easing
syn keyword asClasses Back Bounce Circular Cubic Elastic Exponential Linear Quadratic Quartic Quintic Sine

" mx.effects.effectClasses
syn keyword asClasses ActionEffectInstance AddChildActionInstance AddItemActionInstance AddRemoveEffectTargetFilter AnimatePropertyInstance BlurInstance CompositeEffectInstance DissolveInstance FadeInstance GlowInstance HideShowEffectTargetFilter IrisInstance MaskEffectInstance MoveInstance ParallelInstance PauseInstance PropertyChanges RemoveChildActionInstance RemoveItemActionInstance ResizeInstance RotateInstance SequenceInstance SetPropertyActionInstance SetStyleActionInstance SoundEffectInstance TweenEffectInstance UnconstrainItemActionInstance WipeDownInstance WipeLeftInstance WipeRightInstance WipeUpInstance ZoomInstance

" mx.events
syn keyword asAIRClasses AIREvent FileEvent FlexNativeMenuEvent FlexNativeWindowBoundsEvent
syn keyword asClasses AdvancedDataGridEvent AdvancedDataGridEventReason BrowserChangeEvent CalendarLayoutChangeEvent ChildExistenceChangedEvent CloseEvent CollectionEvent CollectionEventKind ColorPickerEvent CubeEvent CuePointEvent DataGridEvent DataGridEventReason DateChooserEvent DateChooserEventDetail DividerEvent DragEvent DropdownEvent DynamicEvent EffectEvent EventListenerRequest FlexEvent FlexMouseEvent FocusRequestDirection IndexChangedEvent InterDragManagerEvent InterManagerRequest InvalidateRequestData ItemClickEvent ListEvent ListEventReason MenuEvent MetadataEvent ModuleEvent MoveEvent NumericStepperEvent PropertyChangeEvent PropertyChangeEventKind Request ResizeEvent ResourceEvent RSLEvent SandboxMouseEvent ScrollEvent ScrollEventDetail ScrollEventDirection SliderEvent SliderEventClickTarget StateChangeEvent StyleEvent SWFBridgeEvent SWFBridgeRequest ToolTipEvent TreeEvent TweenEvent ValidationResultEvent VideoEvent

" mx.filters
syn keyword asInterfaces IBitmapFilter
syn keyword asClasses BaseDimensionFilter BaseFilter

" mx.flash
syn keyword asClasses ContainerMovieClip UIMovieClip

" mx.formatters
syn keyword asClasses CurrencyFormatter DateBase DateFormatter Formatter NumberBase NumberBaseRoundType NumberFormatter PhoneFormatter SwitchSymbolFormatter ZipCodeFormatter

" mx.geom
syn keyword asClasses CompoundTransform RoundedRectangle Transform TransformOffsets

" mx.graphics
syn keyword asInterfaces IFill IStroke
syn keyword asClasses BitmapFill BitmapFillMode GradientBase GradientEntry GradientStroke ImageSnapshot LinearGradient LinearGradientStroke RadialGradient RadialGradientStroke RectangularDropShadow SolidColor SolidColorStroke Stroke

" mx.graphics.codec
syn keyword asInterfaces IImageEncoder
syn keyword asClasses JPEGEncoder PNGEncoder

" mx.graphics.shaderClasses
syn keyword asClasses ColorBurnShader ColorDodgeShader ColorShader ExclusionShader HueShader LuminosityMaskShader LuminosityShader SaturationShader SoftLightShader

" mx.logging
syn keyword asInterfaces ILogger ILoggingTarget
syn keyword asClasses AbstractTarget Log LogEvent LogEventLevel LogLogger

" mx.logging.errors
syn keyword asClasses InvalidCategoryError InvalidFilterError

" mx.logging.targets
syn keyword asClasses LineFormattedTarget TraceTarget

" mx.managers
syn keyword asInterfaces IBrowserManager IFocusManager IFocusManagerComplexComponent IFocusManagerComponent IFocusManagerContainer IFocusManagerGroup IHistoryManagerClient ILayoutManager ILayoutManagerClient IMarshalSystemManager ISystemManager IToolTipManagerClient
syn keyword asAIRClasses WindowedSystemManager
syn keyword asClasses BrowserManager CursorManager CursorManagerPriority DragManager FocusManager HistoryManager LayoutManager PopUpManager PopUpManagerChildList SystemManager ToolTipManager

" mx.messaging.channels
syn keyword asClasses AMFChannel HTTPChannel NetConnectionChannel PollingChannel RTMPChannel SecureAMFChannel SecureHTTPChannel SecureRTMPChannel SecureStreamingAMFChannel SecureStreamingHTTPChannel StreamingAMFChannel StreamingConnectionHandler StreamingHTTPChannel

" mx.messaging
syn keyword asClasses AbstractConsumer AbstractProducer AdvancedChannelSet Channel ChannelSet Consumer FlexClient MessageAgent MessageResponder MultiTopicConsumer MultiTopicProducer Producer SubscriptionInfo

" mx.messaging.config
syn keyword asClasses ConfigMap ServerConfig

" mx.messaging.errors
syn keyword asClasses ChannelError InvalidChannelError InvalidDestinationError MessageSerializationError MessagingError NoChannelAvailableError

" mx.messaging.events
syn keyword asClasses ChannelEvent ChannelFaultEvent MessageAckEvent MessageEvent MessageFaultEvent

" mx.messaging.management
syn keyword asClasses Attribute MBeanAttributeInfo MBeanConstructorInfo MBeanFeatureInfo MBeanInfo MBeanOperationInfo MBeanParameterInfo ObjectInstance ObjectName

" mx.messaging.messages
syn keyword asInterfaces IMessage ISmallMessage
syn keyword asClasses AbstractMessage AcknowledgeMessage AsyncMessage CommandMessage ErrorMessage HTTPRequestMessage MessagePerformanceUtils RemotingMessage SOAPMessage

" mx.modules
syn keyword asInterfaces IModule IModuleInfo
syn keyword asClasses Module ModuleBase ModuleLoader ModuleManager

" mx.netmon
syn keyword asClasses NetworkMonitor

" mx.olap.aggregators
syn keyword asClasses AverageAggregator CountAggregator MaxAggregator MinAggregator SumAggregator

" mx.olap
syn keyword asInterfaces IOLAPAttribute IOLAPAxisPosition IOLAPCell IOLAPCube IOLAPCustomAggregator IOLAPDimension IOLAPElement IOLAPHierarchy IOLAPLevel IOLAPMember IOLAPQuery IOLAPQueryAxis IOLAPResult IOLAPResultAxis IOLAPSchema IOLAPSet IOLAPTuple
syn keyword asClasses OLAPAttribute OLAPAxisPosition OLAPCell OLAPCube OLAPDimension OLAPElement OLAPHierarchy OLAPLevel OLAPMeasure OLAPMember OLAPQuery OLAPQueryAxis OLAPResult OLAPResultAxis OLAPSchema OLAPSet OLAPTrace OLAPTuple

" mx.preloaders
syn keyword asInterfaces IPreloaderDisplay
syn keyword asClasses DownloadProgressBar Preloader SparkDownloadProgressBar

" mx.printing
syn keyword asClasses FlexPrintJob FlexPrintJobScaleType PrintAdvancedDataGrid PrintDataGrid PrintOLAPDataGrid

" mx.resources
syn keyword asInterfaces IResourceBundle IResourceManager
syn keyword asClasses Locale ResourceBundle ResourceManager

" mx.rpc
syn keyword asInterfaces IResponder
syn keyword asClasses AbstractInvoker AbstractOperation AbstractService AsyncRequest AsyncResponder AsyncToken CallResponder Fault Responder

" mx.rpc.events
syn keyword asClasses AbstractEvent FaultEvent HeaderEvent InvokeEvent ResultEvent WSDLLoadEvent XMLLoadEvent

" mx.rpc.http
syn keyword asClasses AbstractOperation HTTPMultiService HTTPService Operation SerializationFilter

" mx.rpc.http.mxml
syn keyword asClasses HTTPService

" mx.rpc.livecycle
syn keyword asClasses DocumentReference Fault FaultResponse JobId JobStatus

" mx.rpc.mxml
syn keyword asInterfaces IMXMLSupport
syn keyword asClasses Concurrency

" mx.rpc.remoting
syn keyword asClasses Operation RemoteObject

" mx.rpc.remoting.mxml
syn keyword asClasses Operation RemoteObject

" mx.rpc.soap
syn keyword asInterfaces ISOAPEncoder
syn keyword asClasses AbstractWebService LoadEvent Operation SOAPFault SOAPHeader WebService

" mx.rpc.soap.mxml
syn keyword asClasses Operation WebService

" mx.rpc.wsdl
syn keyword asClasses WSDLBinding

" mx.rpc.xml
syn keyword asInterfaces IXMLDecoder IXMLEncoder IXMLSchemaInstance
syn keyword asClasses QualifiedResourceManager SchemaTypeRegistry SimpleXMLDecoder SimpleXMLEncoder

" mx.skins
syn keyword asClasses Border ProgrammaticSkin RectangularBorder

" mx.skins.halo
syn keyword asAIRClasses ApplicationTitleBarBackgroundSkin StatusBarBackgroundSkin WindowBackground WindowCloseButtonSkin WindowMaximizeButtonSkin WindowMinimizeButtonSkin WindowRestoreButtonSkin
syn keyword asClasses AccordionHeaderSkin ActivatorSkin AdvancedDataGridHeaderHorizontalSeparator ApplicationBackground BrokenImageBorderSkin BusyCursor ButtonBarButtonSkin ButtonSkin CheckBoxIcon ColorPickerSkin ComboBoxArrowSkin DataGridColumnDropIndicator DataGridColumnResizeSkin DataGridHeaderBackgroundSkin DataGridHeaderSeparator DataGridSortArrow DateChooserIndicator DateChooserMonthArrowSkin DateChooserYearArrowSkin DefaultDragImage HaloBorder HaloColors HaloFocusRect LinkButtonSkin LinkSeparator ListDropIndicator MenuBarBackgroundSkin NumericStepperDownSkin NumericStepperUpSkin PanelSkin PopUpButtonSkin PopUpIcon PopUpMenuIcon ProgressBarSkin ProgressIndeterminateSkin ProgressMaskSkin ProgressTrackSkin RadioButtonIcon ScrollArrowSkin ScrollThumbSkin ScrollTrackSkin SliderHighlightSkin SliderThumbSkin SliderTrackSkin SwatchPanelSkin SwatchSkin TabSkin TitleBackground ToolTipBorder

" mx.skins.spark
syn keyword asClasses AccordionHeaderSkin BorderSkin ButtonBarFirstButtonSkin ButtonBarLastButtonSkin ButtonBarMiddleButtonSkin ButtonSkin CheckBoxSkin ColorPickerSkin ComboBoxSkin ContainerBorderSkin DataGridHeaderBackgroundSkin DataGridHeaderSeparatorSkin DataGridSortArrow DateChooserNextMonthSkin DateChooserNextYearSkin DateChooserPrevMonthSkin DateChooserPrevYearSkin DateChooserRollOverIndicatorSkin DateChooserSelectionIndicatorSkin DateChooserTodayIndicatorSkin DefaultButtonSkin EditableComboBoxSkin LinkButtonSkin MenuArrow MenuArrowDisabled MenuCheck MenuCheckDisabled MenuItemSkin MenuRadio MenuRadioDisabled MenuSeparatorSkin PanelBorderSkin PopUpButtonSkin ProgressBarSkin ProgressBarTrackSkin ProgressIndeterminateSkin ProgressMaskSkin RadioButtonSkin ScrollBarDownButtonSkin ScrollBarThumbSkin ScrollBarTrackSkin ScrollBarUpButtonSkin SliderThumbSkin SliderTrackHighlightSkin SliderTrackSkin SparkSkinForHalo StepperDecrButtonSkin StepperIncrButtonSkin TabSkin TextInputBorderSkin

" mx.skins.wireframe
syn keyword asClasses AccordionHeaderSkin BorderSkin ButtonBarFirstButtonSkin ButtonBarLastButtonSkin ButtonBarMiddleButtonSkin ButtonSkin CheckBoxSkin ColorPickerSkin ComboBoxSkin ContainerBorderSkin ControlBarSkin DataGridHeaderBackgroundSkin DataGridHeaderSeparatorSkin DataGridSortArrow DateChooserNextMonthSkin DateChooserNextYearSkin DateChooserPrevMonthSkin DateChooserPrevYearSkin DateChooserRollOverIndicatorSkin DateChooserSelectionIndicatorSkin DateChooserTodayIndicatorSkin DefaultButtonSkin DividerSkin DropDownSkin EditableComboBoxSkin EmphasizedButtonSkin LinkButtonSkin MenuArrow MenuArrowDisabled MenuBarItemSkin MenuBarSkin MenuCheck MenuCheckDisabled MenuRadio MenuRadioDisabled MenuSeparatorSkin MenuSkin PanelBorderSkin PopUpButtonSkin ProgressBarSkin ProgressBarTrackSkin ProgressIndeterminateSkin ProgressMaskSkin RadioButtonSkin ScrollBarDownButtonSkin ScrollBarThumbSkin ScrollBarTrackSkin ScrollBarUpButtonSkin SliderThumbSkin SliderTrackHighlightSkin SliderTrackSkin StepperDecrButtonSkin StepperIncrButtonSkin TabSkin TextAreaSkin TextInputSkin TitleWindowCloseButtonDownSkin TitleWindowCloseButtonOverSkin TitleWindowCloseButtonUpSkin ToolTipSkin WindowedApplicationSkin

" mx.skins.wireframe.windowChrome
syn keyword asClasses CloseButtonSkin MaximizeButtonSkin MinimizeButtonSkin RestoreButtonSkin StatusBarSkin TitleBarSkin

" mx.states
syn keyword asInterfaces IOverride
syn keyword asClasses AddChild AddItems OverrideBase RemoveChild SetEventHandler SetProperty SetStyle State Transition

" mx.styles
syn keyword asInterfaces IAdvancedStyleClient ISimpleStyleClient IStyleClient IStyleManager IStyleManager2 IStyleModule
syn keyword asClasses CSSCondition CSSConditionKind CSSSelector CSSStyleDeclaration StyleManager StyleProxy

" mx.utils
syn keyword asInterfaces IXMLNotifiable
syn keyword asClasses ArrayUtil Base64Decoder Base64Encoder ColorUtil DisplayUtil GraphicsUtil HSBColor LoaderUtil NameUtil ObjectProxy ObjectUtil OnDemandEventDispatcher OrderedObject RPCObjectUtil RPCStringUtil RPCUIDUtil SecurityUtil SHA256 StringUtil UIDUtil URLUtil XMLNotifier XMLUtil

" mx.validators
syn keyword asInterfaces IValidatorListener
syn keyword asClasses CreditCardValidator CreditCardValidatorCardType CurrencyValidator CurrencyValidatorAlignSymbol DateValidator EmailValidator NumberValidator NumberValidatorDomainType PhoneNumberValidator RegExpValidationResult RegExpValidator SocialSecurityValidator StringValidator ValidationResult Validator ZipCodeValidator ZipCodeValidatorDomainType

" org.osmf.display
syn keyword asClasses ScaleMode

" org.osmf.events
syn keyword asClasses LoadEvent MediaPlayerStateChangeEvent TimeEvent

" org.osmf.layout
syn keyword asClasses LayoutUtils

" org.osmf.media
syn keyword asClasses MediaPlayer MediaPlayerState

" org.osmf.net
syn keyword asClasses StreamType

" spark.accessibility
syn keyword asClasses ButtonBarBaseAccImpl ButtonBaseAccImpl CheckBoxAccImpl ComboBoxAccImpl DropDownListBaseAccImpl ListAccImpl ListBaseAccImpl NumericStepperAccImpl PanelAccImpl RadioButtonAccImpl RichEditableTextAccImpl SliderBaseAccImpl SpinnerAccImpl TabBarAccImpl TextBaseAccImpl TitleWindowAccImpl ToggleButtonAccImpl VideoPlayerAccImpl

" spark.components
syn keyword asInterfaces IItemRenderer IItemRendererOwner
syn keyword asAIRClasses Window WindowedApplication
syn keyword asClasses Application BorderContainer Button ButtonBar ButtonBarButton CheckBox ComboBox DataGroup DataRenderer DropDownList Group HGroup HScrollBar HSlider Label List NavigatorContent NumericStepper Panel PopUpAnchor PopUpPosition RadioButton RadioButtonGroup ResizeMode RichEditableText RichText Scroller SkinnableContainer SkinnableDataContainer Spinner TabBar TextArea TextInput TextSelectionHighlighting TileGroup TitleWindow ToggleButton VGroup VideoDisplay VideoPlayer VScrollBar VSlider

" spark.components.mediaClasses
syn keyword asClasses DynamicStreamingVideoItem DynamicStreamingVideoSource MuteButton ScrubBar VolumeBar

" spark.components.supportClasses
syn keyword asClasses ButtonBarBase ButtonBarHorizontalLayout ButtonBase DisplayLayer DropDownController DropDownListBase GroupBase ItemRenderer ListBase ListItemDragProxy OverlayDepth Range ScrollBarBase Skin SkinnableComponent SkinnableContainerBase SkinnableTextBase SliderBase TextBase ToggleButtonBase TrackBase

" spark.components.windowClasses
syn keyword asAIRClasses TitleBar

" spark.core
syn keyword asInterfaces IGraphicElement ISharedDisplayObject IViewport
syn keyword asClasses DisplayObjectSharingMode MaskType NavigationUnit SpriteVisualElement

" spark.effects.animation
syn keyword asInterfaces IAnimationTarget
syn keyword asClasses Animation Keyframe MotionPath RepeatBehavior SimpleMotionPath

" spark.effects
syn keyword asClasses AddAction Animate AnimateColor AnimateFilter AnimateTransform AnimateTransform3D AnimateTransitionShader CallAction CrossFade Fade Move Move3D RemoveAction Resize Rotate Rotate3D Scale Scale3D SetAction Wipe WipeDirection

" spark.effects.easing
syn keyword asInterfaces IEaser
syn keyword asClasses Bounce EaseInOutBase EasingFraction Elastic Linear Power Sine

" spark.effects.interpolation
syn keyword asInterfaces IInterpolator
syn keyword asClasses HSBInterpolator MultiValueInterpolator NumberInterpolator RGBInterpolator

" spark.effects.supportClasses
syn keyword asClasses AddActionInstance AnimateColorInstance AnimateFilterInstance AnimateInstance AnimateTransformInstance AnimateTransitionShaderInstance CallActionInstance FadeInstance RemoveActionInstance ResizeInstance SetActionInstance

" spark.events
syn keyword asClasses DropDownEvent ElementExistenceEvent IndexChangeEvent RendererExistenceEvent TextOperationEvent TitleWindowBoundsEvent TrackBaseEvent

" spark.filters
syn keyword asClasses BevelFilter BlurFilter ColorMatrixFilter ConvolutionFilter DisplacementMapFilter DropShadowFilter GlowFilter GradientBevelFilter GradientFilter GradientGlowFilter ShaderFilter

" spark.layouts
syn keyword asClasses BasicLayout ColumnAlign HorizontalAlign HorizontalLayout RowAlign TileLayout TileOrientation VerticalAlign VerticalLayout

" spark.layouts.supportClasses
syn keyword asClasses DropLocation LayoutBase

" spark.primitives
syn keyword asClasses BitmapImage Ellipse Graphic Line Path Rect RectangularDropShadow

" spark.primitives.supportClasses
syn keyword asClasses FilledElement GraphicElement StrokedElement

" spark.skins
syn keyword asClasses SparkSkin

" spark.skins.spark
syn keyword asClasses ApplicationSkin BorderContainerSkin ButtonBarFirstButtonSkin ButtonBarLastButtonSkin ButtonBarMiddleButtonSkin ButtonBarSkin ButtonSkin CheckBoxSkin ComboBoxButtonSkin ComboBoxSkin ComboBoxTextInputSkin DefaultButtonSkin DefaultComplexItemRenderer DefaultItemRenderer DropDownListButtonSkin DropDownListSkin ErrorSkin FocusSkin HighlightBitmapCaptureSkin HScrollBarSkin HScrollBarThumbSkin HScrollBarTrackSkin HSliderSkin HSliderThumbSkin HSliderTrackSkin ListDropIndicator ListSkin NumericStepperSkin NumericStepperTextInputSkin PanelSkin RadioButtonSkin ScrollBarDownButtonSkin ScrollBarLeftButtonSkin ScrollBarRightButtonSkin ScrollBarUpButtonSkin ScrollerSkin SkinnableContainerSkin SkinnableDataContainerSkin SpinnerDecrementButtonSkin SpinnerIncrementButtonSkin SpinnerSkin TabBarButtonSkin TabBarSkin TextAreaSkin TextInputSkin TitleWindowCloseButtonSkin TitleWindowSkin ToggleButtonSkin VideoPlayerSkin VScrollBarSkin VScrollBarThumbSkin VScrollBarTrackSkin VSliderSkin VSliderThumbSkin VSliderTrackSkin

" spark.skins.spark.mediaClasses.fullScreen
syn keyword asClasses FullScreenButtonSkin MuteButtonSkin PlayPauseButtonSkin ScrubBarSkin ScrubBarThumbSkin ScrubBarTrackSkin VolumeBarSkin VolumeBarThumbSkin VolumeBarTrackSkin

" spark.skins.spark.mediaClasses.normal
syn keyword asClasses FullScreenButtonSkin MuteButtonSkin PlayPauseButtonSkin ScrubBarSkin ScrubBarThumbSkin ScrubBarTrackSkin VolumeBarSkin VolumeBarThumbSkin VolumeBarTrackSkin

" spark.skins.spark.windowChrome
syn keyword asClasses CloseButtonSkin MacCloseButtonSkin MacMaximizeButtonSkin MacMinimizeButtonSkin MacTitleBarSkin MaximizeButtonSkin MinimizeButtonSkin RestoreButtonSkin TitleBarSkin

" spark.skins.wireframe
syn keyword asClasses ApplicationSkin ButtonBarFirstButtonSkin ButtonBarLastButtonSkin ButtonBarMiddleButtonSkin ButtonBarSkin ButtonSkin CheckBoxSkin ComboBoxButtonSkin ComboBoxSkin DefaultButtonSkin DropDownListButtonSkin DropDownListSkin HScrollBarSkin HScrollBarThumbSkin HScrollBarTrackSkin HSliderSkin HSliderThumbSkin HSliderTrackSkin ListSkin NumericStepperSkin NumericStepperTextInputSkin PanelSkin RadioButtonSkin ScrollBarDownButtonSkin ScrollBarLeftButtonSkin ScrollBarRightButtonSkin ScrollBarUpButtonSkin SpinnerDecrementButtonSkin SpinnerIncrementButtonSkin SpinnerSkin TabBarButtonSkin TabBarSkin TextAreaSkin TextInputSkin TitleWindowCloseButtonSkin TitleWindowSkin ToggleButtonSkin VideoPlayerSkin VScrollBarSkin VScrollBarThumbSkin VScrollBarTrackSkin VSliderSkin VSliderThumbSkin VSliderTrackSkin

" spark.skins.wireframe.mediaClasses
syn keyword asClasses FullScreenButtonSkin MuteButtonSkin PlayPauseButtonSkin ScrubBarSkin ScrubBarThumbSkin ScrubBarTrackSkin VolumeBarSkin VolumeBarThumbSkin VolumeBarTrackSkin

" spark.skins.wireframe.mediaClasses.fullScreen
syn keyword asClasses FullScreenButtonSkin

" spark.utils
syn keyword asClasses BitmapUtil LabelUtil TextFlowUtil



" catch errors caused by wrong parenthesis
syn match   actionScriptInParen     contained "[{}]"
syn region  actionScriptParen       transparent start="(" end=")" contains=actionScriptParen,actionScript.*
syn match   actionScrParenError  ")"

if main_syntax == "actionscript"
  syn sync ccomment actionScriptComment
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_actionscript_syn_inits")
  if version < 508
    let did_actionscript_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink actionScriptComment		Comment
  HiLink actionScriptLineComment	Comment
  HiLink actionScriptSpecial		Special
  HiLink actionScriptStringS		String
  HiLink actionScriptStringD		String
  HiLink actionScriptCharacter		Character
  HiLink actionScriptSpecialCharacter	actionScriptSpecial
  HiLink actionScriptNumber		actionScriptValue
  HiLink actionScriptBraces		Function
  HiLink actionScriptError		Error
  HiLink actionScrParenError		actionScriptError
  HiLink actionScriptInParen		actionScriptError
  HiLink actionScriptConditional	Conditional
  HiLink actionScriptRepeat		Repeat
  HiLink actionScriptCase		Label
  HiLink actionScriptConstructor	Operator
  HiLink actionScriptObjects		Operator
  HiLink actionScriptStatement		Statement
  HiLink actionScriptFunction		Function
  HiLink actionScriptValue		Boolean
  HiLink actionScriptArray		Type
  HiLink actionScriptDate		Type
  HiLink actionScriptMath		Type
  HiLink actionScriptNumberObj		Type
  HiLink actionScriptObject		Function
  HiLink actionScriptString		Type
  HiLink actionScriptColor		Type
  HiLink actionScriptKey		Type
  HiLink actionScriptMouse		Type
  HiLink actionScriptSelection		Type
  HiLink actionScriptSound		Type
  HiLink actionScriptStage		Type
  HiLink actionScriptSystem		Type
  HiLink actionScriptTextFormat		Type
  HiLink actionScriptCommunication	Type
  HiLink actionScriptXMLSocket		Type
  HiLink actionScriptTextField		Type
  HiLink actionScriptMethods		actionScriptMethods
  HiLink actionScriptException		Exception
  HiLink actionScriptXML		Type
  HiLink actionScriptArrayConstant	Constant
  HiLink actionScriptStringConstant	Constant
  HiLink actionScriptEventConstant	Constant
  HiLink actionScriptTextSnapshot	Type
  HiLink actionScriptID3		Type
  HiLink actionScriptAS2		Function
  HiLink actionScriptStyleSheet		Type
  HiLink flash8Constants		Constant
  HiLink flash8Functions		Function
  HiLink flash8Properties		Type
  HiLink flash8Classes 			Type
  HiLink actionScriptInclude		Include
  HiLink as3Packages			as3Packages
  HiLink as3Classes			as3Classes
  HiLink as3Properties			Type
  HiLink as3Functions			Function
  HiLink as3Constants			as3Constants
  HiLink as3Errors			Constant
  HiLink as3Events			Constant
  HiLink asOctalError      Error
  hi def link asStringDQ        String
hi def link asStringSQ        String
hi def link asNumber          Number
hi def link asRegExp          Special
hi def link asCommentTodo     Todo
hi def link asComment         Comment
hi def link asDirective       Include
hi def link asAttribute       Define
hi def link asDefinition      Structure
hi def link asGlobal          Macro
hi def link asType            asType
hi def link asStatement       Statement
hi def link asIdentifier      Identifier
hi def link asConstant        asConstant
hi def link asOperator        Operator
hi def link asBraces          Function
hi def link asMetadataTag     PreProc

  delcommand HiLink
endif

let b:current_syntax = "actionscript"
if main_syntax == 'actionscript'
  unlet main_syntax
endif

" vim: ts=8
