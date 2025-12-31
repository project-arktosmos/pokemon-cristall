	object_const_def
	const PEWTERCITY_COOLTRAINER_F
	const PEWTERCITY_BUG_CATCHER
	const PEWTERCITY_GRAMPS
	const PEWTERCITY_FRUIT_TREE1
	const PEWTERCITY_FRUIT_TREE2

PewterCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, PewterCityFlypointCallback

PewterCityFlypointCallback:
	setflag ENGINE_FLYPOINT_PEWTER
	endcallback

PewterCityCooltrainerFScript:
	jumptextfaceplayer PewterCityCooltrainerFText

PewterCityBugCatcherScript:
	jumptextfaceplayer PewterCityBugCatcherText

PewterCityGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SILVER_WING
	iftrue .GotSilverWing
	writetext PewterCityGrampsText
	promptbutton
	verbosegiveitem SILVER_WING
	setevent EVENT_GOT_SILVER_WING
	closetext
	end

.GotSilverWing:
	writetext PewterCityGrampsText_GotSilverWing
	waitbutton
	closetext
	end

PewterCitySign:
	jumptext PewterCitySignText

PewterGymSign:
	jumptext PewterGymSignText

PewterMuseumSign:
	jumptext PewterMuseumSignText

PewterCityMtMoonGiftShopSign:
	jumptext PewterCityMtMoonGiftShopSignText

PewterCityWelcomeSign:
	jumptext PewterCityWelcomeSignText

PewterCityPokecenterSign:
	jumpstd PokecenterSignScript

PewterCityMartSign:
	jumpstd MartSignScript

PewterCityFruitTree1:
	fruittree FRUITTREE_PEWTER_CITY_1

PewterCityFruitTree2:
	fruittree FRUITTREE_PEWTER_CITY_2

PewterCityCooltrainerFText:
	text "Has visitat el"
	line "GIMNÀS PEWTER?"

	para "El LÍDER fa servir"
	line "# de tipus"
	cont "roca."
	done

PewterCityBugCatcherText:
	text "A la nit, surten"
	line "CLEFAIRY a jugar"
	cont "al MT.MOON."

	para "Però no cada nit."
	done

PewterCityGrampsText:
	text "Ah, has vingut de"
	line "tan lluny, des de"
	cont "JOHTO?"

	para "Això em porta"
	line "records. Quan era"

	para "jove, vaig anar a"
	line "JOHTO a entrenar."

	para "Em recordes molt"
	line "a com era jo de"

	para "jove."

	para "Té. Vull que"
	line "tinguis això que"
	cont "vaig trobar a"
	cont "JOHTO."
	done

PewterCityGrampsText_GotSilverWing:
	text "Anar a llocs nous"
	line "i desconeguts i"
	cont "veure gent nova…"

	para "Aquestes són les"
	line "alegries de"
	cont "viatjar."
	done

PewterCitySignText:
	text "CIUTAT PEWTER"
	line "Ciutat Gris Pedra"
	done

PewterGymSignText:
	text "CIUTAT PEWTER"
	line "GIMNÀS #MON"
	cont "LÍDER: BROCK"

	para "L'Entrenador de"
	line "#MON Rocós"
	done

PewterMuseumSignText:
	text "Hi ha un avís"
	line "aquí…"

	para "El MUSEU DE"
	line "CIÈNCIES DE PEWTER"
	cont "és tancat per"
	cont "reformes…"
	done

PewterCityMtMoonGiftShopSignText:
	text "Hi ha un avís"
	line "aquí…"

	para "BOTIGA DE REGALS"
	line "MT.MOON ARA"
	cont "OBERTA!"
	done

PewterCityWelcomeSignText:
	text "BENVINGUTS A"
	line "CIUTAT PEWTER!"
	done

PewterCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 29, 13, PEWTER_NIDORAN_SPEECH_HOUSE, 1
	warp_event 16, 17, PEWTER_GYM, 1
	warp_event 23, 17, PEWTER_MART, 2
	warp_event 13, 25, PEWTER_POKECENTER_1F, 1
	warp_event  7, 29, PEWTER_SNOOZE_SPEECH_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 25, 23, BGEVENT_READ, PewterCitySign
	bg_event 11, 17, BGEVENT_READ, PewterGymSign
	bg_event 15,  9, BGEVENT_READ, PewterMuseumSign
	bg_event 33, 19, BGEVENT_READ, PewterCityMtMoonGiftShopSign
	bg_event 19, 29, BGEVENT_READ, PewterCityWelcomeSign
	bg_event 14, 25, BGEVENT_READ, PewterCityPokecenterSign
	bg_event 24, 17, BGEVENT_READ, PewterCityMartSign

	def_object_events
	object_event 19, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterCityCooltrainerFScript, -1
	object_event 14, 29, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterCityBugCatcherScript, -1
	object_event 29, 17, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterCityGrampsScript, -1
	object_event 32,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityFruitTree1, -1
	object_event 30,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityFruitTree2, -1
