	object_const_def
	const POKECENTER2F_TRADE_RECEPTIONIST
	const POKECENTER2F_BATTLE_RECEPTIONIST
	const POKECENTER2F_TIME_CAPSULE_RECEPTIONIST
	const POKECENTER2F_OFFICER

Pokecenter2F_MapScripts:
	def_scene_scripts
	scene_script Pokecenter2FCheckMysteryGiftScene, SCENE_POKECENTER2F_CHECK_MYSTERY_GIFT
	scene_script Pokecenter2FLeaveTradeCenterScene, SCENE_POKECENTER2F_LEAVE_TRADE_CENTER
	scene_script Pokecenter2FLeaveColosseumScene,   SCENE_POKECENTER2F_LEAVE_COLOSSEUM
	scene_script Pokecenter2FLeaveTimeCapsuleScene, SCENE_POKECENTER2F_LEAVE_TIME_CAPSULE

	def_callbacks

Pokecenter2FCheckMysteryGiftScene:
	special CheckMysteryGift
	ifequal $0, .done
	clearevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .done
	sdefer Pokecenter2F_AppearMysteryGiftDeliveryGuy
.done
	end

Pokecenter2FLeaveTradeCenterScene:
	sdefer Script_LeftCableTradeCenter
	end

Pokecenter2FLeaveColosseumScene:
	sdefer Script_LeftCableColosseum
	end

Pokecenter2FLeaveTimeCapsuleScene:
	sdefer Script_LeftTimeCapsule
	end

Pokecenter2F_AppearMysteryGiftDeliveryGuy:
	appear POKECENTER2F_OFFICER
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	end

Script_TradeCenterClosed:
	faceplayer
	opentext
	writetext Text_TradeRoomClosed
	waitbutton
	closetext
	end

Script_BattleRoomClosed:
	faceplayer
	opentext
	writetext Text_BattleRoomClosed
	waitbutton
	closetext
	end

LinkReceptionistScript_Trade:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse Script_TradeCenterClosed
	special SetBitsForLinkTradeRequest
	opentext
	writetext Text_TradeReceptionistIntro
	yesorno
	iffalse .AbortLink
	writetext Text_PleaseWait
	special WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special CheckLinkTimeout_Receptionist
	iffalse .LinkTimedOut
	readmem wOtherPlayerLinkMode
	iffalse .LinkedToFirstGen
	special CheckBothSelectedSameRoom
	iffalse .IncompatibleRooms
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsUp
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext YourFriendIsNotReadyText
	closetext
	end

.LinkedToFirstGen:
	special FailedLinkToPast
	writetext Text_CantLinkToThePast
	special CloseLink
	closetext
	end

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
	special CloseLink
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	sjump .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special WaitForOtherPlayerToExit
	closetext
	end

LinkReceptionistScript_Battle:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse Script_BattleRoomClosed
	special SetBitsForBattleRequest
	opentext
	writetext Text_BattleReceptionistIntro
	yesorno
	iffalse .AbortLink
	writetext Text_PleaseWait
	special WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special CheckLinkTimeout_Receptionist
	iffalse .LinkTimedOut
	readmem wOtherPlayerLinkMode
	iffalse .LinkedToFirstGen
	special CheckBothSelectedSameRoom
	iffalse .IncompatibleRooms
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsUp
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext YourFriendIsNotReadyText
	closetext
	end

.LinkedToFirstGen:
	special FailedLinkToPast
	writetext Text_CantLinkToThePast
	special CloseLink
	closetext
	end

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
	special CloseLink
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	sjump .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special WaitForOtherPlayerToExit
	closetext
	end

Script_TimeCapsuleClosed:
	faceplayer
	opentext
	writetext Text_TimeCapsuleClosed
	waitbutton
	closetext
	end

LinkReceptionistScript_TimeCapsule:
	checkevent EVENT_MET_BILL
	iftrue Script_TimeCapsuleClosed
	checkflag ENGINE_TIME_CAPSULE
	iftrue Script_TimeCapsuleClosed
	special SetBitsForTimeCapsuleRequest
	faceplayer
	opentext
	writetext Text_TimeCapsuleReceptionistIntro
	yesorno
	iffalse .Cancel
	special CheckTimeCapsuleCompatibility
	ifequal $1, .MonTooNew
	ifequal $2, .MonMoveTooNew
	ifequal $3, .MonHasMail
	writetext Text_PleaseWait
	special WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special CheckLinkTimeout_Receptionist
	iffalse .LinkTimedOut
	readmem wOtherPlayerLinkMode
	iffalse .OK
	special CheckBothSelectedSameRoom
	writetext Text_IncompatibleRooms
	special CloseLink
	closetext
	end

.OK:
	special EnterTimeCapsule
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal LEFT, .FacingLeft
	ifequal RIGHT, .FacingRight
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistStepsLeftLooksDown
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesTwoStepsUp
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext YourFriendIsNotReadyText
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	sjump .Cancel

.DidNotSave:
	writetext Text_PleaseComeAgain
.Cancel:
	special WaitForOtherPlayerToExit
	closetext
	end

.MonTooNew:
	writetext Text_RejectNewMon
	closetext
	end

.MonMoveTooNew:
	writetext Text_RejectMonWithNewMove
	closetext
	end

.MonHasMail:
	writetext Text_RejectMonWithMail
	closetext
	end

.FacingLeft:
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistStepsLeftLooksDown
	applymovement PLAYER, Pokecenter2FMovementData_PlayerWalksLeftAndUp
	warpcheck
	end

.FacingRight:
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistStepsRightLooksDown
	applymovement PLAYER, Pokecenter2FMovementData_PlayerWalksRightAndUp
	warpcheck
	end

Script_LeftCableTradeCenter:
	special WaitForOtherPlayerToExit
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsDown
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	setscene SCENE_POKECENTER2F_CHECK_MYSTERY_GIFT
	setmapscene TRADE_CENTER, SCENE_TRADECENTER_INITIALIZE
	end

Script_LeftCableColosseum:
	special WaitForOtherPlayerToExit
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsDown
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	setscene SCENE_POKECENTER2F_CHECK_MYSTERY_GIFT
	setmapscene COLOSSEUM, SCENE_COLOSSEUM_INITIALIZE
	end

Script_LeftTimeCapsule:
	special WaitForOtherPlayerToExit
	applymovement POKECENTER2F_TIME_CAPSULE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsLeftLooksRight
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesTwoStepsDown
	applymovement POKECENTER2F_TIME_CAPSULE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_2
	setscene SCENE_POKECENTER2F_CHECK_MYSTERY_GIFT
	setmapscene TIME_CAPSULE, SCENE_TIMECAPSULE_INITIALIZE
	end

Pokecenter2FLinkRecordSign:
	reanchormap
	special DisplayLinkRecord
	closetext
	end

Pokecenter2FOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
	iftrue .AlreadyGotGift
	writetext Text_MysteryGiftDeliveryGuy_Intro
	yesorno
	iffalse .RefusedGift
	writetext Text_MysteryGiftDeliveryGuy_HereYouGo
	promptbutton
	waitsfx
	special GetMysteryGiftItem
	iffalse .BagIsFull
	itemnotify
	setevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
.AlreadyGotGift:
	writetext Text_MysteryGiftDeliveryGuy_Outro
	waitbutton
	closetext
	end

.BagIsFull:
	writetext Text_MysteryGiftDeliveryGuy_NoRoom
	waitbutton
	closetext
	end

.RefusedGift:
	writetext Text_MysteryGiftDeliveryGuy_SaidNo
	waitbutton
	closetext
	end

Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight:
	slow_step UP
Pokecenter2FMovementData_ReceptionistStepsLeftLooksDown:
	slow_step LEFT
	turn_head DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightLooksDown:
	slow_step RIGHT
	turn_head DOWN
	step_end

Pokecenter2FMovementData_PlayerTakesThreeStepsUp:
	step UP
Pokecenter2FMovementData_PlayerTakesTwoStepsUp:
	step UP
	step UP
	step_end

Pokecenter2FMovementData_PlayerWalksLeftAndUp:
	step LEFT
	step UP
	step_end

Pokecenter2FMovementData_PlayerWalksRightAndUp:
	step RIGHT
	step UP
	step_end

Pokecenter2FMovementData_PlayerTakesThreeStepsDown:
	step DOWN
	step DOWN
	step DOWN
	step_end

Pokecenter2FMovementData_PlayerTakesTwoStepsDown:
	step DOWN
	step DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightAndDown:
	slow_step RIGHT
	slow_step DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_2:
	slow_step RIGHT
	turn_head DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3:
	slow_step UP
	slow_step LEFT
	turn_head RIGHT
	step_end

Pokecenter2FMovementData_ReceptionistStepsLeftLooksRight:
	slow_step LEFT
	turn_head RIGHT
	step_end

Text_BattleReceptionistIntro:
	text "Willkommen im"
	line "KABEL-CLUB-"
	cont "KOLOSSEUM."

	para "Du kannst hier"
	line "gegen einen Freund"
	cont "antreten."

	para "Möchtest du gerne"
	line "kämpfen?"
	done

Text_TradeReceptionistIntro:
	text "Willkommen im"
	line "KABEL-CLUB-"
	cont "HANDELSCENTER."

	para "Du kannst hier"
	line "#MON mit einem"
	cont "Freund tauschen."

	para "Möchtest du gerne"
	line "tauschen?"
	done

Text_TimeCapsuleReceptionistIntro:
	text "Willkommen in"
	line "der ZEITKAPSEL."

	para "Du kannst in die"
	line "Vergangenheit"
	cont "reisen und deine"
	cont "#MON tauschen."

	para "Möchtest du gerne"
	line "durch die Zeit"
	cont "tauschen?"
	done

YourFriendIsNotReadyText:
	text "Dein Freund ist"
	line "noch nicht fertig."
	prompt

Text_MustSaveGame:
	text "Bevor du die"
	line "Verbindung her-"
	cont "stellst, musst du"
	cont "deinen Spielstand"
	cont "speichern."
	done

Text_PleaseWait:
	text "Bitte warten!"
	done

Text_LinkTimedOut:
	text "Die Verbindung"
	line "wurde aufgrund"
	cont "fehlender Aktionen"
	cont "abgebrochen."

	para "Nimm bitte Kontakt"
	line "mit deinem Freund"
	cont "auf und komm dann"
	cont "wieder."
	prompt

Text_PleaseComeAgain:
	text "Komm später"
	line "wieder!"
	prompt

Text_PleaseComeInDuplicate: ; unreferenced
	text "Komm bitte herein."
	prompt

Text_TemporaryStagingInLinkRoom: ; unreferenced
	text "Wir bringen dich"
	line "währenddessen in"
	cont "den Link-Raum."
	done

Text_CantLinkToThePast:
	text "Du kannst hier"
	line "keine Verbindung"
	cont "zur Vergangenheit"
	cont "herstellen."
	prompt

Text_IncompatibleRooms:
	text "Dein Freund hat"
	line "einen anderen Raum"
	cont "gewählt."
	prompt

Text_PleaseComeIn:
	text "Komm doch herein."
	done

Text_PleaseEnter: ; unreferenced
	text "Komm herein."
	prompt

Text_RejectNewMon:
	text "Leider kannst du"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "nicht mitnehmen."
	prompt

Text_RejectMonWithNewMove:
	text_ram wStringBuffer1
	text_start
	line "kann @"
	text_ram wStringBuffer2
	text_start
	cont "nicht anwenden."
	prompt

Text_RejectMonWithMail:
	text "Du kannst"
	line "@"
	text_ram wStringBuffer1
	text " nicht"
	cont "anwählen, weil es"
	cont "einen BRIEF trägt."
	prompt

Text_TimeCapsuleClosed:
	text "Leider wird die"
	line "ZEITKAPSEL gerade"
	cont "repariert."
	done

Text_TradeRoomClosed:
	text "Leider wird der"
	line "TAUSCHAUTOMAT"
	cont "gerade repariert."
	done

Text_BattleRoomClosed:
	text "Leider wird der"
	line "KAMPFAUTOMAT"
	cont "gerade repariert."
	done

Text_MysteryGiftDeliveryGuy_Intro:
	text "Hallo! Du bist"
	line "doch <PLAYER>."

	para "Ich habe hier"
	line "Etwas für dich."
	done

Text_MysteryGiftDeliveryGuy_HereYouGo:
	text "Hier, bitte sehr!"
	done

Text_MysteryGiftDeliveryGuy_Outro:
	text "Hoffentlich können"
	line "wir dir bald wie-"
	cont "der behilflich"
	cont "sein."
	done

Text_MysteryGiftDeliveryGuy_NoRoom:
	text "Oh, du hast keinen"
	line "Platz dafür."

	para "Du kannst es dir"
	line "in jedem PKMN-"

	para "CENTER des"
	line "Landes abholen."
	done

Text_MysteryGiftDeliveryGuy_SaidNo:
	text "Nein? Das ist aber"
	line "merkwürdig…"
	done

Pokecenter2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  7, POKECENTER_2F, -1
	warp_event  5,  0, TRADE_CENTER, 1
	warp_event  9,  0, COLOSSEUM, 1
	warp_event 13,  2, TIME_CAPSULE, 1

	def_coord_events

	def_bg_events
	bg_event  7,  3, BGEVENT_READ, Pokecenter2FLinkRecordSign

	def_object_events
	object_event  5,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_Trade, -1
	object_event  9,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_Battle, -1
	object_event 13,  3, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_TimeCapsule, -1
	object_event  1,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Pokecenter2FOfficerScript, EVENT_MYSTERY_GIFT_DELIVERY_GUY
