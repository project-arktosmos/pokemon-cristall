	object_const_def
	const TRAINERHOUSE1F_RECEPTIONIST
	const TRAINERHOUSE1F_COOLTRAINER_M
	const TRAINERHOUSE1F_COOLTRAINER_F
	const TRAINERHOUSE1F_YOUNGSTER
	const TRAINERHOUSE1F_GENTLEMAN

TrainerHouse1F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerHouse1FReceptionistScript:
	jumptextfaceplayer TrainerHouse1FReceptionistText

TrainerHouse1FCooltrainerMScript:
	jumptextfaceplayer TrainerHouse1FCooltrainerMText

TrainerHouse1FCooltrainerFScript:
	jumptextfaceplayer TrainerHouse1FCooltrainerFText

TrainerHouse1FYoungsterScript:
	jumptextfaceplayer TrainerHouse1FYoungsterText

TrainerHouse1FGentlemanScript:
	jumptextfaceplayer TrainerHouse1FGentlemanText

TrainerHouseSign1:
	jumptext TrainerHouseSign1Text

TrainerHouseSign2:
	jumptext TrainerHouseSign2Text

TrainerHouseIllegibleBook:
	jumptext TrainerHouseIllegibleText

TrainerHouse1FReceptionistText:
	text "Benvingut a la"
	line "CASA ENTRENADORS,"

	para "el lloc més nou i"
	line "actiu de VIRIDIAN."

	para "Només admeten"
	line "entrenadors."

	para "Pots combatre"
	line "contra els millors"

	para "dels millors a"
	line "sota."
	done

TrainerHouse1FCooltrainerMText:
	text "VIRIDIAN és el"
	line "poble més proper a"
	cont "ALTIPLÀ ÍNDIC."

	para "Van construir"
	line "aquest lloc perquè"

	para "molts entrenadors"
	line "hi passen de camí"

	para "cap a l'ALTIPLÀ"
	line "ÍNDIC."
	done

TrainerHouse1FCooltrainerFText:
	text "Fan combats de"
	line "pràctica a sota."

	para "M'encantaria"
	line "veure com combaten"

	para "els entrenadors"
	line "de JOHTO."
	done

TrainerHouse1FYoungsterText:
	text "Suposo que no pots"
	line "ser CAMPIÓ si no"

	para "vas per tot arreu"
	line "i lluites contra"

	para "tota mena de"
	line "gent."

	para "El CAMPIÓ de"
	line "PALLET va viatjar"

	para "a totes les ciutas"
	line "i pobles de KANTO."
	done

TrainerHouse1FGentlemanText:
	text "Uf… Estic fent un"
	line "descans dels"
	cont "combats #MON."
	done

TrainerHouseSign1Text:
	text "Els combats de"
	line "pràctica es fan"

	para "a la SALA"
	line "D'ENTRENAMENT."

	para "S'hi conviden"
	line "entrenadors"
	cont "experts."
	done

TrainerHouseSign2Text:
	text "No hi ha normes ni"
	line "regulacions per"

	para "als combats de"
	line "pràctica. Com als"

	para "combats de camp,"
	line "tot s'hi val!"
	done

TrainerHouseIllegibleText:
	text "…Què és això?"
	line "Una nota tàctica?"

	para "Aquesta lletra"
	line "sembla petjades"
	cont "d'ONIX…"

	para "És completament"
	line "il·legible…"
	done

TrainerHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 13, VIRIDIAN_CITY, 3
	warp_event  3, 13, VIRIDIAN_CITY, 3
	warp_event  8,  2, TRAINER_HOUSE_B1F, 1

	def_coord_events

	def_bg_events
	bg_event  5,  0, BGEVENT_READ, TrainerHouseSign1
	bg_event  7,  0, BGEVENT_READ, TrainerHouseSign2
	bg_event  7, 10, BGEVENT_READ, TrainerHouseIllegibleBook

	def_object_events
	object_event  0, 11, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FReceptionistScript, -1
	object_event  7, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FCooltrainerMScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FCooltrainerFScript, -1
	object_event  4,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FYoungsterScript, -1
	object_event  2,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FGentlemanScript, -1
