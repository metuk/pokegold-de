	object_const_def
	const ROUTE39_SAILOR
	const ROUTE39_POKEFAN_M
	const ROUTE39_POKEFAN_F
	const ROUTE39_MILTANK1
	const ROUTE39_MILTANK2
	const ROUTE39_MILTANK3
	const ROUTE39_MILTANK4
	const ROUTE39_PSYCHIC_NORMAN
	const ROUTE39_FRUIT_TREE

Route39_MapScripts:
	def_scene_scripts

	def_callbacks

Route39Miltank:
	opentext
	writetext Route39MiltankText
	cry MILTANK
	waitbutton
	closetext
	end

TrainerPokefanmDerek:
	trainer POKEFANM, DEREK1, EVENT_BEAT_POKEFANM_DEREK, PokefanmDerekSeenText, PokefanmDerekBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_DEREK_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_POKEFANM_DEREK
	iftrue .NumberAccepted
	checkevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PokefanMDerekText_NotBragging
	promptbutton
	setevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_POKEFANM_DEREK
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, POKEFANM, DEREK1
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext PokefanmDerekBeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	iftrue .LoadFight1
	loadtrainer POKEFANM, DEREK1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_DEREK_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer POKEFANM, DEREK2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_DEREK_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer POKEFANM, DEREK3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_DEREK_READY_FOR_REMATCH
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

TrainerPokefanfRuth:
	trainer POKEFANF, RUTH, EVENT_BEAT_POKEFANF_RUTH, PokefanfRuthSeenText, PokefanfRuthBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfRuthAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorEugene:
	trainer SAILOR, EUGENE, EVENT_BEAT_SAILOR_EUGENE, SailorEugeneSeenText, SailorEugeneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorEugeneAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicNorman:
	trainer PSYCHIC_T, NORMAN, EVENT_BEAT_PSYCHIC_NORMAN, PsychicNormanSeenText, PsychicNormanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicNormanAfterBattleText
	waitbutton
	closetext
	end

Route39Sign:
	jumptext Route39SignText

MoomooFarmSign:
	jumptext MoomooFarmSignText

Route39TrainerTips:
	jumptext Route39TrainerTipsText

Route39FruitTree:
	fruittree FRUITTREE_ROUTE_39

Route39HiddenNugget:
	hiddenitem NUGGET, EVENT_ROUTE_39_HIDDEN_NUGGET

Route39MiltankText:
	text "MILTANK: Muh!"
	done

SailorEugeneSeenText:
	text "Ich bin gerade"
	line "wieder in OLIVIANA"
	cont "angekommen."

	para "Wie steht es nun"
	line "mit dem #MON-"
	cont "Kampf?"
	done

SailorEugeneBeatenText:
	text "Aah!"
	done

SailorEugeneAfterBattleText:
	text "Meine #MON"
	line "wurden eingefangen"
	cont "und sind im Aus-"
	cont "land aufgezogen"
	cont "worden."

	para "Sie begleiten mich"
	line "auf meinen langen"
	cont "Reisen."
	done

PokefanmDerekSeenText:
	text "Macht es dir etwas"
	line "aus, wenn ich mit"
	cont "meinen #MON"
	cont "angebe?"
	done

PokefanmDerekBeatenText:
	text "Ich hatte nicht"
	line "einmal Zeit"
	cont "anzugeben…"
	done

PokefanMDerekText_NotBragging:
	text "Ich höre mir deine"
	line "Prahlerei gar"
	cont "nicht an!"

	para "Wir #-FANS"
	line "haben ein Gelübde,"

	para "das uns verbietet,"
	line "Leuten beim"
	cont "Prahlen zuzuhören!"
	done

PokefanfRuthSeenText:
	text "Was für süße"
	line "#MON!"

	para "Zeigen wir uns"
	line "gegenseitig unsere"
	cont "#MON, und zwar"
	cont "gleichzeitig!"
	done

PokefanfRuthBeatenText:
	text "Mir macht es"
	line "nichts aus,"
	cont "zu verlieren."
	done

PokefanfRuthAfterBattleText:
	text "Weißt du über"
	line "Baby-#MON"
	cont "Bescheid?"

	para "Die sind bestimmt"
	line "super-süß!"
	done

PsychicNormanSeenText:
	text "Zeig doch mal, was"
	line "deine #MON"
	cont "drauf haben."
	done

PsychicNormanBeatenText:
	text "He, deine #MON"
	line "sind sehr fähig!"
	done

PsychicNormanAfterBattleText:
	text "Du weißt von den"
	line "unterschiedlichen"
	cont "#-Fähigkeiten?"

	para "Bei den Menschen"
	line "ist das ganz"
	cont "ähnlich. Jeder hat"
	cont "unterschiedliche"
	cont "Talente."
	done

Route39SignText:
	text "ROUTE 39"

	para "OLIVIANA CITY -"
	line "TEAK CITY"
	done

MoomooFarmSignText:
	text "KUHMUH-FARM"

	para "Unsere Bekömmliche"
	line "Milch Ist Sehr"
	cont "Erfrischend"
	done

Route39TrainerTipsText:
	text "TIPPS für TRAINER"
	line "Benutze KOPFNUSS,"

	para "um #MON"
	line "aus den Bäumen"
	cont "zu schütteln."

	para "Auf den Bäumen"
	line "leben verschiedene"
	cont "Arten von #MON."

	para "Benutze KOPFNUSS"
	line "an jedem Baum, den"
	cont "du siehst!"
	done

Route39_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1,  3, ROUTE_39_BARN, 1
	warp_event  5,  3, ROUTE_39_FARMHOUSE, 1

	def_coord_events

	def_bg_events
	bg_event  5, 31, BGEVENT_READ, Route39TrainerTips
	bg_event  9,  5, BGEVENT_READ, MoomooFarmSign
	bg_event 15,  7, BGEVENT_READ, Route39Sign
	bg_event  5, 13, BGEVENT_ITEM, Route39HiddenNugget

	def_object_events
	object_event 13, 29, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSailorEugene, -1
	object_event 11, 19, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanmDerek, -1
	object_event 13, 22, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerPokefanfRuth, -1
	object_event  3, 12, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  6, 11, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  4, 15, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  8, 13, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event 13,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicNorman, -1
	object_event  9,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39FruitTree, -1
