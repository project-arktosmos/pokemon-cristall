	object_const_def
	const LAVENDERPOKECENTER1F_NURSE
	const LAVENDERPOKECENTER1F_GENTLEMAN
	const LAVENDERPOKECENTER1F_TEACHER
	const LAVENDERPOKECENTER1F_YOUNGSTER

LavenderPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

LavenderPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

LavenderPokecenter1FGentlemanScript:
	jumptextfaceplayer LavenderPokecenter1FGentlemanText

LavenderPokecenter1FTeacherScript:
	jumptextfaceplayer LavenderPokecenter1FTeacherText

LavenderPokecenter1FYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext LavenderPokecenter1FYoungsterText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext LavenderPokecenter1FYoungsterText_ReturnedMachinePart
	waitbutton
	closetext
	end

LavenderPokecenter1FGentlemanText:
	text "Al nord de"
	line "LAVENDER hi ha el"

	para "TÚNEL ROCA. Passa"
	line "per arribar a la"
	cont "CENTRAL ELÈCTRICA."
	done

LavenderPokecenter1FTeacherText:
	text "Hi ha un programa"
	line "de ràdio que posa"
	cont "música de #"
	cont "FLAUTA."

	para "Oh? La teva ràdio"
	line "necessita EXPN"
	cont "CARD"
	cont "per"
	cont "sintonitzar-la."
	done

LavenderPokecenter1FYoungsterText:
	text "Si la CENTRAL"
	line "ELÈCTRICA no"

	para "funciona, el TREN"
	line "MAGNÈTIC tampoc…"

	para "També vol dir que"
	line "l'EMISSORA no pot"
	cont "emetre…"
	done

LavenderPokecenter1FYoungsterText_ReturnedMachinePart:
	text "El DIRECTOR de"
	line "l'EMISSORA estava"
	cont "molt content."

	para "Ha dit que tornen"
	line "a emetre"

	para "perquè la CENTRAL"
	line "ELÈCTRICA funciona"
	cont "bé de nou."
	done

LavenderPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, LAVENDER_TOWN, 1
	warp_event  4,  7, LAVENDER_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FNurseScript, -1
	object_event  7,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FGentlemanScript, -1
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FTeacherScript, -1
	object_event  1,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FYoungsterScript, -1
