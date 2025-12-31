object_const_def
const ROUTE1_YOUNGSTER
const ROUTE1_COOLTRAINER_F
const ROUTE1_FRUIT_TREE

Route1_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerSchoolboyDanny:
	trainer SCHOOLBOY, DANNY, EVENT_BEAT_SCHOOLBOY_DANNY, SchoolboyDannySeenText, SchoolboyDannyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyDannyAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfQuinn:
	trainer COOLTRAINERF, QUINN, EVENT_BEAT_COOLTRAINERF_QUINN, CooltrainerfQuinnSeenText, CooltrainerfQuinnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfQuinnAfterBattleText
	waitbutton
	closetext
	end

Route1Sign:
	jumptext Route1SignText

Route1FruitTree:
	fruittree FRUITTREE_ROUTE_1

SchoolboyDannySeenText:
	text "Si dos entrenadors"
	line "es troben, el més"
	cont "normal és lluitar."
	done

SchoolboyDannyBeatenText:
	text "Oh no… Tinc més"
	line "derrotes que no"
	cont "pas victòries…"
	done

SchoolboyDannyAfterBattleText:
	text "Per als"
	line "entrenadors, és"

	para "normal lluitar"
	line "quan ens trobem."
	done

CooltrainerfQuinnSeenText:
	text "Tu, aquí!"
	line "Vols lluitar?"
	done

CooltrainerfQuinnBeatenText:
	text "Estic feta pols…"
	done

CooltrainerfQuinnAfterBattleText:
	text "Ets molt fort."

	para "És evident que"
	line "has entrenat molt."
	done

Route1SignText:
	text "RUTA 1"

	para "POBLE PALETA -"
	line "CIUTAT VIRIDIANA"
	done

Route1_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event  7, 27, BGEVENT_READ, Route1Sign

	def_object_events
	object_event  4, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSchoolboyDanny, -1
	object_event  9, 25, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfQuinn, -1
	object_event  3,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route1FruitTree, -1
