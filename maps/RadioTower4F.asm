	object_const_def
	const RADIOTOWER4F_FISHER
	const RADIOTOWER4F_TEACHER
	const RADIOTOWER4F_GROWLITHE
	const RADIOTOWER4F_ROCKET1
	const RADIOTOWER4F_ROCKET2
	const RADIOTOWER4F_ROCKET_GIRL
	const RADIOTOWER4F_SCIENTIST

RadioTower4F_MapScripts:
	def_scene_scripts

	def_callbacks

RadioTower4FFisherScript:
	jumptextfaceplayer RadioTower4FFisherText

RadioTower4FDJMaryScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW_FROM_MARY
	iftrue .GotPinkBow
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRockets
	writetext RadioTower4FDJMaryText
	waitbutton
	closetext
	end

.ClearedRockets:
	writetext RadioTower4FDJMaryText_ClearedRockets
	promptbutton
	verbosegiveitem PINK_BOW
	iffalse .NoRoom
	writetext RadioTower4FDJMaryText_GivePinkBow
	waitbutton
	closetext
	setevent EVENT_GOT_PINK_BOW_FROM_MARY
	end

.GotPinkBow:
	writetext RadioTower4FDJMaryText_After
	waitbutton
.NoRoom:
	closetext
	end

RadioTowerMeowth:
	opentext
	writetext RadioTowerMeowthText
	cry MEOWTH
	waitbutton
	closetext
	end

TrainerGruntM10:
	trainer GRUNTM, GRUNTM_10, EVENT_BEAT_ROCKET_GRUNTM_10, GruntM10SeenText, GruntM10BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM10AfterBattleText
	waitbutton
	closetext
	end

TrainerExecutivem2:
	trainer EXECUTIVEM, EXECUTIVEM_2, EVENT_BEAT_ROCKET_EXECUTIVEM_2, Executivem2SeenText, Executivem2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Executivem2AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF4:
	trainer GRUNTF, GRUNTF_4, EVENT_BEAT_ROCKET_GRUNTF_4, GruntF4SeenText, GruntF4BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF4AfterBattleText
	waitbutton
	closetext
	end

TrainerScientistRich:
	trainer SCIENTIST, RICH, EVENT_BEAT_SCIENTIST_RICH, ScientistRichSeenText, ScientistRichBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistRichAfterBattleText
	waitbutton
	closetext
	end

RadioTower4FProductionSign:
	jumptext RadioTower4FProductionSignText

RadioTower4FStudio2Sign:
	jumptext RadioTower4FStudio2SignText

RadioTower4FFisherText:
	text "Escoltava la ràdio"
	line "mentre era a les"
	cont "RUÏNES."

	para "Hi vaig sentir una"
	line "emissió estranya."
	done

RadioTower4FDJMaryText:
	text "MARY: Per què? Per"
	line "què he de patir"
	cont "tot això?"

	para "MEOWTH, ajuda'm!"
	done

RadioTower4FDJMaryText_ClearedRockets:
	text "MARY: Oh! Ets el"
	line "meu petit"
	cont "salvador!"

	para "Acceptes això com"
	line "a agraïment?"
	done

RadioTower4FDJMaryText_GivePinkBow:
	text "MARY: És perfecte"
	line "per a # que"

	para "sàpiguen moviments"
	line "de tipus normal."
	done

RadioTower4FDJMaryText_After:
	text "MARY: Escolta'm a"
	line "l'espai del PROF."

	para "OAK sobre #MON,"
	line "si us plau."
	done

RadioTowerMeowthText:
	text "MEOWTH: Meowth…"
	done

GruntM10SeenText:
	text "Vols rescatar el"
	line "DIRECTOR?"

	para "No serà possible"
	line "perquè et"
	cont "derrotaré!"
	done

GruntM10BeatenText:
	text "No! Increïble!"
	done

GruntM10AfterBattleText:
	text "No m'ho crec!"
	line "M'han derrotat!"
	done

Executivem2SeenText:
	text "Para! Soc conegut"
	line "com la fortalesa"
	cont "del TEAM ROCKET!"

	para "No faràs ni un"
	line "pas més!"
	done

Executivem2BeatenText:
	text "La fortalesa ha"
	line "caigut!"
	done

Executivem2AfterBattleText:
	text "T'has guanyat el"
	line "meu respecte, així"
	cont "que un consell."

	para "No és tard. Encara"
	line "pots tornar"
	cont "enrere."
	done

GruntF4SeenText:
	text "Que si trobo els"
	line "# bonics?"

	para "Trobaré els meus"
	line "# bonics…"

	para "quan hagin"
	line "derrotat els teus!"
	done

GruntF4BeatenText:
	text "Oh, no! Són tan"
	line "inútils!"
	done

GruntF4AfterBattleText:
	text "M'estimo a mi"
	line "mateixa!"

	para "Què m'importen"
	line "els #MON?"
	done

ScientistRichSeenText:
	text "Excel·lent."

	para "Aquesta TORRE DE"
	line "RÀDIO complirà el"
	cont "nostre gran pla."
	done

ScientistRichBeatenText:
	text "Hmmm…"

	para "Els grans plans"
	line "tenen obstacles."
	done

ScientistRichAfterBattleText:
	text "De veritat creus"
	line "que pots aturar"
	cont "el TEAM ROCKET?"
	done

RadioTower4FProductionSignText:
	text "4F PRODUCCIÓ"
	done

RadioTower4FStudio2SignText:
	text "4F ESTUDI 2"
	done

RadioTower4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_5F, 1
	warp_event  9,  0, RADIO_TOWER_3F, 2
	warp_event 12,  0, RADIO_TOWER_5F, 2
	warp_event 17,  0, RADIO_TOWER_3F, 3

	def_coord_events

	def_bg_events
	bg_event  7,  0, BGEVENT_READ, RadioTower4FProductionSign
	bg_event 15,  0, BGEVENT_READ, RadioTower4FStudio2Sign

	def_object_events
	object_event  6,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower4FFisherScript, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event 14,  6, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower4FDJMaryScript, -1
	object_event 12,  7, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTowerMeowth, -1
	object_event  5,  6, SPRITE_ROCKET, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM10, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerExecutivem2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerGruntF4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerScientistRich, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
