	object_const_def
	const OLIVINELIGHTHOUSE4F_SAILOR
	const OLIVINELIGHTHOUSE4F_LASS

OlivineLighthouse4F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerLassConnie:
	trainer LASS, CONNIE1, EVENT_BEAT_LASS_CONNIE, LassConnie1SeenText, LassConnie1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassConnie1AfterBattleText
	waitbutton
	closetext
	end

TrainerSailorKent:
	trainer SAILOR, KENT, EVENT_BEAT_SAILOR_KENT, SailorKentSeenText, SailorKentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorKentAfterBattleText
	waitbutton
	closetext
	end

SailorKentSeenText:
	text "La JASMINE deu"
	line "estar molt"
	cont "preocupada pel"
	cont "#MON d'aquí."

	para "Ja no somriu"
	line "gens, últimament."
	done

SailorKentBeatenText:
	text "Ara jo tampoc no"
	line "puc somriure…"
	done

SailorKentAfterBattleText:
	text "Parlant de malalt,"
	line "he sentit que hi"

	para "ha una bona"
	line "FARMÀCIA a"
	cont "CIANWOOD."
	done

LassConnie1SeenText:
	text "La JASMINE és la"
	line "LÍDER del GIMNÀS"
	cont "d'aquesta ciutat."

	para "Penso fer que"
	line "torni amb mi."

	para "Que ningú no"
	line "s'interposi!"
	done

LassConnie1BeatenText:
	text "Aaah! El meu"
	line "#MON!"
	done

LassConnie1AfterBattleText:
	text "És clar. Qualsevol"
	line "estaria preocupat"
	cont "si el seu propi"
	cont "#MON estigués"
	cont "ferit."

	para "Resaré pel #MON"
	line "d'aquí, perquè la"

	para "JASMINE pugui"
	line "tornar al GIMNÀS."
	done

OlivineLighthouse4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  3, OLIVINE_LIGHTHOUSE_3F, 1
	warp_event  3,  5, OLIVINE_LIGHTHOUSE_5F, 2
	warp_event  9,  7, OLIVINE_LIGHTHOUSE_5F, 3
	warp_event  9,  5, OLIVINE_LIGHTHOUSE_3F, 3
	warp_event 16,  9, OLIVINE_LIGHTHOUSE_3F, 6
	warp_event 17,  9, OLIVINE_LIGHTHOUSE_3F, 7
	warp_event  8,  3, OLIVINE_LIGHTHOUSE_3F, 8
	warp_event  9,  3, OLIVINE_LIGHTHOUSE_3F, 9
	warp_event 16,  7, OLIVINE_LIGHTHOUSE_5F, 4
	warp_event 17,  7, OLIVINE_LIGHTHOUSE_5F, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7, 14, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorKent, -1
	object_event 11,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassConnie, -1
