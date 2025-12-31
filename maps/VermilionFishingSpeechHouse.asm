	object_const_def
	const VERMILIONFISHINGSPEECHHOUSE_FISHING_GURU

VermilionFishingSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

FishingDude:
	jumptextfaceplayer FishingDudeText

FishingDudesHousePhoto:
	jumptext FishingDudesHousePhotoText

FishingDudesHouseBookshelf: ; unreferenced
	jumpstd PictureBookshelfScript

FishingDudeText:
	text "Sóc el PESCADOR,"
	line "el gran de la"
	cont "FAMÍLIA PESCADORA."

	para "Has conegut el"
	line "GURU PESCADOR del"
	cont "LLAC DE LA IRA?"

	para "Somia amb veure"
	line "el MAGIKARP més"
	cont "gran del món."

	para "Si no et sap greu,"
	line "li podries mostrar"

	para "els MAGIKARP que"
	line "pesquis?"

	para "Qui sap, potser"
	line "pesques el"
	cont "MAGIKARP"
	cont "dels seus somnis."
	done

FishingDudesHousePhotoText:
	text "És una foto de"
	line "gent pescant…"

	para "S'ho passen"
	line "d'allò més bé…"
	done

VermilionFishingSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 1
	warp_event  3,  7, VERMILION_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, FishingDudesHousePhoto

	def_object_events
	object_event  2,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FishingDude, -1
