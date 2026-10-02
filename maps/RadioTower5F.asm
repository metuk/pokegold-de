	object_const_def
	const RADIOTOWER5F_DIRECTOR
	const RADIOTOWER5F_ROCKET
	const RADIOTOWER5F_ROCKET_GIRL
	const RADIOTOWER5F_ROCKER

RadioTower5F_MapScripts:
	def_scene_scripts
	scene_script RadioTower5FNoop1Scene, SCENE_RADIOTOWER5F_FAKE_DIRECTOR
	scene_script RadioTower5FNoop2Scene, SCENE_RADIOTOWER5F_ROCKET_BOSS
	scene_script RadioTower5FNoop3Scene, SCENE_RADIOTOWER5F_NOOP

	def_callbacks

RadioTower5FNoop1Scene:
	end

RadioTower5FNoop2Scene:
	end

RadioTower5FNoop3Scene:
	end

FakeDirectorScript:
	turnobject RADIOTOWER5F_DIRECTOR, UP
	showemote EMOTE_SHOCK, RADIOTOWER5F_DIRECTOR, 15
	opentext
	writetext FakeDirectorTextBefore1
	waitbutton
	closetext
	applymovement RADIOTOWER5F_DIRECTOR, FakeDirectorMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext FakeDirectorTextBefore2
	waitbutton
	closetext
	winlosstext FakeDirectorWinText, 0
	setlasttalked RADIOTOWER5F_DIRECTOR
	loadtrainer EXECUTIVEM, EXECUTIVEM_3
	startbattle
	reloadmapafterbattle
	opentext
	writetext FakeDirectorTextAfter
	promptbutton
	verbosegiveitem BASEMENT_KEY
	closetext
	setscene SCENE_RADIOTOWER5F_ROCKET_BOSS
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_3
	end

Director:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .TrueDirector
	writetext FakeDirectorTextAfter
	waitbutton
	closetext
	end

.TrueDirector:
	writetext RadioTower5FDirectorText
	waitbutton
	closetext
	end

TrainerExecutivef1:
	trainer EXECUTIVEF, EXECUTIVEF_1, EVENT_BEAT_ROCKET_EXECUTIVEF_1, Executivef1SeenText, Executivef1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Executivef1AfterBattleText
	waitbutton
	closetext
	end

RadioTower5FRocketBossScript:
	applymovement PLAYER, RadioTower5FPlayerTwoStepsLeftMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject RADIOTOWER5F_ROCKET, RIGHT
	opentext
	writetext RadioTower5FRocketBossBeforeText
	waitbutton
	closetext
	winlosstext RadioTower5FRocketBossWinText, 0
	setlasttalked RADIOTOWER5F_ROCKET
	loadtrainer EXECUTIVEM, EXECUTIVEM_1
	startbattle
	reloadmapafterbattle
	opentext
	writetext RadioTower5FRocketBossAfterText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	disappear RADIOTOWER5F_ROCKET
	disappear RADIOTOWER5F_ROCKET_GIRL
	pause 15
	special FadeInFromBlack
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_1
	setevent EVENT_CLEARED_RADIO_TOWER
	clearflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	setevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_MAHOGANY_MART_OWNERS
	clearflag ENGINE_ROCKETS_IN_MAHOGANY
	clearevent EVENT_GOLDENROD_CITY_CIVILIANS
	clearevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
	setevent EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	clearevent EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	special PlayMapMusic
	disappear RADIOTOWER5F_DIRECTOR
	moveobject RADIOTOWER5F_DIRECTOR, 12, 0
	appear RADIOTOWER5F_DIRECTOR
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksIn
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower5FDirectorThankYouText
	promptbutton
	checkver
	iftrue .SilverWing
	verbosegiveitem RAINBOW_WING
	writetext RadioTower5FDirectorDescribeRainbowWingText
	waitbutton
	closetext
	setscene SCENE_RADIOTOWER5F_NOOP
	setevent EVENT_GOT_RAINBOW_WING
	setevent EVENT_TEAM_ROCKET_DISBANDED
	sjump .GotWing

.SilverWing:
	verbosegiveitem SILVER_WING
	writetext RadioTower5FDirectorDescribeSilverWingText
	waitbutton
	closetext
	setscene SCENE_RADIOTOWER5F_NOOP
	setevent EVENT_GOT_SILVER_WING
.GotWing:
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksOut
	playsound SFX_EXIT_BUILDING
	disappear RADIOTOWER5F_DIRECTOR
	end

Ben:
	jumptextfaceplayer BenText

RadioTower5FDirectorsOfficeSign:
	jumptext RadioTower5FDirectorsOfficeSignText

RadioTower5FStudio1Sign:
	jumptext RadioTower5FStudio1SignText

RadioTower5FBookshelf:
	jumpstd MagazineBookshelfScript

FakeDirectorMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

RadioTower5FDirectorWalksIn:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step_end

RadioTower5FDirectorWalksOut:
	step RIGHT
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

RadioTower5FPlayerTwoStepsLeftMovement:
	step LEFT
	step LEFT
	step_end

FakeDirectorTextBefore1:
	text "D-Du! Bist du"
	line "gekommen, um mich"
	cont "zu retten?"
	done

FakeDirectorTextBefore2:
	text "Ist es das, was du"
	line "erwartet hast?"

	para "Falsch! Ich bin"
	line "ein Betrüger!"

	para "Ich gebe vor, der"
	line "Echte zu sein, um"

	para "unsere Übernahme"
	line "vorzubereiten."

	para "Möchtest du wis-"
	line "sen, wo wir den"
	cont "echten INTENDANTEN"
	cont "versteckt haben?"

	para "Ich werde es dir"
	line "verraten, wenn"
	cont "du mich besiegst!"
	done

FakeDirectorWinText:
	text "O.K. Ich sage"
	line "dir, wo er ist."
	done

FakeDirectorTextAfter:
	text "Wir haben den"
	line "echten INTENDANTEN"

	para "in das UNTERGRUND-"
	line "LAGERHAUS"
	cont "verschleppt."

	para "Es ist am Ende"
	line "des UNTERGRUNDs."

	para "Ich bezweifle"
	line "aber, dass du"
	cont "so weit kommst."
	done

Executivef1SeenText:
	text "Kleiner, kennst"
	line "du mich noch"

	para "aus dem VERSTECK"
	line "in MAHAGONIA CITY?"

	para "Damals habe ich"
	line "verloren, aber"
	cont "diesmal wird mir"
	cont "das nicht pas-"
	cont "sieren."
	done

Executivef1BeatenText:
	text "Das darf nicht"
	line "wahr sein!"

	para "Ich habe mich so"
	line "angestrengt und"
	cont "dennoch verloren…"
	done

Executivef1AfterBattleText:
	text "<PLAYER>, richtig?"

	para "Ein Knirps wie du"
	line "weiß den Glamour"

	para "von TEAM ROCKET"
	line "nicht zu schätzen."

	para "Eigentlich schade."
	line "Mir imponiert"
	cont "deine Stärke."
	done

RadioTower5FRocketBossBeforeText:
	text "Oh? Du bist"
	line "so weit gekommen?"

	para "Du musst ein aus-"
	line "gezeichneter Trai-"
	cont "ner sein."

	para "Wir planen, die"
	line "RADIOSTATION zu"

	para "annektieren und"
	line "unsere Rückkehr"
	cont "bekanntzugeben."

	para "Das sollte unseren"
	line "Anführer GIOVANNI"

	para "überzeugen, sein"
	line "Solo-Training"
	cont "abzubrechen und"
	cont "zurückzukehren."

	para "Wir werden unseren"
	line "früheren Ruhm"
	cont "wiedererlangen."

	para "Ich werde nicht"
	line "zulassen, dass du"
	cont "unsere Pläne"
	cont "durchkreuzt."
	done

RadioTower5FRocketBossWinText:
	text "Nein! Vergib mir,"
	line "GIOVANNI!"
	done

RadioTower5FRocketBossAfterText:
	text "Wie kann das sein?"

	para "Unsere Träume wur-"
	line "den zerschlagen."

	para "Ich konnte meine"
	line "Aufgabe nicht"
	cont "erfüllen."

	para "Wie GIOVANNI"
	line "werde ich TEAM"

	para "ROCKET hier und"
	line "heute auflösen."

	para "Leb wohl."
	done

RadioTower5FDirectorThankYouText:
	text "INTENDANT:"
	line "<PLAYER>,"

	para "vielen Dank!"
	line "Dein Wagemut hat"

	para "alle #MON"
	line "dieses Landes"

	para "gerettet."
	line "Ich weiß, es ist"

	para "nicht viel, aber"
	line "nimm dies."
	done

RadioTower5FDirectorDescribeRainbowWingText:
	text "Früher stand genau"
	line "hier in DUKATIA"
	cont "CITY ein Turm."

	para "Aber er war alt"
	line "und baufällig."

	para "Also haben wir"
	line "dort die RADIO-"
	cont "STATION errichtet."

	para "Beim Abriss"
	line "fanden wir dies"
	cont "auf der Spitze."

	para "Man sagt, riesige"
	line "#MON flogen"

	para "früher über"
	line "DUKATIA CITY."

	para "Vielleicht hat ein"
	line "#MON diesen"
	cont "Gegenstand ver-"
	cont "loren."

	para "Ähnlich wie jenes,"
	line "das am ZINNTURM"

	para "in TEAK CITY"
	line "auftaucht."

	para "O.K., ich muss in"
	line "mein BÜRO zurück."
	done

RadioTower5FDirectorDescribeSilverWingText:
	text "Früher stand genau"
	line "hier in DUKATIA"
	cont "CITY ein Turm."

	para "Aber er war alt"
	line "und baufällig."

	para "Also haben wir"
	line "dort die RADIO-"
	cont "STATION errichtet."

	para "Beim Abriss"
	line "fanden wir dies"
	cont "auf der Spitze."

	para "Man sagt, riesige"
	line "#MON flogen"

	para "früher über"
	line "DUKATIA CITY."

	para "Vielleicht hat ein"
	line "#MON diesen"
	cont "Gegenstand ver-"
	cont "loren."

	para "Ähnlich wie jenes,"
	line "das bei den"

	para "STRUDELINSELN nahe"
	line "bei ANEMONIA CITY"
	cont "auftaucht."

	para "O.K., ich muss in"
	line "mein BÜRO zurück."
	done

RadioTower5FDirectorText:
	text "INTENDANT: Hallo,"
	line "<PLAYER>!"

	para "Weißt du, ich"
	line "liebe #MON."

	para "Ich habe diese"
	line "RADIOSTATION "

	para "gegründet, um"
	line "meiner Liebe zu"
	cont "#MON Ausdruck"
	cont "zu verleihen."

	para "Es wäre toll, wenn"
	line "unsere Sendungen"
	cont "beliebt wären."
	done

BenText:
	text "BEN: Hörst du dir"
	line "unsere Musik an?"
	done

RadioTower5FDirectorsOfficeSignText:
	text "S4 Büro des"
	line "INTENDANTEN"
	done

RadioTower5FStudio1SignText:
	text "S4 STUDIO 1"
	done

RadioTower5F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_4F, 1
	warp_event 12,  0, RADIO_TOWER_4F, 3

	def_coord_events
	coord_event  0,  3, SCENE_RADIOTOWER5F_FAKE_DIRECTOR, FakeDirectorScript
	coord_event 16,  5, SCENE_RADIOTOWER5F_ROCKET_BOSS, RadioTower5FRocketBossScript

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, RadioTower5FDirectorsOfficeSign
	bg_event 11,  0, BGEVENT_READ, RadioTower5FStudio1Sign
	bg_event 15,  0, BGEVENT_READ, RadioTower5FStudio1Sign
	bg_event 16,  1, BGEVENT_READ, RadioTower5FBookshelf
	bg_event 17,  1, BGEVENT_READ, RadioTower5FBookshelf

	def_object_events
	object_event  3,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Director, -1
	object_event 13,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 17,  2, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerExecutivef1, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 13,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Ben, EVENT_RADIO_TOWER_CIVILIANS_AFTER
