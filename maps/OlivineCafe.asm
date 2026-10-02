	object_const_def
	const OLIVINECAFE_SAILOR
	const OLIVINECAFE_FISHING_GURU

OlivineCafe_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineCafeStrengthSailorScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM04_STRENGTH
	iftrue .GotStrength
	writetext OlivineCafeStrengthSailorText
	promptbutton
	verbosegiveitem HM_STRENGTH
	setevent EVENT_GOT_HM04_STRENGTH
.GotStrength:
	writetext OlivineCafeStrengthSailorText_GotStrength
	waitbutton
	closetext
	end

OlivineCafeFishingGuruScript:
	jumptextfaceplayer OlivineCafeFishingGuruText

OlivineCafeStrengthSailorText:
	text "Ha! Deine #MON"
	line "sind ja nur Flie-"
	cont "gengewichte!"

	para "Sie haben nicht"
	line "die Kraft, Felsen"
	cont "aus dem Weg zu"
	cont "räumen."

	para "Hier, nimm das und"
	line "bring ihnen STÄRKE"
	cont "bei!"

	para "Du benötigst den"
	line "ORDEN von DUKATIA"

	para "CITY, um sie"
	line "außerhalb von"

	para "Kämpfen einsetzen"
	line "zu können."
	done

OlivineCafeStrengthSailorText_GotStrength:
	text "Der Einzige, auf"
	line "den du dich auf"

	para "hoher See verlas-"
	line "sen kannst, bist"
	cont "du selbst!"

	para "Ich bin so stolz"
	line "auf mich selbst!"
	done

OlivineCafeFishingGuruText:
	text "Gehtわ übers"
	line "Meer? Pass auf!"

	para "Auf dem Weg nach"
	line "ANEMONIA CITY gibt"
	cont "es Strudel."

	para "Deine #MON"
	line "müssen eine spe-"

	para "zielle Attacke be-"
	line "herrschen, um an"

	para "den Strudeln vor-"
	line "beizukommen."
	done

OlivineCafe_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 7
	warp_event  3,  7, OLIVINE_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeStrengthSailorScript, -1
	object_event  1,  5, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeFishingGuruScript, -1
