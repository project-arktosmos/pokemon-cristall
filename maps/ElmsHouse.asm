	object_const_def
	const ELMSHOUSE_ELMS_WIFE
	const ELMSHOUSE_ELMS_SON

ElmsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

ElmsWife:
	jumptextfaceplayer ElmsWifeText

ElmsSon:
	jumptextfaceplayer ElmsSonText

ElmsHousePC:
	jumptext ElmsHousePCText

ElmsHouseBookshelf:
	jumpstd DifficultBookshelfScript

ElmsWifeText:
	text "Hola, <PLAY_G>! El"
	line "meu marit sempre"

	para "està tan ocupat…"
	line "Espero que estigui"
	cont "bé."

	para "Quan s'endinsa en"
	line "la investigació"

	para "#MON, fins i"
	line "tot oblida menjar."
	done

ElmsSonText:
	text "Quan sigui gran,"
	line "ajudaré el meu"
	cont "pare!"

	para "Seré un gran"
	line "professor #MON!"
	done

ElmsHouseLabFoodText: ; unreferenced
	text "Aquí hi ha menjar."
	line "Deu ser per al"
	cont "LABORATORI."
	done

ElmsHousePokemonFoodText: ; unreferenced
	text "Aquí hi ha menjar."
	line "Deu ser per als"
	cont "#MON."
	done

ElmsHousePCText:
	text "#MON. D'on"
	line "vénen?"

	para "On van?"

	para "Per què ningú no"
	line "ha presenciat mai"
	cont "néixer un #MON?"

	para "Vull saber-ho!"
	line "Dedicaré la vida"

	para "a l'estudi dels"
	line "#MON!"

	para "…"

	para "És part dels"
	line "treballs del"
	cont "PROF.ELM."
	done

ElmsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, NEW_BARK_TOWN, 4
	warp_event  3,  7, NEW_BARK_TOWN, 4

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, ElmsHousePC
	bg_event  6,  1, BGEVENT_READ, ElmsHouseBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsHouseBookshelf

	def_object_events
	object_event  1,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ElmsWife, -1
	object_event  5,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ElmsSon, -1
