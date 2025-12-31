	object_const_def
	const OLIVINECAFE_SAILOR1
	const OLIVINECAFE_FISHING_GURU
	const OLIVINECAFE_SAILOR2

OlivineCafe_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineCafeStrengthSailorScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM04_STRENGTH
	iftrue .GotStrength
	writetext OlivineCafeStrengthSailorText
	promptbutton
	verbosegiveitem HM_STRENGTH
	setevent EVENT_GOT_HM04_STRENGTH
.GotStrength:
	writetext OlivineCafeStrengthSailorText_GotStrength
	waitbutton
	closetext
	end

OlivineCafeFishingGuruScript:
	jumptextfaceplayer OlivineCafeFishingGuruText

OlivineCafeSailorScript:
	jumptextfaceplayer OlivineCafeSailorText

OlivineCafeStrengthSailorText:
	text "Ha! Els teus"
	line "#MON"
	cont "semblen uns"
	cont "esquifits!"

	para "No tenen prou"
	line "força per moure"
	cont "les roques."

	para "Té, fes servir"
	line "això i ensenya'ls"
	cont "STRENGTH!"
	done

OlivineCafeStrengthSailorText_GotStrength:
	text "Al mar, l'única"
	line "cosa amb què pots"

	para "comptar ets tu"
	line "mateix!"

	para "Estic tan orgullós"
	line "del meu cos!"
	done

OlivineCafeFishingGuruText:
	text "El menú del CAFÈ"
	line "OLIVINA és ple de"

	para "menjar consistent"
	line "per a MARINERS!"
	done

OlivineCafeSailorText:
	text "Sempre que vinc a"
	line "aquesta ciutat,"

	para "visito el CAFÈ"
	line "OLIVINA."

	para "Tot el menú em fa"
	line "sentir més fort."

	para "No puc parar de"
	line "menjar!"
	done

OlivineCafe_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 7
	warp_event  3,  7, OLIVINE_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeStrengthSailorScript, -1
	object_event  7,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeFishingGuruScript, -1
	object_event  6,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeSailorScript, -1
