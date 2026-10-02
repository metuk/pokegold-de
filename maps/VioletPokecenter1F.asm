	object_const_def
	const VIOLETPOKECENTER1F_NURSE
	const VIOLETPOKECENTER1F_SUPER_NERD
	const VIOLETPOKECENTER1F_GENTLEMAN
	const VIOLETPOKECENTER1F_YOUNGSTER
	const VIOLETPOKECENTER1F_ELMS_AIDE

VioletPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

VioletPokecenterNurse:
	jumpstd PokecenterNurseScript

VioletPokecenter1F_ElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	iftrue .SecondTimeAsking
	writetext VioletPokecenterElmsAideFavorText
.AskTakeEgg:
	yesorno
	iffalse .RefusedEgg
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	giveegg TOGEPI, EGG_LEVEL
	getstring STRING_BUFFER_4, .eggname
	scall .AideGivesEgg
	setevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	clearevent EVENT_ELMS_AIDE_IN_LAB
	clearevent EVENT_TOGEPI_HATCHED
	setmapscene ROUTE_32, SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	writetext VioletPokecenterElmsAideGiveEggText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal UP, .AideWalksAroundPlayer
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideWalksStraightOutOfPokecenter
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_ELMS_AIDE
	waitsfx
	end

.AideWalksAroundPlayer:
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideWalksLeftToExitPokecenter
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideFinishesLeavingPokecenter
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_ELMS_AIDE
	waitsfx
	end

.eggname
	db "EI@"

.AideGivesEgg:
	jumpstd ReceiveTogepiEggScript
	end

.PartyFull:
	writetext VioletCityElmsAideFullPartyText
	waitbutton
	closetext
	end

.RefusedEgg:
	writetext VioletPokecenterElmsAideRefuseText
	waitbutton
	closetext
	setevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	end

.SecondTimeAsking:
	writetext VioletPokecenterElmsAideAskEggText
	sjump .AskTakeEgg

VioletPokecenter1FSuperNerdScript:
	jumptextfaceplayer VioletPokecenter1FSuperNerdText

VioletPokecenter1FGentlemanScript:
	jumptextfaceplayer VioletPokecenter1FGentlemanText

VioletPokecenter1FYoungsterScript:
	jumptextfaceplayer VioletPokecenter1FYoungsterText

MovementData_AideWalksStraightOutOfPokecenter:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_AideWalksLeftToExitPokecenter:
	step LEFT
	step DOWN
	step_end

MovementData_AideFinishesLeavingPokecenter:
	step DOWN
	step DOWN
	step DOWN
	step_end

VioletPokecenterElmsAideFavorText:
	text "<PLAYER>, lange"
	line "nicht gesehen."

	para "PROF. LIND hat"
	line "mich gebeten, nach"
	cont "dir zu suchen."

	para "Er hat noch eine"
	line "Bitte an dich."

	para "Nimm bitte das"
	line "#MON-EI!"
	done

VioletPokecenterElmsAideGiveEggText:
	text "Wir haben ent-"
	line "deckt, dass ein"

	para "#MON erst"
	line "schlüpft, nachdem"

	para "es im EI gewachsen"
	line "ist."

	para "Außerdem muss es"
	line "sich in der Nähe"
	cont "anderer #MON"
	cont "befinden, um zu"
	cont "schlüpfen."

	para "<PLAYER>, du bist"
	line "die einzige Per-"
	cont "son, auf die wir"
	cont "uns verlassen"
	cont "können."

	para "Bitte ruf PROF."
	line "LIND an, wenn das"
	cont "EI so weit ist!"
	done

VioletCityElmsAideFullPartyText:
	text "Oh, du hast keinen"
	line "Platz mehr für ein"
	cont "weiteres #MON."

	para "Ich warte hier,"
	line "bis du Platz für"
	cont "das EI geschaffen"
	cont "hast."
	done

VioletPokecenterElmsAideRefuseText:
	text "A-Aber… PROF."
	line "LIND hat nach dir"
	cont "gefragt…"
	done

VioletPokecenterElmsAideAskEggText:
	text "<PLAYER>, nimmst du"
	line "das EI?"
	done

VioletPokecenter1FSuperNerdText:
	text "Ein Kerl namens"
	line "BILL hat das"

	para "#MON-PC-Lage-"
	line "rungs-System"

	para "erfunden."
	done

VioletPokecenter1FGentlemanText:
	text "Es war vor etwa"
	line "drei Jahren."

	para "TEAM ROCKET hatte"
	line "etwas Übles mit"
	cont "den #MON vor."

	para "Aber die Gerech-"
	line "tigkeit hat ge-"
	cont "siegt! Ein junger"
	cont "Trainer hat sie"
	cont "zerschlagen."
	done

VioletPokecenter1FYoungsterText:
	text "#MON sind"
	line "schlau. Sie gehor-"

	para "chen nur Trainern,"
	line "vor denen sie auch"
	cont "Respekt haben."

	para "Hat der Trainer"
	line "nicht genug ORDEN,"

	para "machen sie, was"
	line "sie wollen."
	done

VioletPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, VIOLET_CITY, 5
	warp_event  4,  7, VIOLET_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletPokecenterNurse, -1
	object_event  7,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FSuperNerdScript, -1
	object_event  1,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FGentlemanScript, -1
	object_event  8,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FYoungsterScript, -1
	object_event  4,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1F_ElmsAideScript, EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
