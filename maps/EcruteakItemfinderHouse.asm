	object_const_def
	const ECRUTEAKITEMFINDERHOUSE_COOLTRAINER_M
	const ECRUTEAKITEMFINDERHOUSE_POKEDEX

EcruteakItemfinderHouse_MapScripts:
	def_scene_scripts

	def_callbacks

EcruteakItemfinderGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_ITEMFINDER
	iftrue .itemfinder
	writetext EcruteakItemfinderAdventureText
	yesorno
	iffalse .no
	writetext EcruteakItemfinderTrueSpiritText
	promptbutton
	verbosegiveitem ITEMFINDER
	setevent EVENT_GOT_ITEMFINDER
.itemfinder:
	writetext ItemfinderExplanationText
	waitbutton
	closetext
	end

.no:
	writetext EcruteakItemfinderToEachHisOwnText
	waitbutton
	closetext
	end

EcruteakHistoryBook:
	opentext
	writetext EcruteakHistoryBookText
	yesorno
	iftrue .ReadBook
	closetext
	end

.ReadBook:
	writetext EcruteakTwoTowersText
	yesorno
	iftrue .KeepReading
	closetext
	end

.KeepReading:
	writetext EcruteakThreeMonText
	waitbutton
	closetext
	end

ItemFinderHouseRadio:
	jumpstd Radio2Script

EcruteakItemfinderAdventureText:
	text "Ah! Estàs en una"
	line "aventura amb els"
	cont "teus #MON?"

	para "I què és una"
	line "aventura sense"
	cont "caça de tresors?"

	para "Tinc raó o no"
	line "tinc raó?"
	done

EcruteakItemfinderTrueSpiritText:
	text "Bé! Entens el"
	line "veritable esperit"

	para "de l'aventura."

	para "M'agrada! Enduu-"
	line "te'n això."
	done

ItemfinderExplanationText:
	text "Hi ha molts"
	line "objectes amagats"

	para "que no són"
	line "evidents."

	para "Fes servir el"
	line "TROBADOR per"

	para "comprovar si hi"
	line "ha un objecte a"
	cont "prop teu."

	para "No indica el lloc"
	line "exacte, així que"

	para "hauràs de buscar"
	line "tu mateix."

	para "Ah, sí! He sentit"
	line "que hi ha objec-"

	para "tes a la TORRE"
	line "CREMADA d'aquí."
	done

EcruteakItemfinderToEachHisOwnText:
	text "Oh… Cadascú té"
	line "els seus gustos…"
	done

EcruteakHistoryBookText:
	text "HISTÒRIA"
	line "D'ECRUTEAK"

	para "Vols llegir-lo?"
	done

EcruteakTwoTowersText:
	text "A ECRUTEAK hi"
	line "havia dues torres."

	para "Cada torre era el"
	line "niu de poderosos"
	cont "#MON voladors."

	para "Però una de les"
	line "torres es va"
	cont "cremar del tot."

	para "Els dos #MON"
	line "no s'han vist"
	cont "des de llavors…"

	para "Vols continuar?"
	done

EcruteakThreeMonText:
	text "ECRUTEAK també era"
	line "la llar de tres"

	para "#MON que"
	line "corrien"
	cont "pel poble."

	para "Es diu que van"
	line "néixer de l'aigua,"

	para "el llamp i el foc."

	para "Però no podien"
	line "contenir el seu"
	cont "poder excessiu."

	para "Així que diuen que"
	line "els tres van fugir"

	para "com el vent cap"
	line "a les praderies."
	done

EcruteakItemfinderHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 11
	warp_event  4,  7, ECRUTEAK_CITY, 11

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, ItemFinderHouseRadio

	def_object_events
	object_event  2,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakItemfinderGuy, -1
	object_event  3,  3, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakHistoryBook, -1
