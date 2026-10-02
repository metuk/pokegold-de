	object_const_def
	const RADIOTOWER2F_SUPER_NERD
	const RADIOTOWER2F_TEACHER
	const RADIOTOWER2F_ROCKET1
	const RADIOTOWER2F_ROCKET2
	const RADIOTOWER2F_ROCKET3
	const RADIOTOWER2F_ROCKET_GIRL
	const RADIOTOWER2F_BLACK_BELT1
	const RADIOTOWER2F_BLACK_BELT2
	const RADIOTOWER2F_JIGGLYPUFF

RadioTower2F_MapScripts:
	def_scene_scripts

	def_callbacks

RadioTower2FNoopScene: ; unreferenced
	end

RadioTower2FSuperNerdScript:
	jumptextfaceplayer RadioTower2FSuperNerdText

RadioTower2FTeacherScript:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	writetext RadioTower2FTeacherText
	waitbutton
	closetext
	end

.Rockets:
	writetext RadioTower2FTeacherText_Rockets
	waitbutton
	closetext
	end

RadioTowerJigglypuff:
	opentext
	writetext RadioTowerJigglypuffText
	cry JIGGLYPUFF
	waitbutton
	closetext
	end

RadioTower2FBlackBelt1Script:
	jumptextfaceplayer RadioTower2FBlackBelt1Text

RadioTower2FBlackBelt2Script:
	jumptextfaceplayer RadioTower2FBlackBelt2Text

TrainerGruntM4:
	trainer GRUNTM, GRUNTM_4, EVENT_BEAT_ROCKET_GRUNTM_4, GruntM4SeenText, GruntM4BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM4AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM5:
	trainer GRUNTM, GRUNTM_5, EVENT_BEAT_ROCKET_GRUNTM_5, GruntM5SeenText, GruntM5BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM5AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM6:
	trainer GRUNTM, GRUNTM_6, EVENT_BEAT_ROCKET_GRUNTM_6, GruntM6SeenText, GruntM6BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM6AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF2:
	trainer GRUNTF, GRUNTF_2, EVENT_BEAT_ROCKET_GRUNTF_2, GruntF2SeenText, GruntF2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF2AfterBattleText
	waitbutton
	closetext
	end

RadioTower2FSalesSign:
	jumptext RadioTower2FSalesSignText

RadioTower2FOaksPKMNTalkSign:
	jumptext RadioTower2FOaksPKMNTalkSignText

RadioTower2FPokemonRadioSign:
	jumptext RadioTower2FPokemonRadioSignText

RadioTower2FBookshelf:
	jumpstd MagazineBookshelfScript

RadioTower2FSuperNerdText:
	text "Du kannst überall"
	line "Radio hören."
	cont "Probierわ mal aus!"
	done

RadioTower2FTeacherText:
	text "Wenn #MON"
	line "Schlaflieder im"
	cont "Radio hören, "
	cont "schlafen sie ein."
	done

RadioTower2FTeacherText_Rockets:
	text "Warum möchten sie"
	line "den RADIOTURM"
	cont "besetzen?"
	done

RadioTowerJigglypuffText:
	text "PUMMELUFF:"
	line "Pummel…"
	done

RadioTower2FBlackBelt1Text:
	text "Zutritt nur für"
	line "autorisiertes"
	cont "Personal."

	para "Das war nicht"
	line "immer so."

	para "Mit unserem"
	line "INTENDANTEN stimmt"
	cont "irgendetwas nicht…"
	done

RadioTower2FBlackBelt2Text:
	text "Schau dich in"
	line "Ruhe um."

	para "Der INTENDANT ist"
	line "wieder nett. So,"
	cont "wie er früher war."
	done

GruntM4SeenText:
	text "Vor drei Jahren"
	line "war das TEAM"
	cont "ROCKET gezwungen,"
	cont "sich aufzulösen."

	para "Wir arbeiten hier"
	line "gerade an einem"
	cont "Comeback!"
	done

GruntM4BeatenText:
	text "Pah! Keine Zeit"
	line "für Sentimenta-"
	cont "litäten!"
	done

GruntM4AfterBattleText:
	text "Wir lassen es"
	line "nicht zu, dass du"
	cont "unsere Pläne"
	cont "durchkreuzt!"
	done

GruntM5SeenText:
	text "Wir sind TEAM"
	line "ROCKET, die #-"
	cont "MON-Ausbeuter!"

	para "Wir lieben es,"
	line "Böses zu tun! "
	cont "Hast du Angst?"
	done

GruntM5BeatenText:
	text "Du glaubst, du"
	line "bist ein Held?"
	done

GruntM5AfterBattleText:
	text "Wir sind nicht"
	line "immer böse. Wir"
	cont "tun nur, wonach"
	cont "uns ist."
	done

GruntM6SeenText:
	text "Hey! Halte dich"
	line "aus unseren Ange-"
	cont "legenheiten raus!"
	done

GruntM6BeatenText:
	text "Uff. Ich gebe auf."
	done

GruntM6AfterBattleText:
	text "Unsere VORSTÄNDE"
	line "wollen die Macht"
	cont "an sich reißen."

	para "Sie haben Großes"
	line "vor. Ich frage"
	cont "mich, was das"
	cont "wohl ist?"
	done

GruntF2SeenText:
	text "Hahaha!"

	para "Wie langweilig."
	line "Es war viel zu"

	para "leicht, hier das "
	line "Ruder zu"
	cont "übernehmen!"

	para "Komm schon!"
	line "Heitere mich auf!"
	done

GruntF2BeatenText:
	text "We-Wer bist du?"
	done

GruntF2AfterBattleText:
	text "Du hast mich"
	line "besiegt. Das werde"
	cont "ich nicht"
	cont "vergessen!"
	done

RadioTower2FSalesSignText:
	text "S1 VERKAUF"
	done

RadioTower2FOaksPKMNTalkSignText:
	text "PROF. EICHs #-"
	line "MON-TALK"

	para "Die beste Show"
	line "am Äther!"
	done

RadioTower2FPokemonRadioSignText:
	text "Überall, jederzeit"
	line "#MON Radio"
	done

RadioTower2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_3F, 1
	warp_event 15,  0, RADIO_TOWER_1F, 3

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, RadioTower2FSalesSign
	bg_event  5,  0, BGEVENT_READ, RadioTower2FOaksPKMNTalkSign
	bg_event  9,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 10,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 11,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 13,  0, BGEVENT_READ, RadioTower2FPokemonRadioSign

	def_object_events
	object_event  5,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower2FSuperNerdScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 13,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower2FTeacherScript, -1
	object_event  1,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM5, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM6, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 10,  5, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGruntF2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  0,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower2FBlackBelt1Script, EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	object_event  1,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower2FBlackBelt2Script, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event 12,  1, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTowerJigglypuff, -1
