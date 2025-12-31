	object_const_def
	const VIRIDIANPOKECENTER1F_NURSE
	const VIRIDIANPOKECENTER1F_COOLTRAINER_M
	const VIRIDIANPOKECENTER1F_COOLTRAINER_F
	const VIRIDIANPOKECENTER1F_BUG_CATCHER

ViridianPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

ViridianPokecenter1FCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_BLUE_IN_CINNABAR
	iftrue .BlueReturned
	writetext ViridianPokecenter1FCooltrainerMText
	waitbutton
	closetext
	end

.BlueReturned:
	writetext ViridianPokecenter1FCooltrainerMText_BlueReturned
	waitbutton
	closetext
	end

ViridianPokecenter1FCooltrainerFScript:
	jumptextfaceplayer ViridianPokecenter1FCooltrainerFText

ViridianPokecenter1FBugCatcherScript:
	jumptextfaceplayer ViridianPokecenter1FBugCatcherText

ViridianPokecenter1FCooltrainerMText:
	text "On dimonis és el"
	line "LÍDER del GIMNÀS"

	para "de VIRIDIAN? Volia"
	line "desafiar-lo."
	done

ViridianPokecenter1FCooltrainerMText_BlueReturned:
	text "No hi ha cap"
	line "ENTRENADOR al"
	cont "GIMNÀS VIRIDIAN."

	para "El LÍDER diu que"
	line "la seva norma és"

	para "guanyar sense cap"
	line "subordinat."
	done

ViridianPokecenter1FCooltrainerFText:
	text "He sentit que el"
	line "GIMNÀS de CINNABAR"
	cont "ja no hi és."

	para "Em pregunto què"
	line "ha estat de BLAINE"
	cont "el LÍDER."
	done

ViridianPokecenter1FBugCatcherText:
	text "El meu somni és"
	line "ser LÍDER de GIM."
	done

ViridianPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, VIRIDIAN_CITY, 5
	warp_event  4,  7, VIRIDIAN_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FNurseScript, -1
	object_event  8,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FCooltrainerMScript, -1
	object_event  5,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FCooltrainerFScript, -1
	object_event  1,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FBugCatcherScript, -1
