	object_const_def
	const ROUTE43_SUPER_NERD1
	const ROUTE43_SUPER_NERD2
	const ROUTE43_SUPER_NERD3
	const ROUTE43_FISHER
	const ROUTE43_LASS
	const ROUTE43_YOUNGSTER
	const ROUTE43_FRUIT_TREE
	const ROUTE43_POKE_BALL

Route43_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route43CheckIfRocketsScene

Route43CheckIfRocketsScene:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .NoRockets
	setmapscene ROUTE_43_GATE, SCENE_ROUTE43GATE_ROCKET_SHAKEDOWN
	endcallback

.NoRockets:
	setmapscene ROUTE_43_GATE, SCENE_ROUTE43GATE_NOOP
	endcallback

TrainerCamperSpencer:
	trainer CAMPER, SPENCER, EVENT_BEAT_CAMPER_SPENCER, CamperSpencerSeenText, CamperSpencerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperSpencerAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacBen:
	trainer POKEMANIAC, BEN, EVENT_BEAT_POKEMANIAC_BEN, PokemaniacBenSeenText, PokemaniacBenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacBenAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacBrent:
	trainer POKEMANIAC, BRENT1, EVENT_BEAT_POKEMANIAC_BRENT, PokemaniacBrentSeenText, PokemaniacBrentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_BRENT_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_POKEMANIAC_BRENT
	iftrue .NumberAccepted
	checkevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PokemaniacBrentAfterBattleText
	promptbutton
	setevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_POKEMANIAC_BRENT
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, POKEMANIAC, BRENT1
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext PokemaniacBrentBeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .LoadFight1
	loadtrainer POKEMANIAC, BRENT1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_BRENT_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer POKEMANIAC, BRENT2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_BRENT_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer POKEMANIAC, BRENT3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_BRENT_READY_FOR_REMATCH
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

TrainerPokemaniacRon:
	trainer POKEMANIAC, RON, EVENT_BEAT_POKEMANIAC_RON, PokemaniacRonSeenText, PokemaniacRonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacRonAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMarvin:
	trainer FISHER, MARVIN, EVENT_BEAT_FISHER_MARVIN, FisherMarvinSeenText, FisherMarvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMarvinAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerTiffany:
	trainer PICNICKER, TIFFANY3, EVENT_BEAT_PICNICKER_TIFFANY, PicnickerTiffanySeenText, PicnickerTiffanyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_TIFFANY_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_PICNICKER_TIFFANY
	iftrue .NumberAccepted
	checkevent EVENT_TIFFANY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PicnickerTiffanyWantsPicnicText
	promptbutton
	setevent EVENT_TIFFANY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_TIFFANY
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, PICNICKER, TIFFANY3
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext PicnickerTiffanyBeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight1
	loadtrainer PICNICKER, TIFFANY3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_TIFFANY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer PICNICKER, TIFFANY1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_TIFFANY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer PICNICKER, TIFFANY2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_TIFFANY_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1FScript
	end

.AskNumber2:
	jumpstd AskNumber2FScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberFScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedFScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedFScript
	end

.PhoneFull:
	jumpstd PhoneFullFScript
	end

.Rematch:
	jumpstd RematchFScript
	end

Route43Sign1:
	jumptext Route43Sign1Text

Route43Sign2:
	jumptext Route43Sign2Text

Route43TrainerTips:
	jumptext Route43TrainerTipsText

Route43FruitTree:
	fruittree FRUITTREE_ROUTE_43

Route43MaxEther:
	itemball MAX_ETHER

PokemaniacBenSeenText:
	text "Ich liebe #MON!"

	para "Deshalb habe ich"
	line "angefangen, #-"

	para "MON zu sammeln und"
	line "damit werde ich"
	cont "auch nicht mehr"
	cont "aufhören!"
	done

PokemaniacBenBeatenText:
	text "Wie konntest du"
	line "mir das antun?"
	done

PokemaniacBenAfterBattleText:
	text "Du fragst, was ich"
	line "außer #MON"
	cont "noch mag?"

	para "MARGIT vom Radio!"
	line "Die ist bestimmt"
	cont "süß!"
	done

PokemaniacBrentSeenText:
	text "Heh! Hast du"
	line "seltene #MON?"
	done

PokemaniacBrentBeatenText:
	text "Meine armen #-"
	line "MON-Lieblinge!"
	done

PokemaniacBrentAfterBattleText:
	text "Ich wäre schon"
	line "froh, wenn ich nur"
	cont "ein einziges"
	cont "seltenes #MON"
	cont "hätte."
	done

PokemaniacRonSeenText:
	text "Stell dir mal vor!"

	para "So ein <RIVAL>"
	line "hat sich über"
	cont "mein #MON"
	cont "lustig gemacht!"

	para "Unverschämtheit!"
	line "Mein #MON"
	cont "ist toll!"
	done

PokemaniacRonBeatenText:
	text "Mein NIDOKING hat"
	line "sich wacker ge-"
	cont "schlagen!"
	done

PokemaniacRonAfterBattleText:
	text "Für die meisten"
	line "Menschen ist es"

	para "ganz natürlich,"
	line "unterschiedliche"
	cont "Arten von #MON"
	cont "zu mögen."

	para "Es geht bei"
	line "#MON nicht"
	cont "darum, das"
	cont "Stärkste von allen"
	cont "zu haben."
	cont ""
	done

FisherMarvinSeenText:
	text "Ich bin gerade"
	line "ziemlich am Boden."

	para "Vielleicht liegt"
	line "das an dem Item,"
	cont "das ich benutze."

	para "Kämpfen wir! Das"
	line "hebt vielleicht"
	cont "meine Laune!"
	done

FisherMarvinBeatenText:
	text "Ich habe verloren,"
	line "aber ich fühle"
	cont "mich trotzdem"
	cont "besser."
	done

FisherMarvinAfterBattleText:
	text "KURTs KÖDERBALL"
	line "eignet sich am"

	para "besten, um #-"
	line "MON, die an der"
	cont "Angel hängen,"
	cont "einzufangen."

	para "Er ist viel"
	line "effektiver als"
	cont "der HYPERBALL."
	done

CamperSpencerSeenText:
	text "Man kann so viel"
	line "unternehmen mit"
	cont "seinen #MON -"
	cont "das macht"
	cont "unheimlich viel"
	cont "Spaß!"
	done

CamperSpencerBeatenText:
	text "Verlieren macht"
	line "überhaupt keinen"
	cont "Spaß…"
	done

CamperSpencerAfterBattleText:
	text "Was geht da vor"
	line "sich am"
	cont "SEE DES ZORNS?"

	para "Wir wollen dort"
	line "zelten."
	done

PicnickerTiffanySeenText:
	text "Gehst du auch zum"
	line "SEE DES ZORNS?"

	para "Spielen wir ein"
	line "bisschen!"
	done

PicnickerTiffanyBeatenText:
	text "Ich habe zu lange"
	line "gespielt!"
	done

PicnickerTiffanyWantsPicnicText:
	text "Ich mache ein"
	line "Picknick mit"
	cont "meinen #MON."

	para "Setz dich doch zu"
	line "uns."
	done

Route43Sign1Text:
	text "ROUTE 43"

	para "SEE DES ZORNS -"
	line "MAHAGONIA CITY"
	done

Route43Sign2Text:
	text "ROUTE 43"

	para "SEE DES ZORNS -"
	line "MAHAGONIA CITY"
	done

Route43TrainerTipsText:
	text "TIPPS für TRAINER"

	para "Alle #MON haben"
	line "Vor- und Nach-"

	para "teile. Das hängt"
	line "ganz davon ab,"
	cont "welchem Element"
	cont "sie angehören."

	para "Sind zwei #MON"
	line "unterschiedlicher"

	para "Elemente, kann"
	line "sogar ein #MON"
	cont "verlieren, das"
	cont "einen höheren"
	cont "Level hat."

	para "Finde heraus,"
	line "welche Elemente"

	para "effektiv oder"
	line "ineffektiv gegen"
	cont "deine #MON"
	cont "sind."
	done

Route43_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 51, ROUTE_43_MAHOGANY_GATE, 1
	warp_event 10, 51, ROUTE_43_MAHOGANY_GATE, 2
	warp_event 17, 35, ROUTE_43_GATE, 3
	warp_event 17, 31, ROUTE_43_GATE, 1
	warp_event 18, 31, ROUTE_43_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 13,  3, BGEVENT_READ, Route43Sign1
	bg_event 11, 49, BGEVENT_READ, Route43Sign2
	bg_event 16, 38, BGEVENT_READ, Route43TrainerTips

	def_object_events
	object_event 14,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacBen, -1
	object_event 13, 20, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacBrent, -1
	object_event 13,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPokemaniacRon, -1
	object_event  4, 16, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerFisherMarvin, -1
	object_event  9, 29, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerTiffany, -1
	object_event 15, 43, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerCamperSpencer, -1
	object_event  1, 26, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route43FruitTree, -1
	object_event 12, 32, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route43MaxEther, EVENT_ROUTE_43_MAX_ETHER
