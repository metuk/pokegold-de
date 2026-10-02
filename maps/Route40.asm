	object_const_def
	const ROUTE40_OLIVINE_RIVAL1
	const ROUTE40_OLIVINE_RIVAL2
	const ROUTE40_SWIMMER_GIRL1
	const ROUTE40_SWIMMER_GIRL2
	const ROUTE40_ROCK1
	const ROUTE40_ROCK2
	const ROUTE40_ROCK3
	const ROUTE40_LASS
	const ROUTE40_MONICA

Route40_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route40MonicaCallback

Route40MonicaCallback:
	readvar VAR_WEEKDAY
	ifequal MONDAY, .MonicaAppears
	disappear ROUTE40_MONICA
	endcallback

.MonicaAppears:
	appear ROUTE40_MONICA
	endcallback

TrainerSwimmerfElaine:
	trainer SWIMMERF, ELAINE, EVENT_BEAT_SWIMMERF_ELAINE, SwimmerfElaineSeenText, SwimmerfElaineBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfElaineAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfPaula:
	trainer SWIMMERF, PAULA, EVENT_BEAT_SWIMMERF_PAULA, SwimmerfPaulaSeenText, SwimmerfPaulaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfPaulaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermSimon:
	trainer SWIMMERM, SIMON, EVENT_BEAT_SWIMMERM_SIMON, SwimmermSimonSeenText, SwimmermSimonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermSimonAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermRandall:
	trainer SWIMMERM, RANDALL, EVENT_BEAT_SWIMMERM_RANDALL, SwimmermRandallSeenText, SwimmermRandallBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermRandallAfterBattleText
	waitbutton
	closetext
	end

Route40Lass1Script:
	jumptextfaceplayer Route40Lass1Text

MonicaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	iftrue .Monday
	readvar VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checkevent EVENT_MET_MONICA_OF_MONDAY
	iftrue .MetMonica
	writetext MeetMonicaText
	promptbutton
	setevent EVENT_MET_MONICA_OF_MONDAY
.MetMonica:
	writetext MonicaGivesGiftText
	promptbutton
	verbosegiveitem SHARP_BEAK
	iffalse .done
	setevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	writetext MonicaGaveGiftText
	waitbutton
	closetext
	end

.Monday:
	writetext MonicaMondayText
	waitbutton
.done:
	closetext
	end

.NotMonday:
	writetext MonicaNotMondayText
	waitbutton
	closetext
	end

Route40Sign:
	jumptext Route40SignText

Route40Rock:
	jumpstd SmashRockScript

Route40HiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ROUTE_40_HIDDEN_HYPER_POTION

Route40_StepRightUp6Movement: ; unreferenced
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

Route40_StepUp5Movement: ; unreferenced
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

Route40_StepUp4Movement: ; unreferenced
	step UP
	step UP
	step UP
	step UP
	step_end

SwimmermSimonSeenText:
	text "Du musst dich erst"
	line "aufwärmen, bevor"
	cont "du schwimmen"
	cont "gehst."

	para "Das ist"
	line "Grundwissen."
	done

SwimmermSimonBeatenText:
	text "O.K.! Onkel! Ich"
	line "gebe auf!"
	done

SwimmermSimonAfterBattleText:
	text "ANEMONIA CITY ist"
	line "ziemlich weit"
	cont "weg von hier."
	done

SwimmermRandallSeenText:
	text "Ein junger Kerl"
	line "wie du sollte"
	cont "schwimmen."

	para "SURFER kann hier"
	line "nicht eingesetzt"
	cont "werden."
	done

SwimmermRandallBeatenText:
	text "Oh, oh. Ich habe"
	line "verloren…"
	done

SwimmermRandallAfterBattleText:
	text "Schwimmen hält"
	line "deinen ganzen"
	cont "Körper fit und"
	cont "gesund."
	done

SwimmerfElaineSeenText:
	text "Gehst du nach"
	line "ANEMONIA CITY?"

	para "Wie wäre es erst"
	line "mit einem kleinen"
	cont "Kampftraining?"
	done

SwimmerfElaineBeatenText:
	text "Diesmal habe ich"
	line "verloren!"
	done

SwimmerfElaineAfterBattleText:
	text "Ich behaupte,"
	line "dass ich besser"
	cont "schwimme als du!"
	done

SwimmerfPaulaSeenText:
	text "Ich habe keine"
	line "Schwimmreifen."

	para "Ich halte mich an"
	line "einem Wasser-"
	cont "#MON fest!"
	done

SwimmerfPaulaBeatenText:
	text "Oh, ich fühle mich"
	line "so schwindelig!"
	done

SwimmerfPaulaAfterBattleText:
	text "Ich lasse mich im"
	line "Wasser treiben und"
	cont "von den Wellen"
	cont "davontragen."
	done

Route40Lass1Text:
	text "Du kannst es zwar"
	line "nicht von hier"

	para "sehen, aber ANEMO-"
	line "NIA CITY liegt"
	cont "jenseits des"
	cont "Meeres."
	done

MeetMonicaText:
	text "MONJA: Es freut"
	line "mich, dich kennen-"

	para "zulernen. Ich bin"
	line "MONJA von Montag."
	done

MonicaGivesGiftText:
	text "Als Zeichen"
	line "unserer Freund-"
	cont "schaft schenke ich"
	cont "dir dies!"
	done

MonicaGaveGiftText:
	text "MONJA: Dieses"
	line "Item verstärkt"

	para "Flug-Attacken."

	para "Damit solltest du"
	line "ein Vogel-#MON"
	cont "ausstatten."
	done

MonicaMondayText:
	text "MONJA: Meine"
	line "Geschwister"

	para "findest du"
	line "überall."

	para "Du solltest sie"
	line "alle finden!"
	done

MonicaNotMondayText:
	text "MONJA: Ich"
	line "fürchte, heute ist"
	cont "nicht Montag. Wie"
	cont "schade…"
	done

Route40SignText:
	text "ROUTE 40"

	para "ANEMONIA CITY -"
	line "OLIVIANA CITY"
	done

Route40_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 16,  8, BGEVENT_READ, Route40Sign
	bg_event 11,  7, BGEVENT_ITEM, Route40HiddenHyperPotion

	def_object_events
	object_event 14, 15, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermSimon, -1
	object_event 18, 30, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerSwimmermRandall, -1
	object_event  3, 19, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfElaine, -1
	object_event 10, 25, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfPaula, -1
	object_event 12,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event 11,  7, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event 13,  6, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event 13, 10, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Lass1Script, -1
	object_event 10,  6, SPRITE_BEAUTY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MonicaScript, EVENT_ROUTE_40_MONICA_OF_MONDAY
