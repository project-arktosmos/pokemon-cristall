	object_const_def
	const ROUTE3_FISHER1
	const ROUTE3_YOUNGSTER1
	const ROUTE3_YOUNGSTER2
	const ROUTE3_FISHER2

Route3_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerFirebreatherOtis:
	trainer FIREBREATHER, OTIS, EVENT_BEAT_FIREBREATHER_OTIS, FirebreatherOtisSeenText, FirebreatherOtisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherOtisAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterWarren:
	trainer YOUNGSTER, WARREN, EVENT_BEAT_YOUNGSTER_WARREN, YoungsterWarrenSeenText, YoungsterWarrenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterWarrenAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterJimmy:
	trainer YOUNGSTER, JIMMY, EVENT_BEAT_YOUNGSTER_JIMMY, YoungsterJimmySeenText, YoungsterJimmyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterJimmyAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherBurt:
	trainer FIREBREATHER, BURT, EVENT_BEAT_FIREBREATHER_BURT, FirebreatherBurtSeenText, FirebreatherBurtBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherBurtAfterBattleText
	waitbutton
	closetext
	end

Route3MtMoonSquareSign:
	jumptext Route3MtMoonSquareSignText

FirebreatherOtisSeenText:
	text "Ah! El temps és"
	line "tan bo com sempre."
	done

FirebreatherOtisBeatenText:
	text "Fa sol, però"
	line "estic ben mullat…"
	done

FirebreatherOtisAfterBattleText:
	text "Quan plou,"
	line "és difícil"
	cont "encendre el foc…"
	done

YoungsterWarrenSeenText:
	text "Hmmm… No sé"
	line "què fer…"
	done

YoungsterWarrenBeatenText:
	text "Sabia que perdria…"
	done

YoungsterWarrenAfterBattleText:
	text "Semblaves fort."

	para "Tenia por"
	line "d'enfrontar-te…"
	done

YoungsterJimmySeenText:
	text "Puc córrer com"
	line "el vent!"
	done

YoungsterJimmyBeatenText:
	text "M'has escomès!"
	done

YoungsterJimmyAfterBattleText:
	text "Porto pantalons"
	line "curts tot l'any."

	para "Aquesta és la meva"
	line "política de moda."
	done

FirebreatherBurtSeenText:
	text "Acosteu-vos i"
	line "mireu bé!"
	done

FirebreatherBurtBeatenText:
	text "Ui! Això crema!"
	done

FirebreatherBurtAfterBattleText:
	text "El millor"
	line "tragafocs de"
	cont "KANTO, sóc jo."

	para "Però no el millor"
	line "entrenador…"
	done

Route3MtMoonSquareSignText:
	text "PLAÇA MT.MOON"

	para "Simplement puja"
	line "les escales."
	done

Route3_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 52,  1, MOUNT_MOON, 1

	def_coord_events

	def_bg_events
	bg_event 49, 13, BGEVENT_READ, Route3MtMoonSquareSign

	def_object_events
	object_event 26, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherOtis, -1
	object_event 10,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterWarren, -1
	object_event 16,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerYoungsterJimmy, -1
	object_event 49,  5, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFirebreatherBurt, -1
