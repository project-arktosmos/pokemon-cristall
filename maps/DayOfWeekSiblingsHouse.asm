object_const_def
const DAYOFWEEKSIBLINGSHOUSE_POKEDEX

DayOfWeekSiblingsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

DayOfWeekSiblingsHousePokedexScript:
	opentext
	writetext DayOfWeekSiblingsHousePokedexText1
	yesorno
	iffalse .End
	writetext DayOfWeekSiblingsHousePokedexText2
	yesorno
	iffalse .End
	writetext DayOfWeekSiblingsHousePokedexText3
	waitbutton
.End:
	closetext
	end

DayOfWeekSiblingsHousePokedexText1:
	text "Hi ha alguna cosa"
	line "escrita aquí."

	para "Llegir-ho?"
	done

DayOfWeekSiblingsHousePokedexText2:
	text "Als meus germans i"
	line "germanes:"

	para "Estem orgullosos"
	line "de servir els"
	cont "entrenadors #."

	para "Quan un entrenador"
	line "us parli, doneu-li"
	cont "quelcom útil."

	para "Petons,"
	line "MONICA"

	para "Seguir llegint?"
	done

DayOfWeekSiblingsHousePokedexText3:
	text "Dilluns, MONICA"
	line "RUTA 40"

	para "Dimarts, TRISTANY"
	line "RUTA 29"

	para "Dimecres, MERCÈ"
	line "LLAC DE LA FÚRIA"

	para "Dijous, JORDINA"
	line "RUTA 36"

	para "Divendres, VENTURA"
	line "RUTA 32"

	para "Dissabte, SADURNÍ"
	line "CIUTAT ATZAVARA"

	para "Diumenge, DOMÈNEC"
	line "RUTA 37"
	done

DayOfWeekSiblingsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_26, 3
	warp_event  3,  7, ROUTE_26, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayOfWeekSiblingsHousePokedexScript, -1
