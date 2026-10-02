	object_const_def
	const ECRUTEAKCITY_GRAMPS1
	const ECRUTEAKCITY_GRAMPS2
	const ECRUTEAKCITY_LASS1
	const ECRUTEAKCITY_LASS2
	const ECRUTEAKCITY_FISHER
	const ECRUTEAKCITY_YOUNGSTER

EcruteakCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, EcruteakCityFlypointCallback

EcruteakCityFlypointCallback:
	setflag ENGINE_FLYPOINT_ECRUTEAK
	endcallback

EcruteakCityGramps1Script:
	jumptextfaceplayer EcruteakCityGramps1Text

EcruteakCityGramps2Script:
	jumptextfaceplayer EcruteakCityGramps2Text

EcruteakCityLass1Script:
	jumptextfaceplayer EcruteakCityLass1Text

EcruteakCityLass2Script:
	faceplayer
	opentext
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue .ReleasedBeasts
	writetext EcruteakCityLass2Text
	waitbutton
	closetext
	end

.ReleasedBeasts:
	writetext EcruteakCityLass2Text_ReleasedBeasts
	waitbutton
	closetext
	end

EcruteakCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue .JasmineReturned
	writetext EcruteakCityFisherText
	waitbutton
	closetext
	end

.JasmineReturned:
	writetext EcruteakCityFisherText_JasmineReturned
	waitbutton
	closetext
	end

EcruteakCityYoungsterScript:
	jumptextfaceplayer EcruteakCityYoungsterText

EcruteakCitySign:
	jumptext EcruteakCitySignText

TinTowerSign:
	jumptext TinTowerSignText

EcruteakGymSign:
	jumptext EcruteakGymSignText

EcruteakDanceTheaterSign:
	jumptext EcruteakDanceTheaterSignText

BurnedTowerSign:
	jumptext BurnedTowerSignText

EcruteakCityPokecenterSign:
	jumpstd PokecenterSignScript

EcruteakCityMartSign:
	jumpstd MartSignScript

EcruteakCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ECRUTEAK_CITY_HIDDEN_HYPER_POTION

UnusedMissingDaughterText: ; unreferenced
	text "Oh nein, oh nein…"

	para "Meine Tochter wird"
	line "vermisst."

	para "Nein… Hoffentlich"
	line "ist sie nicht zur"
	cont "TURMRUINE gegan-"
	cont "gen."

	para "Ich habe ihr ge-"
	line "sagt, sie soll"

	para "sich von dort"
	line "fernhalten. Es"

	para "scheint, als wür-"
	line "den Leute von dort"
	cont "verschwinden…"

	para "Oh, was soll ich"
	line "nur tun…?"
	done

EcruteakCityGramps1Text:
	text "Es gab zwei Türme"
	line "in TEAK CITY. Ei-"

	para "nen im Osten, ei-"
	line "nen im Westen."
	done

EcruteakCityGramps2Text:
	text "Na, Junge?"
	line "Hast du gelernt zu"

	para "tanzen wie die"
	line "KIMONO GIRLS?"

	para "Ich habe gehört,"
	line "dass dir ein ei-"

	para "genartiger Mann"
	line "etwas Nettes geben"

	para "wird, wenn du zu"
	line "ihrem TANZTHEATER"
	cont "gehst."
	done

EcruteakCityLass1Text:
	text "Ich will im TANZ-"
	line "THEATER üben."

	para "Kommst du mit?"
	done

EcruteakCityLass2Text:
	text "Der Turm war ur-"
	line "sprünglich viel"

	para "höher, aber er"
	line "wurde durch ein"
	cont "Feuer beschädigt."
	done

EcruteakCityLass2Text_ReleasedBeasts:
	text "Drei große #MON"
	line "sind in verschie-"
	cont "dene Richtungen"
	cont "davongelaufen! Was"
	cont "waren das für"
	cont "welche?"
	done

EcruteakCityFisherText:
	text "Es kursiert ein"
	line "Gerücht über den"
	cont "LEUCHTTURM in OLI-"
	cont "VIANA CITY."

	para "Das #MON, das"
	line "als Leuchtfeuer"

	para "dient, wurde"
	line "krank. Sieht so"

	para "aus, als wären sie"
	line "in Schwierig-"
	cont "keiten."
	done

EcruteakCityFisherText_JasmineReturned:
	text "Das #MON im"
	line "LEUCHTTURM von"
	cont "OLIVIANA CITY wur-"
	cont "de geheilt."

	para "Jetzt können die"
	line "Schiffe wieder ge-"
	cont "fahrlos nachts in"
	cont "See stechen."
	done

EcruteakCityYoungsterText:
	text "Ich hörte, dass"
	line "#MON am SEE DES"

	para "ZORNS Unruhe stif-"
	line "ten. Das würde ich"
	cont "gerne sehen."
	done

EcruteakCitySignText:
	text "TEAK CITY"
	line "Eine historische"

	para "Stadt, wo Vergan-"
	line "genheit und Gegen-"

	para "wart aufeinander-"
	line "treffen"
	done

TinTowerSignText:
	text "ZINNTURM"

	para "Man sagt, ein le-"
	line "gendäres #MON"

	para "soll dort sein"
	done

EcruteakGymSignText:
	text "TEAK CITY"
	line "#MON ARENA-"
	cont "LEITER: JENS"

	para "Der mystische Se-"
	line "her der Zukunft"
	done

EcruteakDanceTheaterSignText:
	text "TANZTHEATER VON"
	line "TEAK CITY"
	done

BurnedTowerSignText:
	text "TURMRUINE"

	para "Er wurde durch ein"
	line "mysteriöses Feuer"
	cont "zerstört."

	para "Bitte nicht betre-"
	line "ten!"
	done

EcruteakCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 35, 26, ROUTE_42_ECRUTEAK_GATE, 1
	warp_event 35, 27, ROUTE_42_ECRUTEAK_GATE, 2
	warp_event 18, 11, ECRUTEAK_TIN_TOWER_ENTRANCE, 1
	warp_event 20,  2, ECRUTEAK_TIN_TOWER_BACK_ENTRANCE, 1
	warp_event 20,  3, ECRUTEAK_TIN_TOWER_BACK_ENTRANCE, 2
	warp_event 23, 27, ECRUTEAK_POKECENTER_1F, 1
	warp_event  5, 21, ECRUTEAK_LUGIA_SPEECH_HOUSE, 1
	warp_event 23, 21, DANCE_THEATER, 1
	warp_event 29, 21, ECRUTEAK_MART, 2
	warp_event  6, 27, ECRUTEAK_GYM, 1
	warp_event 13, 27, ECRUTEAK_ITEMFINDER_HOUSE, 1
	warp_event 37,  7, TIN_TOWER_1F, 1
	warp_event  5,  5, BURNED_TOWER_1F, 1
	warp_event  0, 18, ROUTE_38_ECRUTEAK_GATE, 3
	warp_event  0, 19, ROUTE_38_ECRUTEAK_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 15, 21, BGEVENT_READ, EcruteakCitySign
	bg_event 38, 10, BGEVENT_READ, TinTowerSign
	bg_event  8, 28, BGEVENT_READ, EcruteakGymSign
	bg_event 21, 21, BGEVENT_READ, EcruteakDanceTheaterSign
	bg_event  2, 10, BGEVENT_READ, BurnedTowerSign
	bg_event 24, 27, BGEVENT_READ, EcruteakCityPokecenterSign
	bg_event 30, 21, BGEVENT_READ, EcruteakCityMartSign
	bg_event 23, 14, BGEVENT_ITEM, EcruteakCityHiddenHyperPotion

	def_object_events
	object_event 18, 15, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps1Script, -1
	object_event 20, 21, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps2Script, -1
	object_event 21, 29, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass1Script, -1
	object_event  3,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass2Script, -1
	object_event  9, 22, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakCityFisherScript, -1
	object_event 10, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakCityYoungsterScript, -1
