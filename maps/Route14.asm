	object_const_def
	const ROUTE14_POKEFAN_M1
	const ROUTE14_YOUNGSTER
	const ROUTE14_POKEFAN_M2
	const ROUTE14_KIM

Route14_MapScripts:
	def_scene_scripts

	def_callbacks

Kim:
	faceplayer
	opentext
	trade NPC_TRADE_KIM
	waitbutton
	closetext
	end

TrainerPokefanmCarter:
	trainer POKEFANM, CARTER, EVENT_BEAT_POKEFANM_CARTER, PokefanmCarterSeenText, PokefanmCarterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmCarterAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperRoy:
	trainer BIRD_KEEPER, ROY, EVENT_BEAT_BIRD_KEEPER_ROY, BirdKeeperRoySeenText, BirdKeeperRoyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRoyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmTrevor:
	trainer POKEFANM, TREVOR, EVENT_BEAT_POKEFANM_TREVOR, PokefanmTrevorSeenText, PokefanmTrevorBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmTrevorAfterBattleText
	waitbutton
	closetext
	end

PokefanmCarterSeenText:
	text "Eines kann ich dir"
	line "sagen! Es war"

	para "harte Arbeit, mei-"
	line "ne prämierten"
	cont "#MON zu fangen."
	done

PokefanmCarterBeatenText:
	text "Uaaaah!"
	done

PokefanmCarterAfterBattleText:
	text "SCHIGGY, GLUMANDA"
	line "und BISASAM…"

	para "Ich denke, das ist"
	line "ein ausgeglichenes"
	cont "Team."
	done

BirdKeeperRoySeenText:
	text "Ich träume davon,"
	line "mit meinen ge-"
	cont "liebten Vogel-"
	cont "#MON zu"
	cont "fliegen."
	done

BirdKeeperRoyBeatenText:
	text "Ich kann träumen,"
	line "aber ich kann"
	cont "nicht fliegen…"
	done

BirdKeeperRoyAfterBattleText:
	text "Du hast #MON,"
	line "welche die VM"

	para "FLIEGEN kennen?"
	line "Ich beneide dich."
	done

PokefanmTrevorSeenText:
	text "Bist du gegen alle"
	line "ARENA-Trainer"
	cont "angetreten?"
	done

PokefanmTrevorBeatenText:
	text "Oh, wow! Zu"
	line "stark für mich!"
	done

PokefanmTrevorAfterBattleText:
	text "Besitzt du die"
	line "ORDEN von KANTO,"

	para "bist du im"
	line "Vorteil, wenn du"
	cont "via Link-Kabel"
	cont "gegen einen Freund"
	cont "antrittst."
	done

Route14_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event 12, 14, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanmCarter, -1
	object_event 11, 27, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRoy, -1
	object_event  5,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanmTrevor, -1
	object_event  7,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 4, Kim, -1
