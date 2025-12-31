	object_const_def
	const SOULHOUSE_MRFUJI
	const SOULHOUSE_TEACHER
	const SOULHOUSE_LASS
	const SOULHOUSE_GRANNY

SoulHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MrFuji:
	jumptextfaceplayer MrFujiText

SoulHouseTeacherScript:
	jumptextfaceplayer SoulHouseTeacherText

SoulHouseLassScript:
	jumptextfaceplayer SoulHouseLassText

SoulHouseGrannyScript:
	jumptextfaceplayer SoulHouseGrannyText

MrFujiText:
	text "SR.FUJI: Hola."

	para "Hmm… Sembla que"
	line "cries els teus"

	para "#MON amb molta"
	line "cura i amor."

	para "Els amants dels"
	line "#MON vénen aquí"

	para "a retre homenatge"
	line "als #MON"
	cont "difunts."

	para "Si us plau, oferiu"
	line "el vostre condol"

	para "per les ànimes"
	line "dels #MON"
	cont "difunts."

	para "Segur que això"
	line "els farà feliços."
	done

SoulHouseTeacherText:
	text "Hi ha altres"
	line "tombes de #MON"
	cont "aquí, crec."

	para "Hi ha moltes"
	line "cambres on només"
	cont "el SR.FUJI pot."
	done

SoulHouseLassText:
	text "He vingut amb la"
	line "meva mare a veure"
	cont "tombes de #MON…"
	done

SoulHouseGrannyText:
	text "Els #MON que"
	line "vivien amb mi…"

	para "Els estimava com"
	line "als meus néts…"
	done

SoulHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, LAVENDER_TOWN, 6
	warp_event  5,  7, LAVENDER_TOWN, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFuji, -1
	object_event  7,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseTeacherScript, -1
	object_event  2,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseLassScript, -1
	object_event  1,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseGrannyScript, -1
