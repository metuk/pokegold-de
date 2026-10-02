BillPhoneMornGreetingText:
	text "Guten Morgen!"

	para "Dies ist der VER-"
	line "WALTUNGSSERVICE"

	para "DES #MON-LAGE-"
	line "RUNGS-SYSTEMS."
	done

BillPhoneDayGreetingText:
	text "Guten Tag!"

	para "Dies ist der VER-"
	line "WALTUNGSSERVICE"

	para "DES #MON-LAGE-"
	line "RUNGS-SYSTEMS."
	done

BillPhoneNiteGreetingText:
	text "Guten Abend!"

	para "Dies ist der VER-"
	line "WALTUNGSSERVICE"

	para "DES #MON-LAGE-"
	line "RUNGS-SYSTEMS."
	done

BillPhoneGenericText:
	text "Mit wem spreche"
	line "ich?"

	para "<PLAYER>, richtig?"
	line "Einen Moment,"
	cont "bitte…"

	para "<……>"
	line "<……>"
	done

BillPhoneNotFullText:
	text "Entschuldige bitte"
	line "die Wartezeit!"

	para "<PLAYER>, deine BOX"
	line "bietet Platz für"
	cont "@"
	text_ram wStringBuffer3
	text_start
	cont "weitere #-"
	cont "MON."

	para "Zieh los und mach"
	line "sie voll!"
	done

BillPhoneNearlyFullText:
	text "Entschuldige bitte"
	line "die Wartezeit!"

	para "<PLAYER>, deine BOX"
	line "bietet nur noch"
	cont "Platz für @"
	text_ram wStringBuffer3
	text_start
	cont "weitere #MON."

	para "Vielleicht soll-"
	line "test du die BOX"
	cont "wechseln."
	done

BillPhoneFullText:
	text "Entschuldige bitte"
	line "die Wartezeit!"

	para "<PLAYER>, deine BOX"
	line "ist voll!"

	para "Du musst die BOX"
	line "wechseln, wenn du"

	para "noch mehr #-"
	line "MON fangen willst."
	done

BillPhoneNewlyFullText:
	text "Hi, <PLAYER>?"
	line "Ich biるs, BILL!"

	para "Danke, dass du das"
	line "LAGERUNGSSYSTEM"
	cont "benutzt."

	para "Das letzte #-"
	line "MON, das du ge-"
	cont "schickt hast, hat"
	cont "deine BOX voll ge-"
	cont "macht."

	para "Du musst die BOX"
	line "wechseln, wenn du"

	para "mehr #MON fan-"
	line "gen willst."

	para "Bis dann!"
	done
