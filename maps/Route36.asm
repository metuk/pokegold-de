	object_const_def
	const ROUTE36_YOUNGSTER1
	const ROUTE36_YOUNGSTER2
	const ROUTE36_WEIRD_TREE
	const ROUTE36_LASS1
	const ROUTE36_FISHER
	const ROUTE36_FRUIT_TREE
	const ROUTE36_ARTHUR

Route36_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route36ArthurCallback

Route36ArthurCallback:
	readvar VAR_WEEKDAY
	ifequal THURSDAY, .ArthurAppears
	disappear ROUTE36_ARTHUR
	endcallback

.ArthurAppears:
	appear ROUTE36_ARTHUR
	endcallback

SudowoodoScript:
	checkitem SQUIRTBOTTLE
	iftrue .Fight

	waitsfx
	playsound SFX_SANDSTORM
	applymovement ROUTE36_WEIRD_TREE, SudowoodoShakeMovement
	end

.Fight:
	opentext
	writetext UseSquirtbottleText
	yesorno
	iffalse DidntUseSquirtbottleScript
	closetext
WateredWeirdTreeScript:: ; export (for when you use Squirtbottle from pack)
	opentext
	writetext UsedSquirtbottleText
	waitbutton
	closetext
	waitsfx
	playsound SFX_SANDSTORM
	applymovement ROUTE36_WEIRD_TREE, SudowoodoShakeMovement
	opentext
	writetext SudowoodoAttackedText
	waitbutton
	closetext
	loadwildmon SUDOWOODO, 20
	startbattle
	setevent EVENT_FOUGHT_SUDOWOODO
	ifequal DRAW, DidntCatchSudowoodo
	disappear ROUTE36_WEIRD_TREE
	variablesprite SPRITE_WEIRD_TREE, SPRITE_TWIN
	reloadmapafterbattle
	end

DidntUseSquirtbottleScript:
	closetext
	end

DidntCatchSudowoodo:
	reloadmapafterbattle
	applymovement ROUTE36_WEIRD_TREE, WeirdTreeMovement_Flee
	disappear ROUTE36_WEIRD_TREE
	variablesprite SPRITE_WEIRD_TREE, SPRITE_TWIN
	special LoadUsedSpritesGFX
	end

Route36RockSmashGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM08_ROCK_SMASH
	iftrue .AlreadyGotRockSmash
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .ClearedSudowoodo
	writetext RockSmashGuyText1
	waitbutton
	closetext
	end

.ClearedSudowoodo:
	writetext RockSmashGuyText2
	promptbutton
	verbosegiveitem TM_ROCK_SMASH
	iffalse .NoRoomForTM
	setevent EVENT_GOT_TM08_ROCK_SMASH
.AlreadyGotRockSmash:
	writetext RockSmashGuyText3
	waitbutton
.NoRoomForTM:
	closetext
	end

Route36LassScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .ClearedSudowoodo
	writetext Route36LassText
	waitbutton
	closetext
	end

.ClearedSudowoodo:
	writetext Route36LassText_ClearedSudowoodo
	waitbutton
	closetext
	end

TrainerSchoolboyAlan1:
	trainer SCHOOLBOY, ALAN1, EVENT_BEAT_SCHOOLBOY_ALAN, SchoolboyAlan1SeenText, SchoolboyAlan1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_ALAN_READY_FOR_REMATCH
	iftrue .ChooseRematch
	checkcellnum PHONE_SCHOOLBOY_ALAN
	iftrue .NumberAccepted
	checkevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgainForPhoneNumber
	writetext SchoolboyAlanBooksText
	promptbutton
	setevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .ContinueAskForPhoneNumber

.AskAgainForPhoneNumber:
	scall .AskNumber2
.ContinueAskForPhoneNumber:
	askforphonenumber PHONE_SCHOOLBOY_ALAN
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, SCHOOLBOY, ALAN1
	scall .RegisteredNumber
	sjump .NumberAccepted

.ChooseRematch:
	scall .Rematch
	winlosstext SchoolboyAlan1BeatenText, 0
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue .LoadFight1
	loadtrainer SCHOOLBOY, ALAN1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_ALAN_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, ALAN2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_ALAN_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, ALAN3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_ALAN_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.Rematch:
	jumpstd RematchMScript
	end

TrainerPsychicMark:
	trainer PSYCHIC_T, MARK, EVENT_BEAT_PSYCHIC_MARK, PsychicMarkSeenText, PsychicMarkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicMarkAfterBattleText
	waitbutton
	closetext
	end

ArthurScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	iftrue .AlreadyGotStone
	readvar VAR_WEEKDAY
	ifnotequal THURSDAY, ArthurNotThursdayScript
	checkevent EVENT_MET_ARTHUR_OF_THURSDAY
	iftrue .MetArthur
	writetext MeetArthurText
	promptbutton
	setevent EVENT_MET_ARTHUR_OF_THURSDAY
.MetArthur:
	writetext ArthurGivesGiftText
	promptbutton
	verbosegiveitem HARD_STONE
	iffalse .BagFull
	setevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	writetext ArthurGaveGiftText
	waitbutton
	closetext
	end

.AlreadyGotStone:
	writetext ArthurThursdayText
	waitbutton
.BagFull:
	closetext
	end

ArthurNotThursdayScript:
	writetext ArthurNotThursdayText
	waitbutton
	closetext
	end

Route36Sign:
	jumptext Route36SignText

RuinsOfAlphNorthSign:
	jumptext RuinsOfAlphNorthSignText

Route36TrainerTips1:
	jumptext Route36TrainerTips1Text

Route36TrainerTips2:
	jumptext Route36TrainerTips2Text

Route36FruitTree:
	fruittree FRUITTREE_ROUTE_36

SudowoodoShakeMovement:
	tree_shake
	step_end

WeirdTreeMovement_Flee:
	fast_jump_step UP
	fast_jump_step UP
	step_end

UseSquirtbottleText:
	text "Das ist ein merk-"
	line "würdiger Baum."
	cont "Möchtest du die"
	cont "SCHIGGYKANNE"
	cont "benutzen?"
	done

UsedSquirtbottleText:
	text "<PLAYER> benutzt"
	line "SCHIGGYKANNE."
	done

SudowoodoAttackedText:
	text "Der merkwürdige"
	line "Baum mag die"
	cont "SCHIGGYKANNE"
	cont "nicht!"

	para "Der merkwürdige"
	line "Baum greift an!"
	done

RockSmashGuyText1:
	text "Oje!"

	para "Ich wollte den"
	line "Baum mit einem"

	para "mächtigen Hieb"
	line "entzweibrechen."

	para "Aber ich habe es"
	line "nicht geschafft."
	cont "Ich habe versagt!"
	done

RockSmashGuyText2:
	text "Hast du diesen"
	line "seltsamen Baum"
	cont "weggeschafft?"

	para "Ich bin"
	line "beeindruckt! Ich"
	cont "möchte dir dies"
	cont "geben."
	done

Text_ReceivedTM08: ; unreferenced
	text "<PLAYER> erhält"
	line "TM08."
	done

RockSmashGuyText3:
	text "Das ist der"
	line "ZERTRÜMMERER."

	para "Damit kannst du"
	line "Felsen mit einem"

	para "einzigen, gut "
	line "gezielten Schlag"
	cont "zertrümmern."

	para "Sind dir irgend-"
	line "welche Steine im"
	cont "Weg, dann"
	cont "zertrümmere sie"
	cont "einfach!"
	done

Route36LassText:
	text "Ein merkwürdiger"
	line "Baum blockiert die"
	cont "Straße nach"
	cont "DUKATIA CITY."

	para "Wegen dieses"
	line "Baumes kann ich"

	para "nicht Einkaufen"
	line "gehen. Man sollte"
	cont "etwas dagegen tun."
	done

Route36LassText_ClearedSudowoodo:
	text "Dieser merkwürdige"
	line "Baum ist spurlos"
	cont "verschwunden."

	para "Ach! Der Baum war"
	line "in Wirklichkeit"
	cont "ein #MON?"
	done

PsychicMarkSeenText:
	text "Ich werde jetzt"
	line "deine Gedanken"
	cont "lesen!"
	done

PsychicMarkBeatenText:
	text "Ich habe mich wohl"
	line "bei dir verlesen!"
	done

PsychicMarkAfterBattleText:
	text "Ich wäre wirklich"
	line "stark, wenn ich "

	para "wüsste, was mein"
	line "Gegner denkt."
	done

SchoolboyAlan1SeenText:
	text "Dank meiner"
	line "Studien bin ich"
	cont "für jedes #MON"
	cont "bereit!"
	done

SchoolboyAlan1BeatenText:
	text "Ups! Ein Fehler"
	line "in der Berechnung?"
	done

SchoolboyAlanBooksText:
	text "Mist! Ich lerne"
	line "auch fünf Stunden"
	cont "am Tag."

	para "Es gibt Vieles,"
	line "das du nicht aus"
	cont "Büchern lernen"
	cont "kannst."
	done

MeetArthurText:
	text "DONATUS: Wer bist"
	line "du?"

	para "Ich bin DONATUS"
	line "von Donnerstag."
	done

ArthurGivesGiftText:
	text "Hier bitte. Das"
	line "kannst du haben."
	done

ArthurGaveGiftText:
	text "DONATUS: Ein"
	line "#MON, das"

	para "Gestein-Attacken"
	line "benutzt, sollte"
	cont "dies mit sich"
	cont "tragen."

	para "Es verstärkt"
	line "Stein-Attacken."
	done

ArthurThursdayText:
	text "DONATUS: Ich bin"
	line "DONATUS von"

	para "Donnerstag. Ich"
	line "bin das zweite von"
	cont "sieben Kindern."
	done

ArthurNotThursdayText:
	text "DONATUS: Heute ist"
	line "nicht Donnerstag."
	cont "Wie bedauerlich!"
	done

Route36SignText:
	text "ROUTE 36"
	done

RuinsOfAlphNorthSignText:
	text "ALPH-RUINEN"
	line "NORDEINGANG"
	done

Route36TrainerTips1Text:
	text "TIPPS für TRAINER"
	line "Der Status der"

	para "#MON ist unter-"
	line "schiedlich, sogar"

	para "innerhalb der"
	line "selben Spezies."

	para "Zu Beginn ist er"
	line "vielleicht noch"
	cont "ähnlich."

	para "Doch die Unter-"
	line "schiede werden "

	para "deutlicher, wenn"
	line "die #MON"
	cont "heranwachsen."
	done

Route36TrainerTips2Text:
	text "TIPPS für TRAINER"
	line "Setze den"

	para "SCHAUFLER ein, um"
	line "an den Eingang"

	para "eines Ortes"
	line "zurückzugelangen."

	para "Das ist sehr nütz-"
	line "lich beim Erkunden"

	para "von Höhlen und an-"
	line "deren Umgebungen."
	done

Route36_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 18,  8, ROUTE_36_NATIONAL_PARK_GATE, 3
	warp_event 18,  9, ROUTE_36_NATIONAL_PARK_GATE, 4
	warp_event 47, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 1
	warp_event 48, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 29,  1, BGEVENT_READ, Route36TrainerTips2
	bg_event 45, 11, BGEVENT_READ, RuinsOfAlphNorthSign
	bg_event 55,  7, BGEVENT_READ, Route36Sign
	bg_event 21,  7, BGEVENT_READ, Route36TrainerTips1

	def_object_events
	object_event 20, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicMark, -1
	object_event 31, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSchoolboyAlan1, -1
	object_event 35,  9, SPRITE_WEIRD_TREE, SPRITEMOVEDATA_SUDOWOODO, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SudowoodoScript, EVENT_ROUTE_36_SUDOWOODO
	object_event 51,  8, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36LassScript, -1
	object_event 44,  9, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36RockSmashGuyScript, -1
	object_event 21,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36FruitTree, -1
	object_event 46,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ArthurScript, EVENT_ROUTE_36_ARTHUR_OF_THURSDAY
