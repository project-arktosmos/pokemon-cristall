	object_const_def
	const AZALEAPOKECENTER1F_NURSE
	const AZALEAPOKECENTER1F_GENTLEMAN
	const AZALEAPOKECENTER1F_FISHING_GURU
	const AZALEAPOKECENTER1F_POKEFAN_F

AzaleaPokecenter1F_MapScripts:
	def_scene_scripts
	scene_script AzaleaPokecenter1FNoopScene ; unusable

	def_callbacks

AzaleaPokecenter1FNoopScene:
	end

AzaleaPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

AzaleaPokecenter1FGentlemanScript:
	jumptextfaceplayer AzaleaPokecenter1FGentlemanText

AzaleaPokecenter1FFishingGuruScript:
	jumptextfaceplayer AzaleaPokecenter1FFishingGuruText

AzaleaPokecenter1FPokefanFScript:
	jumptextfaceplayer AzaleaPokecenter1FPokefanFText

AzaleaPokecenter1FGentlemanText:
	text "Els teus #MON"
	line "saben moviments"
	cont "MO?"

	para "Aquests moviments"
	line "es poden usar"

	para "encara que el teu"
	line "#MON hagi"
	cont "quedat KO."
	done

AzaleaPokecenter1FUnusedText: ; unreferenced
	text "Un tal BILL va"
	line "crear el sistema"

	para "per desar #MON"
	line "a l'ordinador."

	para "El PC d'en BILL"
	line "pot emmagatzemar"
	cont "20 #MON per"
	cont "CAIXA."
	done

AzaleaPokecenter1FFishingGuruText:
	text "El PC d'en BILL"
	line "pot emmagatzemar"
	cont "20 #MON per"
	cont "CAIXA."
	done

AzaleaPokecenter1FPokefanFText:
	text "Coneixes les"
	line "BONGÚRIES?"

	para "Obre-les, buida-"
	line "les i posa-hi un"

	para "dispositiu"
	line "especial."

	para "Així pots atrapar"
	line "#MON."

	para "Abans d'inventar"
	line "les # BALLS,"

	para "tothom usava"
	line "BONGÚRIES."
	done

AzaleaPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, AZALEA_TOWN, 1
	warp_event  4,  7, AZALEA_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FNurseScript, -1
	object_event  9,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FGentlemanScript, -1
	object_event  6,  1, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FFishingGuruScript, -1
	object_event  1,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FPokefanFScript, -1
