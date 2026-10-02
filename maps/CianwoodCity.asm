	object_const_def
	const CIANWOODCITY_STANDING_YOUNGSTER
	const CIANWOODCITY_POKEFAN_M
	const CIANWOODCITY_LASS
	const CIANWOODCITY_ROCK1
	const CIANWOODCITY_ROCK2
	const CIANWOODCITY_ROCK3
	const CIANWOODCITY_ROCK4
	const CIANWOODCITY_ROCK5
	const CIANWOODCITY_ROCK6
	const CIANWOODCITY_POKEFAN_F

CianwoodCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CianwoodCityFlypointCallback

CianwoodCityFlypointCallback:
	setflag ENGINE_FLYPOINT_CIANWOOD
	endcallback

CianwoodCityChucksWife:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM02_FLY
	iftrue .GotFly
	writetext ChucksWifeEasierToFlyText
	promptbutton
	checkevent EVENT_BEAT_CHUCK
	iftrue .BeatChuck
	writetext ChucksWifeBeatChuckText
	waitbutton
	closetext
	end

.BeatChuck:
	writetext ChucksWifeGiveHMText
	promptbutton
	verbosegiveitem HM_FLY
	iffalse .Done
	setevent EVENT_GOT_HM02_FLY
	writetext ChucksWifeFlySpeechText
	promptbutton
.GotFly:
	writetext ChucksWifeChubbyText
	waitbutton
.Done:
	closetext
	end

CianwoodCityYoungster:
	jumptextfaceplayer CianwoodCityYoungsterText

CianwoodCityPokefanM:
	jumptextfaceplayer CianwoodCityPokefanMText

CianwoodCityLass:
	jumptextfaceplayer CianwoodCityLassText

CianwoodCityUnusedScript: ; unreferenced
	jumptextfaceplayer CianwoodCityUnusedText

CianwoodCitySign:
	jumptext CianwoodCitySignText

CianwoodGymSign:
	jumptext CianwoodGymSignText

CianwoodPharmacySign:
	jumptext CianwoodPharmacySignText

CianwoodPhotoStudioSign:
	jumptext CianwoodPhotoStudioSignText

CianwoodPokecenterSign:
	jumpstd PokecenterSignScript

CianwoodCityRock:
	jumpstd SmashRockScript

CianwoodCityHiddenRevive:
	hiddenitem REVIVE, EVENT_CIANWOOD_CITY_HIDDEN_REVIVE

CianwoodCityHiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_CIANWOOD_CITY_HIDDEN_MAX_ETHER

ChucksWifeEasierToFlyText:
	text "Du hast das Meer"
	line "überquert, um"

	para "hierher zu kommen?"
	line "Das war sicher"
	cont "nicht einfach."

	para "Es wäre viel ein-"
	line "facher, wenn deine"

	para "#MON FLIEGEN"
	line "einsetzen könnten…"
	done

ChucksWifeBeatChuckText:
	text "Ohne den ORDEN"
	line "dieser Stadt ist"
	cont "FLIEGEN nutzlos."

	para "Wenn du den ARENA-"
	line "LEITER geschlagen"
	cont "hast, besuche mich"
	cont "wieder."

	para "Ich werde dir dann"
	line "ein Geschenk über-"
	cont "reichen."
	done

ChucksWifeGiveHMText:
	text "Das ist der ORDEN"
	line "der ARENA von"
	cont "ANEMONIA CITY!"

	para "Dann soll dir"
	line "diese VM gehören."
	done

ChucksWifeFlySpeechText:
	text "Bring deinen #-"
	line "MON FLIEGEN bei."

	para "Du kannst dann so-"
	line "fort in jede Stadt"

	para "FLIEGEN, die du"
	line "bereits besucht"
	cont "hast."
	done

ChucksWifeChubbyText:
	text "Mein Mann hat ge-"
	line "gen dich verloren."
	cont "Also muss er här-"
	cont "ter trainieren."

	para "Das ist auch gut"
	line "so. Er hat in"
	cont "letzter Zeit etwas"
	cont "Speck angesetzt."
	done

CianwoodCityYoungsterText:
	text "Setzt du FLIEGEN"
	line "ein, kannst du di-"

	para "rekt von hier aus"
	line "nach OLIVIANA CITY"
	cont "reisen."
	done

CianwoodCityPokefanMText:
	text "Die Felsen nörd-"
	line "lich der Stadt"
	cont "können zerschmet-"
	cont "tert werden."

	para "Vielleicht findest"
	line "du etwas unter"
	cont "ihnen."

	para "Deine #MON"
	line "können ZERTRÜMME-"
	cont "RER einsetzen, um"
	cont "sie aus dem Weg zu"
	cont "räumen."
	done

CianwoodCityLassText:
	text "HARTWIG, der ARE-"
	line "NALEITER steigt"

	para "gerne mit seinen"
	line "#MON in den"
	cont "Ring."
	done

CianwoodCityUnusedText:
	text "Es gibt mehrere"
	line "Inseln zwischen"
	cont "hier und OLIVIANA"
	cont "CITY."

	para "Man sagt, dass"
	line "dort ein mythi-"
	cont "sches Wesen leben"
	cont "soll."
	done

CianwoodCitySignText:
	text "ANEMONIA CITY"

	para "Eine Hafenstadt"
	line "umgeben von stür-"
	cont "mischer See"
	done

CianwoodGymSignText:
	text "ANEMONIA CITY"
	line "#MON ARENA"

	para "LEITER: HARTWIG"

	para "Er spricht durch"
	line "seine Fäuste"
	done

CianwoodPharmacySignText:
	text "500 Jahre voller"
	line "Tradition."

	para "APOTHEKE von"
	line "ANEMONIA CITY"

	para "Gerne erwarten wir"
	line "Ihre medizinischen"
	cont "Fragen"
	done

CianwoodPhotoStudioSignText:
	text "FOTOSTUDIO von"
	line "ANEMONIA CITY"

	para "Machen Sie einen"
	line "Schnappschuss zur"
	cont "Erinnerung!"
	done

CianwoodCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 41, MANIAS_HOUSE, 1
	warp_event  8, 43, CIANWOOD_GYM, 1
	warp_event 23, 43, CIANWOOD_POKECENTER_1F, 1
	warp_event 15, 47, CIANWOOD_PHARMACY, 1
	warp_event  9, 31, CIANWOOD_PHOTO_STUDIO, 1
	warp_event 15, 37, CIANWOOD_LUGIA_SPEECH_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 20, 34, BGEVENT_READ, CianwoodCitySign
	bg_event  7, 45, BGEVENT_READ, CianwoodGymSign
	bg_event 24, 43, BGEVENT_READ, CianwoodPokecenterSign
	bg_event 19, 47, BGEVENT_READ, CianwoodPharmacySign
	bg_event  8, 32, BGEVENT_READ, CianwoodPhotoStudioSign
	bg_event  8, 16, BGEVENT_ITEM, CianwoodCityHiddenRevive
	bg_event  5, 29, BGEVENT_ITEM, CianwoodCityHiddenMaxEther

	def_object_events
	object_event 21, 37, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodCityYoungster, -1
	object_event 17, 31, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityPokefanM, -1
	object_event 14, 42, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityLass, -1
	object_event  8, 16, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event 11, 15, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  6, 24, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  5, 29, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event 10, 27, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  7, 17, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event 10, 46, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityChucksWife, -1
