object_const_def
const ROUTE11_YOUNGSTER1
const ROUTE11_YOUNGSTER2
const ROUTE11_YOUNGSTER3
const ROUTE11_YOUNGSTER4
const ROUTE11_FRUIT_TREE

Route11_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerYoungsterOwen:
	trainer YOUNGSTER, OWEN, EVENT_BEAT_YOUNGSTER_OWEN, YoungsterOwenSeenText, YoungsterOwenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterOwenAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterJason:
	trainer YOUNGSTER, JASON, EVENT_BEAT_YOUNGSTER_JASON, YoungsterJasonSeenText, YoungsterJasonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterJasonAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicHerman:
	trainer PSYCHIC_T, HERMAN, EVENT_BEAT_PSYCHIC_HERMAN, PsychicHermanSeenText, PsychicHermanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicHermanAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicFidel:
	trainer PSYCHIC_T, FIDEL, EVENT_BEAT_PSYCHIC_FIDEL, PsychicFidelSeenText, PsychicFidelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicFidelAfterBattleText
	waitbutton
	closetext
	end

Route11Sign:
	jumptext Route11SignText

Route11FruitTree:
	fruittree FRUITTREE_ROUTE_11

Route11HiddenRevive:
	hiddenitem REVIVE, EVENT_ROUTE_11_HIDDEN_REVIVE

YoungsterOwenSeenText:
	text "No es pot fer"
	line "trampes amb"
	cont "#MON."

	para "Siguem justos i"
	line "honrats!"
	done

YoungsterOwenBeatenText:
	text "Eh? Com ha pogut"
	line "passar això?"
	done

YoungsterOwenAfterBattleText:
	text "He lluitat amb"
	line "honor i justícia."

	para "No me'n penedeixo"
	line "gens ni mica."
	done

YoungsterJasonSeenText:
	text "Em fa picor i"
	line "pessigolles quan"

	para "porto pantalons"
	line "curts a l'herba."
	done

YoungsterJasonBeatenText:
	text "Aiaaa!"
	line "M'han esclafat!"
	done

YoungsterJasonAfterBattleText:
	text "Atraparé més"
	line "#MON a l'herba."
	done

PsychicHermanSeenText:
	text "…"
	done

PsychicHermanBeatenText:
	text "…"
	done

PsychicHermanAfterBattleText:
	text "…"

	para "He perdut amb els"
	line "ulls tancats…"
	done

PsychicFidelSeenText:
	text "Ho puc veure…"

	para "Tot el que cal"
	line "saber de tu…"
	done

PsychicFidelBeatenText:
	text "No he pogut"
	line "preveure el teu"
	cont "poder…"
	done

PsychicFidelAfterBattleText:
	text "Força en la"
	line "convicció…"

	para "Ets fort perquè"
	line "creus en els teus"
	cont "#MON."
	done

Route11SignText:
	text "RUTA 11"
	done

Route11_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event  3,  7, BGEVENT_READ, Route11Sign
	bg_event 32,  5, BGEVENT_ITEM, Route11HiddenRevive

	def_object_events
	object_event 22, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterOwen, -1
	object_event 20,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterJason, -1
	object_event 28,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicHerman, -1
	object_event  8,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicFidel, -1
	object_event 32,  2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route11FruitTree, -1
