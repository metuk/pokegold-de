	object_const_def
	const TINTOWER1F_SAGE

TinTower1F_MapScripts:
	def_scene_scripts

	def_callbacks

TinTowerSageScript:
	jumptextfaceplayer TinTowerSageText

TinTowerSageText:
	text "Ich versuche, das"
	line "Rätsel um das"

	para "legendäre #MON,"
	line "das hier landen"
	cont "soll, zu lösen."

	para "Man sagt, dass das"
	line "#MON ständig"

	para "fliegt, seitdem"
	line "der TURM im Westen"
	cont "abgebrannt ist."

	para "Also habe ich mir"
	line "gedacht, dass das"

	para "#MON angelockt"
	line "wird, wenn ich ein"
	cont "Item besitze, das"
	cont "es auch besitzt."

	para "Ich glaube, dieses"
	line "Item ist…"

	para "Eine BUNTSCHWINGE!"

	para "Aber wo finde"
	line "ich eine solche?"
	done

TinTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 15, ECRUTEAK_CITY, 12
	warp_event 10, 15, ECRUTEAK_CITY, 12
	warp_event 10,  2, TIN_TOWER_2F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 10,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTowerSageScript, EVENT_TEAM_ROCKET_DISBANDED
