CeladonMansion2F_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonMansion2FComputer:
	jumptext CeladonMansion2FComputerText

CeladonMansion2FMeetingRoomSign:
	jumptext CeladonMansion2FMeetingRoomSignText

CeladonMansion2FBookshelf:
	jumpstd DifficultBookshelfScript

CeladonMansion2FComputerText:
	text "<PLAYER> ha engegat"
	line "el PC."

	para "…"

	para "Algú estava a"
	line "mig d'escriure un"
	cont "correu."

	para "…Espero que"
	line "vinguis"
	cont "a visitar KANTO."

	para "Crec que et"
	line "sorprendrà veure"

	para "com han canviat"
	line "les coses aquí."

	para "També hi veuràs"
	line "molts #MON que"

	para "no són originaris"
	line "de JOHTO."

	para "Al PRODUCTOR"

	para "…"
	done

CeladonMansion2FMeetingRoomSignText:
	text "GAME FREAK"
	line "SALA DE REUNIONS"
	done

CeladonMansion2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, CELADON_MANSION_1F, 4
	warp_event  1,  0, CELADON_MANSION_3F, 2
	warp_event  6,  0, CELADON_MANSION_3F, 3
	warp_event  7,  0, CELADON_MANSION_1F, 5

	def_coord_events

	def_bg_events
	bg_event  0,  3, BGEVENT_READ, CeladonMansion2FComputer
	bg_event  5,  8, BGEVENT_UP, CeladonMansion2FMeetingRoomSign
	bg_event  2,  3, BGEVENT_READ, CeladonMansion2FBookshelf

	def_object_events
