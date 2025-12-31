	object_const_def
	const ROUTE7SAFFRONGATE_OFFICER

Route7SaffronGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route7SaffronGuardScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedPart
	writetext Route7SaffronGuardPowerPlantText
	waitbutton
	closetext
	end

.ReturnedPart:
	writetext Route7SaffronGuardSeriousText
	waitbutton
	closetext
	end

Route7SaffronGuardPowerPlantText:
	text "Has sentit parlar"
	line "de l'accident a"
	cont "la CENTRAL?"

	para "És a l'est, a"
	line "prop de LAVENDER"
	cont "TOWN."
	done

Route7SaffronGuardSeriousText:
	text "Em prenc la feina"
	line "de GUÀRDIA"
	cont "seriosament."

	para "Ei! Tens una"
	line "#DEX."

	para "D'acord. Pots"
	line "passar."
	done

Route7SaffronGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, ROUTE_7, 1
	warp_event  0,  5, ROUTE_7, 2
	warp_event  9,  4, SAFFRON_CITY, 10
	warp_event  9,  5, SAFFRON_CITY, 11

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route7SaffronGuardScript, -1
