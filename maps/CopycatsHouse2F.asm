	object_const_def
	const COPYCATSHOUSE2F_COPYCAT
	const COPYCATSHOUSE2F_DODRIO
	const COPYCATSHOUSE2F_FAIRYDOLL ; lost item
	const COPYCATSHOUSE2F_MONSTERDOLL
	const COPYCATSHOUSE2F_BIRDDOLL

CopycatsHouse2F_MapScripts:
	def_scene_scripts

	def_callbacks

Copycat:
	faceplayer
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftrue .GotPass
	checkevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	iftrue .TryGivePassAgain
	checkitem LOST_ITEM
	iftrue .ReturnLostItem
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	special LoadUsedSpritesGFX
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .TalkAboutLostItem
	opentext
	writetext CopycatText_Male_1
	waitbutton
	closetext
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_QuickMimicking
	waitbutton
	closetext
	end

.TalkAboutLostItem:
	opentext
	writetext CopycatText_Male_2
	waitbutton
	closetext
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_Worried
	waitbutton
	closetext
	setevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	end

.ReturnLostItem:
	opentext
	writetext CopycatText_GiveDoll
	promptbutton
	takeitem LOST_ITEM
	setevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	clearevent EVENT_COPYCATS_HOUSE_2F_DOLL
	sjump .GivePass

.TryGivePassAgain:
	opentext
.GivePass:
	writetext CopycatText_GivePass
	promptbutton
	verbosegiveitem PASS
	iffalse .Cancel
	setevent EVENT_GOT_PASS_FROM_COPYCAT
	writetext CopycatText_ExplainPass
	waitbutton
	closetext
	end

.GotPass:
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_Male_3
	waitbutton
	closetext
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_ItsAScream
	waitbutton
.Cancel:
	closetext
	end

CopycatsDodrio:
	opentext
	writetext CopycatsDodrioText1
	cry DODRIO
	promptbutton
	writetext CopycatsDodrioText2
	waitbutton
	closetext
	end

CopycatsHouse2FDoll:
	jumptext CopycatsHouse2FDollText

CopycatsHouse2FBookshelf:
	jumpstd PictureBookshelfScript

CopycatSpinAroundMovementData:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

CopycatText_Male_1:
	text "<PLAYER>: Hi! Magst"
	line "du #MON?"

	para "<PLAYER>: Äh, nein,"
	line "ich frage dich."

	para "<PLAYER>: Was?"
	line "Du bist komisch!"
	done

CopycatText_QuickMimicking:
	text "NACHAHMERIN: Hm?"
	line "Das Nachahmen"
	cont "aufgeben?"

	para "Aber das ist"
	line "meine liebste"
	cont "Beschäftigung!"
	done

CopycatText_Male_2:
	text "<PLAYER>: Hi!"
	line "Ich habe gehört,"

	para "dass du deine"
	line "Lieblings-"

	para "#PUPPE"
	line "verloren hast."

	para "<PLAYER>: Gibst du"
	line "mir einen FAHR-"
	cont "SCHEIN, wenn ich"
	cont "sie finde?"

	para "<PLAYER>: Ich suche"
	line "sie für dich."

	para "Du glaubst, sie"
	line "auf dem Weg nach"
	cont "ORANIA CITY"
	cont "verloren zu haben?"
	done

CopycatText_Worried:
	text "NACHAHMERIN:"
	line "Bitte?"

	para "Ich soll dir nicht"
	line "sagen, was du zu"
	cont "tun hast?"

	para "Aber ich mache mir"
	line "wirklich Sorgen…"
	cont "Was, wenn jemand"
	cont "sie findet?"
	done

CopycatText_GiveDoll:
	text "NACHAHMERIN: Jaa!"
	line "Das ist meine"
	cont "PIEPI-#PUPPE!"

	para "Siehst du die"
	line "Naht am rechten"

	para "Bein? Das ist"
	line "der Beweis!"
	done

CopycatText_GivePass:
	text "Also gut. Hier ist"
	line "der FAHRSCHEIN für"
	cont "den MAGNETZUG! Wie"
	cont "versprochen."
	done

CopycatText_ExplainPass:
	text "NACHAHMERIN: Das"
	line "ist der FAHRSCHEIN"
	cont "für den MAGNETZUG."

	para "Der Mann von der"
	line "Eisenbahn gab mir"

	para "das, als sie unser"
	line "altes Haus nieder-"

	para "rissen, um den"
	line "BAHNHOF zu bauen."
	done

CopycatText_Male_3:
	text "<PLAYER>: Hi!"
	line "Vielen Dank für"
	cont "den FAHRSCHEIN!"

	para "<PLAYER>: Bitte?"

	para "<PLAYER>: Ist es"
	line "wirklich so toll,"
	cont "jede Bewegung"
	cont "nachzuahmen?"
	done

CopycatText_ItsAScream:
	text "NACHAHMERIN: "
	line "Darauf kannst du"
	cont "wetten!"
	done

CopycatsDodrioText1:
	text "DODRI: Gii giii!"
	done

CopycatsDodrioText2:
	text "SPIEGLEIN, SPIEG-"
	line "LEIN AN DER WAND,"

	para "WER IST DIE"
	line ""
	line "SCHÖNSTE IM GANZEN"

	para "LAND?"
	done

CopycatsHouse2FDollText:
	text "Das ist ein"
	line "seltenes #MON!"
	cont "Was?"

	para "Es ist nur eine"
	line "Puppe…"
	done

CopycatsHouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  0, COPYCATS_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, CopycatsHouse2FBookshelf
	bg_event  1,  1, BGEVENT_READ, CopycatsHouse2FBookshelf

	def_object_events
	object_event  4,  3, SPRITE_COPYCAT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Copycat, -1
	object_event  6,  4, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CopycatsDodrio, -1
	object_event  6,  1, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, EVENT_COPYCATS_HOUSE_2F_DOLL
	object_event  2,  1, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, -1
	object_event  7,  1, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, -1
