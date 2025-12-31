	object_const_def
	const CIANWOODPOKECENTER1F_NURSE
	const CIANWOODPOKECENTER1F_LASS
	const CIANWOODPOKECENTER1F_GYM_GUIDE
	const CIANWOODPOKECENTER1F_SUPER_NERD

CianwoodPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

CianwoodPokecenter1FLassScript:
	jumptextfaceplayer CianwoodPokecenter1FLassText

CianwoodGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_CHUCK
	iftrue .CianwoodGymGuideWinScript
	opentext
	writetext CianwoodGymGuideText
	waitbutton
	closetext
	end

.CianwoodGymGuideWinScript:
	opentext
	writetext CianwoodGymGuideWinText
	waitbutton
	closetext
	end

CianwoodPokecenter1FSuperNerdScript:
	jumptextfaceplayer CianwoodPokecenter1FSuperNerdText

CianwoodPokecenter1FLassText:
	text "Has conegut el"
	line "#MANÍAC?"

	para "Sempre es vanta"
	line "dels seus #MON"
	cont "rars."
	done

CianwoodGymGuideText:
	text "Els entrenadors"
	line "del GIMNÀS #MON"
	cont "són bruts."

	para "Si em quedo aquí,"
	line "podrien venir"
	cont "a per mi."

	para "Et dono un"
	line "consell: el LÍDER"

	para "del GIMNÀS usa"
	line "el tipus lluita."

	para "Hauries de"
	line "confondre'l amb"
	cont "#MON psíquics."

	para "Elimina els #-"
	line "MON abans que"

	para "puguin usar la"
	line "força física."

	para "I les roques del"
	line "mig del GIMNÀS?"

	para "Si no les mous"
	line "correctament,"

	para "no arribaràs al"
	line "LÍDER del GIMNÀS."

	para "Si et quedes"
	line "encallat, surt."
	done

CianwoodGymGuideWinText:
	text "<PLAYER>! Has"
	line "guanyat!"
	cont "Ho sabia només"
	cont "de mirar-te!"
	done

CianwoodPokecenter1FUnusedText1: ; unreferenced
	text "No tens ganes de"
	line "mostrar els teus"

	para "#MON als"
	line "amics?"

	para "M'agradaria"
	line "mostrar els"
	cont "#MON"

	para "que he criat al"
	line "meu amic de LILA."
	done

CianwoodPokecenter1FUnusedText2: ; unreferenced
	text "He estat lluitant"
	line "amb el meu amic"

	para "de LILA amb un"
	line "ADAPTADOR MÒBIL."

	para "Vaig 5-7 contra"
	line "ell. He d'esforçar"
	cont "-me més!"
	done

CianwoodPokecenter1FSuperNerdText:
	text "M'encanta mostrar"
	line "els #MON que"

	para "he criat."
	line "A tu no?"

	para "Faré un munt de"
	line "batalles i"

	para "mostraré els meus"
	line "#MON!"
	done

CianwoodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, CIANWOOD_CITY, 3
	warp_event  4,  7, CIANWOOD_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FLassScript, -1
	object_event  5,  3, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodGymGuideScript, -1
	object_event  8,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FSuperNerdScript, -1
