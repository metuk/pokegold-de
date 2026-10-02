	object_const_def
	const ELMSLAB_ELM
	const ELMSLAB_ELMS_AIDE
	const ELMSLAB_POKE_BALL1
	const ELMSLAB_POKE_BALL2
	const ELMSLAB_POKE_BALL3
	const ELMSLAB_OFFICER

ElmsLab_MapScripts:
	def_scene_scripts
	scene_script ElmsLabMeetElmScene, SCENE_ELMSLAB_MEET_ELM
	scene_script ElmsLabNoop1Scene,   SCENE_ELMSLAB_CANT_LEAVE
	scene_script ElmsLabNoop2Scene,   SCENE_ELMSLAB_NOOP
	scene_script ElmsLabNoop3Scene,   SCENE_ELMSLAB_MEET_OFFICER
	scene_script ElmsLabNoop4Scene,   SCENE_ELMSLAB_UNUSED
	scene_script ElmsLabNoop5Scene,   SCENE_ELMSLAB_AIDE_GIVES_POTION
	scene_const SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS

	def_callbacks

ElmsLabMeetElmScene:
	sdefer ElmsLabWalkUpToElmScript
	end

ElmsLabNoop1Scene:
	end

ElmsLabNoop2Scene:
	end

ElmsLabNoop3Scene:
	end

ElmsLabNoop4Scene:
	end

ElmsLabNoop5Scene:
	end

ElmsLabWalkUpToElmScript:
	applymovement PLAYER, ElmsLab_WalkUpToElmMovement
	turnobject ELMSLAB_ELM, LEFT
	opentext
	writetext ElmText_Intro
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_CANT_LEAVE
	end

ProfElmScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue ElmCheckMasterBall
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue ElmGiveTicketScript
ElmCheckMasterBall:
	checkevent EVENT_GOT_MASTER_BALL_FROM_ELM
	iftrue ElmCheckEverstone
	checkflag ENGINE_RISINGBADGE
	iftrue ElmGiveMasterBallScript
ElmCheckEverstone:
	checkevent EVENT_GOT_EVERSTONE_FROM_ELM
	iftrue ElmScript_CallYou
	checkevent EVENT_SHOWED_TOGEPI_TO_ELM
	iftrue ElmGiveEverstoneScript
	checkevent EVENT_TOLD_ELM_ABOUT_TOGEPI_OVER_THE_PHONE
	iffalse ElmCheckTogepiEgg
	setval TOGEPI
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	setval TOGETIC
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	writetext ElmThoughtEggHatchedText
	waitbutton
	closetext
	end

ElmEggHatchedScript:
	setval TOGEPI
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	setval TOGETIC
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	sjump ElmCheckGotEggAgain

ElmCheckTogepiEgg:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iffalse ElmCheckGotEggAgain
	checkevent EVENT_TOGEPI_HATCHED
	iftrue ElmEggHatchedScript
ElmCheckGotEggAgain:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE ; why are we checking it again?
	iftrue ElmWaitingEggHatchScript
	checkflag ENGINE_ZEPHYRBADGE
	iftrue ElmAideHasEggScript
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue ElmStudyingEggScript
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue ElmAfterTheftScript
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue ElmDescribesMrPokemonScript
	writetext ElmText_LetYourMonBattleIt
	waitbutton
	closetext
	end

LabTryToLeaveScript:
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext LabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, ElmsLab_CantLeaveMovement
	end

CyndaquilPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	reanchormap
	pokepic CYNDAQUIL
	cry CYNDAQUIL
	waitbutton
	closepokepic
	opentext
	writetext TakeCyndaquilText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, CYNDAQUIL
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke CYNDAQUIL, 5, BERRY
	closetext
	readvar VAR_FACING
	ifequal RIGHT, ElmDirectionsScript
	applymovement PLAYER, AfterCyndaquilMovement
	sjump ElmDirectionsScript

TotodilePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	reanchormap
	pokepic TOTODILE
	cry TOTODILE
	waitbutton
	closepokepic
	opentext
	writetext TakeTotodileText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, TOTODILE
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke TOTODILE, 5, BERRY
	closetext
	applymovement PLAYER, AfterTotodileMovement
	sjump ElmDirectionsScript

ChikoritaPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	reanchormap
	pokepic CHIKORITA
	cry CHIKORITA
	waitbutton
	closepokepic
	opentext
	writetext TakeChikoritaText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, CHIKORITA
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke CHIKORITA, 5, BERRY
	closetext
	applymovement PLAYER, AfterChikoritaMovement
	sjump ElmDirectionsScript

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	closetext
	end

ElmDirectionsScript:
	turnobject PLAYER, UP
	opentext
	writetext ElmDirectionsText1
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, LEFT
	opentext
	writetext ElmDirectionsText2
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext ElmDirectionsText3
	promptbutton
	waitsfx
	addcellnum PHONE_ELM
	writetext GotElmsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_ELM
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setscene SCENE_ELMSLAB_AIDE_GIVES_POTION
	setmapscene NEW_BARK_TOWN, SCENE_NEWBARKTOWN_NOOP
	end

ElmDescribesMrPokemonScript:
	writetext ElmDescribesMrPokemonText
	waitbutton
	closetext
	end

LookAtElmPokeBallScript:
	opentext
	writetext ElmPokeBallText
	waitbutton
	closetext
	end

ElmsLabHealingMachine:
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .CanHeal
	writetext ElmsLabHealingMachineText1
	waitbutton
	closetext
	end

.CanHeal:
	writetext ElmsLabHealingMachineText2
	yesorno
	iftrue ElmsLabHealingMachine_HealParty
	closetext
	end

ElmsLabHealingMachine_HealParty:
	special HealParty
	playmusic MUSIC_NONE
	setval HEALMACHINE_ELMS_LAB
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	closetext
	end

ElmAfterTheftDoneScript:
	waitbutton
	closetext
	end

ElmAfterTheftScript:
	writetext ElmAfterTheftText1
	checkitem MYSTERY_EGG
	iffalse ElmAfterTheftDoneScript
	promptbutton
	writetext ElmAfterTheftText2
	waitbutton
	takeitem MYSTERY_EGG
	scall ElmJumpBackScript1
	writetext ElmAfterTheftText3
	waitbutton
	scall ElmJumpBackScript2
	writetext ElmAfterTheftText4
	promptbutton
	writetext ElmAfterTheftText5
	promptbutton
	setevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	setmapscene ROUTE_29, SCENE_ROUTE29_CATCH_TUTORIAL
	clearevent EVENT_ROUTE_30_YOUNGSTER_JOEY
	setevent EVENT_ROUTE_30_BATTLE
	writetext ElmAfterTheftText6
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS
	end

ElmStudyingEggScript:
	writetext ElmStudyingEggText
	waitbutton
	closetext
	end

ElmAideHasEggScript:
	writetext ElmAideHasEggText
	waitbutton
	closetext
	end

ElmWaitingEggHatchScript:
	writetext ElmWaitingEggHatchText
	waitbutton
	closetext
	end

ShowElmTogepiScript:
	writetext ShowElmTogepiText1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	setevent EVENT_SHOWED_TOGEPI_TO_ELM
	opentext
	writetext ShowElmTogepiText2
	promptbutton
	writetext ShowElmTogepiText3
	promptbutton
ElmGiveEverstoneScript:
	writetext ElmGiveEverstoneText1
	promptbutton
	verbosegiveitem EVERSTONE
	iffalse ElmScript_NoRoomForEverstone
	writetext ElmGiveEverstoneText2
	waitbutton
	closetext
	setevent EVENT_GOT_EVERSTONE_FROM_ELM
	end

ElmScript_CallYou:
	writetext ElmText_CallYou
	waitbutton
ElmScript_NoRoomForEverstone:
	closetext
	end

ElmGiveMasterBallScript:
	writetext ElmGiveMasterBallText1
	promptbutton
	verbosegiveitem MASTER_BALL
	iffalse .notdone
	setevent EVENT_GOT_MASTER_BALL_FROM_ELM
	writetext ElmGiveMasterBallText2
	waitbutton
.notdone
	closetext
	end

ElmGiveTicketScript:
	writetext ElmGiveTicketText1
	promptbutton
	verbosegiveitem S_S_TICKET
	setevent EVENT_GOT_SS_TICKET_FROM_ELM
	writetext ElmGiveTicketText2
	waitbutton
	closetext
	end

ElmJumpBackScript1:
	closetext
	readvar VAR_FACING
	ifequal DOWN, ElmJumpDownScript
	ifequal UP, ElmJumpUpScript
	ifequal LEFT, ElmJumpLeftScript
	ifequal RIGHT, ElmJumpRightScript
	end

ElmJumpBackScript2:
	closetext
	readvar VAR_FACING
	ifequal DOWN, ElmJumpUpScript
	ifequal UP, ElmJumpDownScript
	ifequal LEFT, ElmJumpRightScript
	ifequal RIGHT, ElmJumpLeftScript
	end

ElmJumpUpScript:
	applymovement ELMSLAB_ELM, ElmJumpUpMovement
	opentext
	end

ElmJumpDownScript:
	applymovement ELMSLAB_ELM, ElmJumpDownMovement
	opentext
	end

ElmJumpLeftScript:
	applymovement ELMSLAB_ELM, ElmJumpLeftMovement
	opentext
	end

ElmJumpRightScript:
	applymovement ELMSLAB_ELM, ElmJumpRightMovement
	opentext
	end

AideScript_WalkPotion1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkPotion2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GivePotion:
	opentext
	writetext AideText_GiveYouPotion
	promptbutton
	verbosegiveitem POTION
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_NOOP
	end

AideScript_WalkBalls1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkBalls2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GiveYouBalls:
	opentext
	writetext AideText_GiveYouBalls
	promptbutton
	getitemname STRING_BUFFER_4, POKE_BALL
	scall AideScript_ReceiveTheBalls
	giveitem POKE_BALL, 5
	writetext AideText_ExplainBalls
	promptbutton
	itemnotify
	closetext
	setscene SCENE_ELMSLAB_NOOP
	end

AideScript_ReceiveTheBalls:
	jumpstd ReceiveItemScript
	end

ElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue AideScript_AfterTheft
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue AideScript_ExplainBalls
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue AideScript_TheftTestimony
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	end

AideScript_TheftTestimony:
	writetext AideText_TheftTestimony
	waitbutton
	closetext
	end

AideScript_ExplainBalls:
	writetext AideText_ExplainBalls
	waitbutton
	closetext
	end

AideScript_AfterTheft:
	writetext AideText_AfterTheft
	waitbutton
	closetext
	end

MeetCopScript2:
	applymovement PLAYER, MeetCopScript2_StepLeft

MeetCopScript:
	applymovement PLAYER, MeetCopScript_WalkUp
CopScript:
	turnobject ELMSLAB_OFFICER, LEFT
	opentext
	writetext ElmsLabOfficerText1
	promptbutton
	special NameRival
	writetext ElmsLabOfficerText2
	waitbutton
	closetext
	applymovement ELMSLAB_OFFICER, OfficerLeavesMovement
	disappear ELMSLAB_OFFICER
	setscene SCENE_ELMSLAB_NOOP
	end

ElmsLabWindow:
	opentext
	checkflag ENGINE_FLYPOINT_VIOLET
	iftrue .Normal
	checkevent EVENT_ELM_CALLED_ABOUT_STOLEN_POKEMON
	iftrue .BreakIn
	sjump .Normal

.BreakIn:
	writetext ElmsLabWindowText2
	waitbutton
	closetext
	end

.Normal:
	writetext ElmsLabWindowText1
	waitbutton
	closetext
	end

ElmsLabTravelTip1:
	jumptext ElmsLabTravelTip1Text

ElmsLabTravelTip2:
	jumptext ElmsLabTravelTip2Text

ElmsLabTravelTip3:
	jumptext ElmsLabTravelTip3Text

ElmsLabTravelTip4:
	jumptext ElmsLabTravelTip4Text

ElmsLabTrashcan:
	jumptext ElmsLabTrashcanText

ElmsLabTrashcan2: ; unreferenced
	jumpstd TrashCanScript

ElmsLabBookshelf:
	jumpstd DifficultBookshelfScript

ElmsLab_WalkUpToElmMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

ElmsLab_CantLeaveMovement:
	step UP
	step_end

MeetCopScript2_StepLeft:
	step LEFT
	step_end

MeetCopScript_WalkUp:
	step UP
	step UP
	turn_head RIGHT
	step_end

OfficerLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

AideWalksRight1:
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksRight2:
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksLeft1:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

AideWalksLeft2:
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

ElmJumpUpMovement:
	fix_facing
	big_step UP
	remove_fixed_facing
	step_end

ElmJumpDownMovement:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

ElmJumpLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

ElmJumpRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

AfterCyndaquilMovement:
	step LEFT
	step UP
	step_end

AfterTotodileMovement:
	step LEFT
	step LEFT
	step UP
	step_end

AfterChikoritaMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	step_end

ElmText_Intro:
	text "LIND: <PLAYER>!"
	line "Da bist du ja!"

	para "Ich muss dich um"
	line "etwas bitten."

	para "Ich habe einen Be-"
	line "kannten namens MR."
	cont "#MON."

	para "Ständig findet er"
	line "eigenartiges Zeugs"

	para "und fängt an, da-"
	line "rüber zu fanta-"
	cont "sieren."

	para "Aber jetzt hat er"
	line "mir eine E-Mail"

	para "geschickt, in der"
	line "steht, dass es"

	para "sich diesmal um"
	line "etwas Großes"

	para "handeln muss."

	para "Das klingt zwar"
	line "faszinierend, aber"

	para "wir sind derzeit"
	line "mitten in unseren"

	para "eigenen #MON-"
	line "Forschungen."

	para "Könntest du der"
	line "Sache nachgehen?"

	para "Ich gebe dir auch"
	line "ein #MON als"
	cont "Partner."

	para "Es ist ein sehr"
	line "seltenes #MON,"
	cont "das wir gerade"
	cont "erst entdeckt"
	cont "haben."

	para "Wähle eines aus!"
	done

ElmText_LetYourMonBattleIt:
	text "Erscheint ein"
	line "wildes #MON,"
	cont "lass deine #MON"
	cont "dagegen kämpfen."
	done

LabWhereGoingText:
	text "LIND: Warte! Wohin"
	line "gehst du?"
	done

TakeCyndaquilText:
	text "LIND: Willst du"
	line "FEURIGEL, das"
	cont "Feuer-#MON?"
	done

TakeTotodileText:
	text "LIND: Wählst du"
	line "KARNIMANI, das"
	cont "Wasser-#MON?"
	done

TakeChikoritaText:
	text "LIND: Entscheidest"
	line "du dich für"

	para "ENDIVIE, das"
	line "Pflanzen-#MON?"
	done

DidntChooseStarterText:
	text "LIND: Überlege es"
	line "dir gut!"

	para "Die Wahl deines"
	line "Partners ist sehr"
	cont "wichtig."
	done

ChoseStarterText:
	text "LIND: Ich bin auch"
	line "der Meinung, dass"
	cont "dieses #MON"
	cont "sehr gut ist!"
	done

ReceivedStarterText:
	text "<PLAYER> erhält"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

ElmDirectionsText1:
	text "MR. #MON wohnt"
	line "in der Nähe von"
	cont "ROSALIA CITY, der"
	cont "nächsten Stadt."

	para "Du gelangst fast"
	line "ohne Umwege dort-"
	cont "hin."
	done

ElmDirectionsText2:
	text "Ist dein #MON"
	line "verletzt, solltest"

	para "du es mit Hilfe"
	line "dieser Maschine"
	cont "heilen."
	done

ElmDirectionsText3:
	text "Ich gebe dir auch"
	line "meine Telefon-"
	cont "nummer."

	para "Du kannst mich je-"
	line "derzeit anrufen."
	done

GotElmsNumberText:
	text "<PLAYER> erhält"
	line "LINDs Nummer."
	done

ElmDescribesMrPokemonText:
	text "MR. #MON zieht"
	line "durch das Land und"

	para "sucht nach Rari-"
	line "täten."

	para "Zu schade, dass er"
	line "nur unbrauchbares"
	cont "Zeug findet…"

	para "<PLAYER>, ich"
	line "zähle auf dich!"
	done

ElmPokeBallText:
	text "Es beinhaltet ein"
	line "von PROF. LIND ge-"
	cont "fangenes #MON."
	done

ElmsLabHealingMachineText1:
	text "Ich frage mich,"
	line "wozu das gut ist!"
	done

ElmsLabHealingMachineText2:
	text "#MON heilen?"
	done

ElmAfterTheftText1:
	text "LIND: <PLAYER>, das"
	line "ist schrecklich…"

	para "Oh, um was handelt"
	line "es sich bei MR."

	para "#MONs großer"
	line "Entdeckung?"
	done

ElmAfterTheftText2:
	text "<PLAYER> übergibt"
	line "PROF. LIND das"
	cont "RÄTSEL-EI."
	done

ElmAfterTheftText3:
	text "LIND: Das hier?"
	done

ElmAfterTheftText4:
	text "Aber… ist das auch"
	line "ein #MON-EI?"

	para "Falls ja, dann ist"
	line "es in der Tat eine"
	cont "große Entdeckung!"
	done

ElmAfterTheftText5:
	text "LIND: Wie?!?"

	para "PROF. EICH hat dir"
	line "einen #DEX"
	cont "gegeben?"

	para "<PLAYER>, ist das"
	line "wahr? D-Das ist ja"
	cont "unglaublich!"

	para "Kein anderer ist"
	line "wie er in der"
	cont "Lage, das wahre"
	cont "Potenzial eines"
	cont "Trainers zu er-"
	cont "kennen."

	para "Wow, <PLAYER>. Es"
	line "ist vielleicht"

	para "deine Bestimmung,"
	line "der CHAMP zu"
	cont "werden."

	para "Es sieht auch so"
	line "aus, als könntest"

	para "du hervorragend"
	line "mit #MON um-"
	cont "gehen."

	para "Du solltest die"
	line "Herausforderung"

	para "der #MON ARENEN"
	line "annehmen."

	para "Die nächste ARENA"
	line "befindet sich in"
	cont "VIOLA CITY."
	done

ElmAfterTheftText6:
	text "…<PLAYER>. Der"
	line "Weg zum Ruhm ist"

	para "lang und beschwer-"
	line "lich."

	para "Bevor du los-"
	line "ziehst, solltest"
	cont "du mit deiner Mama"
	cont "sprechen."
	done

ElmStudyingEggText:
	text "LIND: Gib nicht"
	line "auf! Ich rufe dich"

	para "an, wenn ich etwas"
	line "über dieses EI he-"
	cont "rausgefunden habe."
	done

ElmAideHasEggText:
	text "LIND: <PLAYER>?"
	line "Hast du schon mei-"
	cont "nen Assistenten"
	cont "getroffen?"

	para "Er sollte mit dem"
	line "EI im #MON-"

	para "CENTER von VIOLA"
	line "CITY warten."

	para "Du musst ihn ver-"
	line "passt haben. Ver-"
	cont "suche, ihn dort zu"
	cont "finden."
	done

ElmWaitingEggHatchText:
	text "LIND: He, hat sich"
	line "das EI irgendwie"
	cont "verändert?"
	done

ElmThoughtEggHatchedText:
	text "<PLAYER>? Ich"
	line "dachte, etwas wäre"
	cont "aus dem EI ge-"
	cont "schlüpft."

	para "Wo ist das"
	line "#MON?"
	done

ShowElmTogepiText1:
	text "LIND: <PLAYER>, du"
	line "siehst großartig"
	cont "aus!"
	done

ShowElmTogepiText2:
	text "Was?"
	line "Dieses #MON!?!"
	done

ShowElmTogepiText3:
	text "Es ist aus dem EI"
	line "geschlüpft! Also"
	cont "schlüpfen alle"
	cont "#MON aus EIERN…"

	para "Nein, vermutlich"
	line "trifft das nicht"
	cont "auf alle #MON"
	cont "zu."

	para "Es wartet wohl"
	line "noch jede Menge"
	cont "Forschungsarbeit"
	cont "auf uns."
	done

ElmGiveEverstoneText1:
	text "Danke, <PLAYER>!"
	line "Du hilfst uns beim"

	para "Aufklären vieler"
	line "#MON-Mysterien!"

	para "Bitte nimm dies"
	line "als Zeichen unser-"
	cont "er Wertschätzung."
	done

ElmGiveEverstoneText2:
	text "Das ist ein"
	line "EWIGSTEIN."

	para "Einige #MON"
	line "entwickeln sich"

	para "weiter, wenn sie"
	line "einen bestimmten"
	cont "Level erreichen."

	para "Ein #MON,"
	line "das den EWIGSTEIN"
	cont "trägt, wird sich"
	cont "aber nicht ent-"
	cont "wickeln."

	para "Gib ihn einem"
	line "#MON, das"
	cont "sich nicht weiter-"
	cont "entwickeln soll!"
	done

ElmText_CallYou:
	text "LIND: <PLAYER>, ich"
	line "rufe dich an, wenn"
	cont "sich etwas tut."
	done

AideText_AfterTheft:
	text "…Seufz… Das"
	line "gestohlene #-"
	cont "MON."

	para "Ich frage mich,"
	line "wie es ihm geht."

	para "Man sagt, dass ein"
	line "#MON, das von"

	para "einem bösen Men-"
	line "schen aufgezogen"
	cont "wird, selber böse"

	para "wird."
	done

ElmGiveMasterBallText1:
	text "LIND: Hi, <PLAYER>!"
	line "Dank dir komme ich"

	para "mit meinen For-"
	line "schungen hervor-"
	cont "ragend voran!"

	para "Nimm dies als"
	line "Zeichen meiner"
	cont "Dankbarkeit!"
	done

ElmGiveMasterBallText2:
	text "Der MEISTERBALL"
	line "ist der Beste von "
	cont "allen!"

	para "Er ist der ultima-"
	line "tive BALL! Ihm"

	para "kann kein #MON"
	line "entwischen."

	para "Er wird nur aner-"
	line "kannten #MON-"
	cont "Forschern über-"
	cont "reicht."

	para "Aber ich glaube,"
	line "du hast bessere"

	para "Verwendung dafür"
	line "als ich, <PLAYER>!"
	done

ElmGiveTicketText1:
	text "LIND: <PLAYER>!"
	line "Da bist du ja!"

	para "Ich habe dich ge-"
	line "rufen, weil ich"
	cont "dir etwas geben"
	cont "möchte."

	para "Es handelt sich um"
	line "ein BOOTSTICKET."

	para "Jetzt kannst du"
	line "auch in KANTO"
	cont "#MON fangen."
	done

ElmGiveTicketText2:
	text "Das Schiff legt in"
	line "OLIVIANA CITY ab."

	para "Aber das weißt du"
	line "ja schon, <PLAYER>."

	para "Schließlich bist"
	line "du mit deinen"
	cont "#MON schon"
	cont "viel herumge-"
	cont "kommen."

	para "Überbringe PROF."
	line "EICH in KANTO"
	cont "meine Grüße!"
	done

ElmsLabMonEggText: ; unreferenced
	text "Dies ist das"
	line "#MON-EI, das"
	cont "von PROF. LIND"
	cont "untersucht wird."
	done

AideText_GiveYouPotion:
	text "<PLAYER>, ich"
	line "will, dass du das"
	cont "mitnimmst."
	done

AideText_AlwaysBusy:
	text "Wir sind nur zu"
	line "zweit und wir ha-"
	cont "ben viel zu tun."
	done

AideText_TheftTestimony:
	text "Wir haben ein lau-"
	line "tes Geräusch ge-"
	cont "hört…"

	para "Als wir nach dem"
	line "Rechten sahen,"
	cont "wurde ein #MON"
	cont "gestohlen."

	para "Ich kann nicht"
	line "glauben, dass je-"
	cont "mand so etwas tun"
	cont "würde!"

	para "…Seufz… Das"
	line "gestohlene"
	cont "#MON."

	para "Ich frage mich,"
	line "wie es ihm geht."

	para "Man sagt, dass ein"
	line "#MON, das"

	para "von einem bösen"
	line "Menschen aufgezo-"
	cont "gen wird, selber"

	para "böse wird."
	done

AideText_GiveYouBalls:
	text "<PLAYER>!"

	para "Benutze diese"
	line "auf deiner"
	cont "#DEX-Reise!"
	done

AideText_ExplainBalls:
	text "Um deinen #DEX"
	line "zu vervollständi-"
	cont "gen, musst du"
	cont "#MON fangen."

	para "Wirf #BÄLLE"
	line "nach wilden #-"
	cont "MON, um sie zu"
	cont "fangen."
	done

ElmsLabOfficerText1:
	text "Ich hörte, dass"
	line "hier ein #MON"
	cont "gestohlen worden"
	cont "sei…"

	para "Ich habe von PROF."
	line "LIND einige Infor-"
	cont "mationen erhalten."

	para "Bei dem Dieb han-"
	line "delt es sich um"
	cont "einen jungen Mann"
	cont "mit langen roten"
	cont "Haaren…"

	para "Wie?"

	para "Du hast gegen ei-"
	line "nen solchen"
	cont "Trainer gekämpft?"

	para "Hat er dir auch"
	line "seinen Namen ge-"
	cont "nannt?"
	done

ElmsLabOfficerText2:
	text "O.K.! Sein Name"
	line "war also <RIVAL>."

	para "Danke, dass du mir"
	line "bei den Ermitt-"
	cont "lungen geholfen"
	cont "hast!"
	done

ElmsLabWindowText1:
	text "Das Fenster ist"
	line "offen."

	para "Eine sanfte Brise"
	line "weht herein."
	done

ElmsLabWindowText2:
	text "Hier ist er he-"
	line "reingekommen!"
	done

ElmsLabTravelTip1Text:
	text "<PLAYER> öffnet"
	line "ein Buch."

	para "Reise-Tipp 1:"

	para "Drücke START, um"
	line "das MENÜ zu"
	cont "öffnen."
	done

ElmsLabTravelTip2Text:
	text "<PLAYER> öffnet"
	line "ein Buch."

	para "Reise-Tipp 2:"

	para "Speichere deine"
	line "Fortschritte mit"
	cont "SICHERN!"
	done

ElmsLabTravelTip3Text:
	text "<PLAYER> öffnet"
	line "ein Buch."

	para "Reise-Tipp 3:"

	para "Öffne deinen"
	line "BEUTEL und drücke"
	cont "SELECT, um deine"
	cont "Items zu ver-"
	cont "walten."
	done

ElmsLabTravelTip4Text:
	text "<PLAYER> öffnet"
	line "ein Buch."

	para "Reise-Tipp 4:"

	para "Verwalte die At-"
	line "tacken deiner"

	para "#MON. Drücke"
	line "den A-Knopf, um"

	para "ihre Position zu"
	line "verändern."
	done

ElmsLabTrashcanText:
	text "Die Verpackung"
	line "des Snack, den"
	cont "PROF. LIND geges-"
	cont "sen hat, befindet"
	cont "sich hier…"
	done

ElmsLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, NEW_BARK_TOWN, 1
	warp_event  5, 11, NEW_BARK_TOWN, 1

	def_coord_events
	coord_event  4,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  5,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  4,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript
	coord_event  5,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript2
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotion1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotion2
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS, AideScript_WalkBalls1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS, AideScript_WalkBalls2

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, ElmsLabHealingMachine
	bg_event  6,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  0,  7, BGEVENT_READ, ElmsLabTravelTip1
	bg_event  1,  7, BGEVENT_READ, ElmsLabTravelTip2
	bg_event  2,  7, BGEVENT_READ, ElmsLabTravelTip3
	bg_event  3,  7, BGEVENT_READ, ElmsLabTravelTip4
	bg_event  6,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  3, BGEVENT_READ, ElmsLabTrashcan
	bg_event  5,  0, BGEVENT_READ, ElmsLabWindow

	def_object_events
	object_event  5,  2, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfElmScript, -1
	object_event  2,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ElmsAideScript, EVENT_ELMS_AIDE_IN_LAB
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  5,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CopScript, EVENT_COP_IN_ELMS_LAB
