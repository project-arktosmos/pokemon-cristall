	object_const_def
	const GOLDENRODUNDERGROUNDWAREHOUSE_ROCKET1
	const GOLDENRODUNDERGROUNDWAREHOUSE_ROCKET2
	const GOLDENRODUNDERGROUNDWAREHOUSE_ROCKET3
	const GOLDENRODUNDERGROUNDWAREHOUSE_GENTLEMAN
	const GOLDENRODUNDERGROUNDWAREHOUSE_POKE_BALL1
	const GOLDENRODUNDERGROUNDWAREHOUSE_POKE_BALL2
	const GOLDENRODUNDERGROUNDWAREHOUSE_POKE_BALL3

GoldenrodUndergroundWarehouse_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, GoldenrodUndergroundWarehouseResetSwitchesCallback

GoldenrodUndergroundWarehouseResetSwitchesCallback:
	clearevent EVENT_SWITCH_1
	clearevent EVENT_SWITCH_2
	clearevent EVENT_SWITCH_3
	clearevent EVENT_EMERGENCY_SWITCH
	clearevent EVENT_SWITCH_4
	clearevent EVENT_SWITCH_5
	clearevent EVENT_SWITCH_6
	clearevent EVENT_SWITCH_7
	clearevent EVENT_SWITCH_8
	clearevent EVENT_SWITCH_9
	clearevent EVENT_SWITCH_10
	clearevent EVENT_SWITCH_11
	clearevent EVENT_SWITCH_12
	clearevent EVENT_SWITCH_13
	clearevent EVENT_SWITCH_14
	setval 0
	writemem wUndergroundSwitchPositions
	endcallback

TrainerGruntM24:
	trainer GRUNTM, GRUNTM_24, EVENT_BEAT_ROCKET_GRUNTM_24, GruntM24SeenText, GruntM24BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM24AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM14:
	trainer GRUNTM, GRUNTM_14, EVENT_BEAT_ROCKET_GRUNTM_14, GruntM14SeenText, GruntM14BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM14AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM15:
	trainer GRUNTM, GRUNTM_15, EVENT_BEAT_ROCKET_GRUNTM_15, GruntM15SeenText, GruntM15BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM15AfterBattleText
	waitbutton
	closetext
	end

GoldenrodUndergroundWarehouseDirectorScript:
	faceplayer
	opentext
	checkevent EVENT_RECEIVED_CARD_KEY
	iftrue .GotCardKey
	writetext DirectorIntroText
	promptbutton
	verbosegiveitem CARD_KEY
	setevent EVENT_RECEIVED_CARD_KEY
	setevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_1
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_2
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_3
	writetext DirectorCardKeyText
	promptbutton
.GotCardKey:
	writetext DirectorAfterText
	waitbutton
	closetext
	end

GoldenrodUndergroundWarehouseMaxEther:
	itemball MAX_ETHER

GoldenrodUndergroundWarehouseTMSleepTalk:
	itemball TM_SLEEP_TALK

GoldenrodUndergroundWarehouseUltraBall:
	itemball ULTRA_BALL

GruntM24SeenText:
	text "Com has arribat"
	line "fins aquí?"

	para "No hi ha remei."
	line "M'encarregaré"
	cont "de tu."
	done

GruntM24BeatenText:
	text "M'han liquidat…"
	done

GruntM24AfterBattleText:
	text "L'EQUIP ROCKET"
	line "continuarà espe-"
	cont "rant el retorn"
	cont "de GIOVANNI."

	para "Farem el que"
	line "calgui."
	done

GruntM14SeenText:
	text "No passaràs"
	line "d'aquí!"

	para "No tinc pietat"
	line "dels enemics, ni"
	cont "dels marrecs!"
	done

GruntM14BeatenText:
	text "Maleït siguis!"
	done

GruntM14AfterBattleText:
	text "He perdut…"

	para "Perdona'm,"
	line "GIOVANNI!"
	done

GruntM15SeenText:
	text "Rac-rac-rac!"
	line "Et recordo!"

	para "Em vas guanyar"
	line "al nostre"
	cont "amagatall!"
	done

GruntM15BeatenText:
	text "Rac-rac-rac!"
	line "Així doncs?"
	done

GruntM15AfterBattleText:
	text "Rac-rac-rac!"
	line "Ha estat divertit!"
	cont "Em recordaré de"
	cont "tu!"
	done

DirectorIntroText:
	text "DIRECTOR: Qui?"
	line "Què? Has vingut"
	cont "a rescatar-me?"

	para "Gràcies!"

	para "La TORRE DE RÀDIO!"

	para "Què hi passa?"

	para "L'EQUIP ROCKET"
	line "l'ha pres?"

	para "Té. Pren aquesta"
	line "TARGETA CLAU."
	done

DirectorCardKeyText:
	text "DIRECTOR: Fes-la"
	line "servir per obrir"
	cont "les portes del 3r."
	done

DirectorAfterText:
	text "T'ho prego,"
	line "ajuda'ns."

	para "No se sap què"
	line "faran si contro-"

	para "len el trans-"
	line "missor."

	para "Podrien arribar a"
	line "controlar els"

	para "#MON amb un"
	line "senyal especial!"

	para "Ets l'únic a qui"
	line "puc demanar ajuda."

	para "Salva la TORRE"
	line "DE RÀDIO…"

	para "I tots els #MON"
	line "del país!"
	done

GoldenrodUndergroundWarehouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 12, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 2
	warp_event  3, 12, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 3
	warp_event 17,  2, GOLDENROD_DEPT_STORE_B1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  8, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM24, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM14, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerGruntM15, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodUndergroundWarehouseDirectorScript, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 18, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundWarehouseMaxEther, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_MAX_ETHER
	object_event 13,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundWarehouseTMSleepTalk, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_TM_SLEEP_TALK
	object_event  2,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundWarehouseUltraBall, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_ULTRA_BALL
