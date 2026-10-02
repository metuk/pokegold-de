	object_const_def
	const GOLDENRODPOKECENTER1F_NURSE
	const GOLDENRODPOKECENTER1F_GAMEBOY_KID
	const GOLDENRODPOKECENTER1F_FISHER
	const GOLDENRODPOKECENTER1F_TWIN

GoldenrodPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

GoldenrodPokecenter1FGameboyKidScript:
	faceplayer
	opentext
	writetext GoldenrodPokecenter1FGameboyKidText
	waitbutton
	closetext
	turnobject GOLDENRODPOKECENTER1F_GAMEBOY_KID, DOWN
	end

GoldenrodPokecenter1FPersonScript:
	jumptextfaceplayer GoldenrodPokecenter1FPersonText

GoldenrodPokecenter1FLassScript:
	jumptextfaceplayer GoldenrodPokecenter1FLassText

GoldenrodPokecenter1FGameboyKidText:
	text "Im oberen Stock-"
	line "werk jedes #-"

	para "MON CENTERs fin-"
	line "dest du das KOLOS-"

	para "SEUM. Hier kannst"
	line "du gegen Freunde"
	cont "antreten."

	para "Kampfergebnisse"
	line "werden an der Wand"

	para "ausgehängt. Ich"
	line "kann es mir nicht"

	para "erlauben, zu ver-"
	line "lieren."
	done

GoldenrodPokecenter1FPersonText:
	text "Ich frage mich,"
	line "wie viele Arten"

	para "von #MON es"
	line "wohl geben mag."

	para "Vor drei Jahren"
	line "hat PROF. EICH"

	para "verlautbart, dass"
	line "es 150 verschie-"

	para "dene Arten geben"
	line "soll."
	done

GoldenrodPokecenter1FLassText:
	text "Ein starkes #-"
	line "MON muss nicht"
	cont "zwingend gewinnen."

	para "Meist entscheidet"
	line "der Vor- oder"
	cont "Nachteil des Typs."

	para "Ich glaube nicht,"
	line "dass es ein #-"

	para "MON gibt, das al-"
	line "len anderen über-"

	para "legen ist."
	done

GoldenrodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, GOLDENROD_CITY, 7
	warp_event  4,  7, GOLDENROD_CITY, 7
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FNurseScript, -1
	object_event  7,  2, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FGameboyKidScript, -1
	object_event  8,  6, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FPersonScript, -1
	object_event  0,  5, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FLassScript, -1
