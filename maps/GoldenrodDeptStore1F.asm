	object_const_def
	const GOLDENRODDEPTSTORE1F_RECEPTIONIST
	const GOLDENRODDEPTSTORE1F_POKEFAN_F
	const GOLDENRODDEPTSTORE1F_BUG_CATCHER
	const GOLDENRODDEPTSTORE1F_GENTLEMAN

GoldenrodDeptStore1F_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodDeptStore1FReceptionistScript:
	jumptextfaceplayer GoldenrodDeptStore1FReceptionistText

GoldenrodDeptStore1FGentlemanScript:
	jumptextfaceplayer GoldenrodDeptStore1FGentlemanText

GoldenrodDeptStore1FPokefanFScript:
	jumptextfaceplayer GoldenrodDeptStore1FPokefanFText

GoldenrodDeptStore1FBugCatcherScript:
	jumptextfaceplayer GoldenrodDeptStore1FBugCatcherText

GoldenrodDeptStore1FDirectory:
	jumptext GoldenrodDeptStore1FDirectoryText

GoldenrodDeptStore1FElevatorButton:
	jumpstd ElevatorButtonScript

GoldenrodDeptStore1FReceptionistText:
	text "Benvingut als"
	line "grans magatzems"
	cont "TRIGAT DAURAT."
	done

GoldenrodDeptStore1FGentlemanText:
	text "Els magatzems"
	line "tenen una bona"
	cont "selecció."

	para "Però alguns"
	line "objectes només es"

	para "troben al RACÓ"
	line "RECREATIU."
	done

GoldenrodDeptStore1FPokefanFText:
	text "Tinc moltes ganes"
	line "de comprar avui!"
	done

GoldenrodDeptStore1FBugCatcherText:
	text "La mare és bona"
	line "buscant ofertes."

	para "Sempre compra"
	line "coses a preus"
	cont "més baixos."
	done

GoldenrodDeptStore1FDirectoryText:
	text "1F TAULELL"

	para "2F MERCAT DEL"
	line "   ENTRENADOR"

	para "3F COL·LECCIÓ"
	line "   DE COMBAT"

	para "4F MEDICINES"

	para "5F RACÓ DE MT"

	para "6F PLAÇA"
	line "   TRANQUIL·LA"

	para "TERRAT MIRADOR"
	done

GoldenrodDeptStore1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  7, GOLDENROD_CITY, 9
	warp_event  8,  7, GOLDENROD_CITY, 9
	warp_event 15,  0, GOLDENROD_DEPT_STORE_2F, 2
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_READ, GoldenrodDeptStore1FDirectory
	bg_event  3,  0, BGEVENT_READ, GoldenrodDeptStore1FElevatorButton

	def_object_events
	object_event 10,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FReceptionistScript, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FPokefanFScript, -1
	object_event  5,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FBugCatcherScript, -1
	object_event 11,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FGentlemanScript, -1
