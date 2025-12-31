	object_const_def
	const OLIVINEGOODRODHOUSE_FISHING_GURU

OlivineGoodRodHouse_MapScripts:
	def_scene_scripts

	def_callbacks

GoodRodGuru:
	faceplayer
	opentext
	checkevent EVENT_GOT_GOOD_ROD
	iftrue .AlreadyGotItem
	writetext OfferGoodRodText
	yesorno
	iffalse .DontWantIt
	writetext GiveGoodRodText
	promptbutton
	verbosegiveitem GOOD_ROD
	writetext GaveGoodRodText
	waitbutton
	closetext
	setevent EVENT_GOT_GOOD_ROD
	end

.DontWantIt:
	writetext DontWantGoodRodText
	waitbutton
	closetext
	end

.AlreadyGotItem:
	writetext HaveGoodRodText
	waitbutton
	closetext
	end

GoodRodHouseBookshelf: ; unreferenced
	jumpstd PictureBookshelfScript

OfferGoodRodText:
	text "OLIVINE és al"
	line "costat del mar!"

	para "I si és al mar,"
	line "hi ha d'haver"
	cont "peixos!"

	para "Porto 30 anys"
	line "pescant aquí."

	para "T'agradaria mirar"
	line "el mar i pescar?"
	done

GiveGoodRodText:
	text "Ah, hahah!"
	line "Tenim un nou"
	cont "pescador!"
	done

GaveGoodRodText:
	text "Els peixos no són"
	line "només al mar."

	para "Van allà on hi"
	line "hagi aigua."
	done

DontWantGoodRodText:
	text "Què?! No t'agrada"
	line "pescar!?"
	cont "Incomprensible!"
	done

HaveGoodRodText:
	text "Com va tot?"
	line "Has pescat un bon"
	cont "peix?"
	done

OlivineGoodRodHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 6
	warp_event  3,  7, OLIVINE_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoodRodGuru, -1
