	object_const_def
	const GOLDENRODFLOWERSHOP_TEACHER
	const GOLDENRODFLOWERSHOP_FLORIA

GoldenrodFlowerShop_MapScripts:
	def_scene_scripts

	def_callbacks

FlowerShopTeacherScript:
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue .Lalala
	checkflag ENGINE_PLAINBADGE
	iffalse .Lalala
	faceplayer
	opentext
	writetext GoldenrodFlowerShopTeacherBetterThanWhitneyText
	promptbutton
	verbosegiveitem SQUIRTBOTTLE
	setevent EVENT_GOT_SQUIRTBOTTLE
	closetext

.Lalala:
	turnobject GOLDENRODFLOWERSHOP_TEACHER, LEFT
	opentext
	writetext GoldenrodFlowerShopTeacherLalalaHavePlentyOfWaterText
	waitbutton
	closetext
	end

FlowerShopFloriaScript:
	faceplayer
	opentext
	checkflag ENGINE_PLAINBADGE
	iffalse .NoPlainBadge
	writetext GoldenrodFlowerShopFloriaJumpsInSurpriseText
	waitbutton
	closetext
	end

.NoPlainBadge:
	writetext GoldenrodFlowerShopFloriaMustBeAMonText
	waitbutton
	closetext
	end

FlowerShopShelf1: ; unreferenced
	jumpstd PictureBookshelfScript

FlowerShopShelf2: ; unreferenced
	jumpstd MagazineBookshelfScript

FlowerShopRadio: ; unreferenced
	jumpstd Radio2Script

GoldenrodFlowerShopTeacherBetterThanWhitneyText:
	text "Oh, du bist besser"
	line "als BIANKA."

	para "Hast du vom lau-"
	line "fenden Baum ge-"
	cont "hört?"

	para "Benetzt du ihn mit"
	line "einer SCHIGGYKAN-"
	cont "NE, greift er an."

	para "Aber da du ja ei-"
	line "nige ORDEN hast,"
	cont "sollte es kein"
	cont "Problem sein."
	done

GoldenrodFlowerShopTeacherLalalaHavePlentyOfWaterText:
	text "Lalala lalalala."
	line "Da hast du Wasser,"
	cont "mein Hübsches!"
	done

GoldenrodFlowerShopFloriaMustBeAMonText:
	text "Als ich den lau-"
	line "fenden Baum auf"

	para "der ROUTE 36 goss,"
	line "ist er aufgesprun-"
	cont "gen!"

	para "Ich glaube, es ist"
	line "ein #MON."

	para "Aber es bedarf ei-"
	line "nes ARENALEITERS"
	cont "wie BIANKA, um es"
	cont "zu besiegen."
	done

GoldenrodFlowerShopFloriaJumpsInSurpriseText:
	text "Hast du vom lau-"
	line "fenden Baum ge-"
	cont "hört?"

	para "Wenn du ihn gießt,"
	line "schreckt er hoch!"
	done

GoldenrodFlowerShop_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 6
	warp_event  3,  7, GOLDENROD_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FlowerShopTeacherScript, -1
	object_event  5,  6, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FlowerShopFloriaScript, -1
