; see engine/menus/naming_screen.asm

NameInputLower:
	db "a b c d e f g h i"
	db "j k l m n o p q r"
	db "s t u v w x y z -"
	db "ä ö ü ? ! . , ( )"
	db "GROß  LÖSCH ENDE "

BoxNameInputLower:
	db "a b c d e f g h i"
	db "j k l m n o p q r"
	db "s t u v w x y z  "
	db "ä ö ü ( ) ; /   0"
	db "1 2 3 4 5 6 7 8 9"
	db "GROß  LÖSCH ENDE "

NameInputUpper:
	db "A B C D E F G H I"
	db "J K L M N O P Q R"
	db "S T U V W X Y Z /"
	db "Ä Ö Ü <PK> <MN> :   [ ]"
	db "klein LÖSCH ENDE "

BoxNameInputUpper:
	db   "A B C D E F G H IJ K L M N O P Q RS T U V W X Y Z ßÄ Ö Ü [ ] : × <PK> <MN>- ? ! ♂ ♀ . , &  klein LÖSCH ENDE ¥Ä¥ほ7ゼゼゾ<NULL><NULL><NULL>  <NULL><NULL><NULL><NULL><NULL><NULL><NULL><NULL><NULL>  ", $21, "'dü”<KOUGEKI>“¥'♀p''¥m♀ぼ", $01, "'mへぺ<BOLD_C>へぜ", $03, "へ<COLON><BOLD_D>だ5×'m×''のへパどへづ", $04, "へ8<DEXEND>ヅ<NULL>A", $21, "b<BOLD_C>", $01, "A<NULL>ぼ", $04, "へへゼp", $21, "ゲü<LF>ぇヅヂ<JP_18>ぼ<NULL>へ<LF>べ", $21, $02, "<NULL>ゴ<WATASHI><NULL>へぢ<BOLD_D>ぼ-'パへ", $21, "<BOLD_D>ギゲへ─<ROUTE>へポどへへ<JP_14>ぼﾟへ<BOLD_B>ズぼﾟへgズへN<DEXEND>", $21, "'dü<ROCKET><KOUGEKI><……>", $21, "ヂ<NULL>バ<WATASHI>"
	next "の<NULL><NULL>   <BOLD_A> @"
