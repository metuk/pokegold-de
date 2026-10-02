	object_const_def
	const VERMILIONFISHINGSPEECHHOUSE_FISHING_GURU

VermilionFishingSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

FishingDude:
	jumptextfaceplayer FishingDudeText

FishingDudesHousePhoto:
	jumptext FishingDudesHousePhotoText

FishingDudesHouseBookshelf: ; unreferenced
	jumpstd PictureBookshelfScript

FishingDudeText:
	text "Ich bin der PROFI-"
	line "ANGLER, der äl-"
	cont "tere der GEBR."
	cont "ANGLER."

	para "Kennst du zufällig"
	line "ANGLER ALFRIED? Er"

	para "angelt an der"
	line "ROUTE 44."

	para "Er hat mir"
	line "telefonisch einen"
	cont "super Tipp gesagt."

	para "Ihm habe ich es zu"
	line "verdanken, dass"

	para "ich ganz viele"
	line "seltene #MON"

	para "fangen konnte."
	line "Das war ein Tag!"
	done

FishingDudesHousePhotoText:
	text "Das ist ein Foto,"
	line "auf dem Angler zu"
	cont "sehen sind…"

	para "Sie haben viel"
	line "Spaß beim Angeln…"
	done

VermilionFishingSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 1
	warp_event  3,  7, VERMILION_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, FishingDudesHousePhoto

	def_object_events
	object_event  2,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FishingDude, -1
