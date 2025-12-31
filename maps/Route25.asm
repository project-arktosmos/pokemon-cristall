	object_const_def
	const ROUTE25_MISTY
	const ROUTE25_COOLTRAINER_M1
	const ROUTE25_YOUNGSTER1
	const ROUTE25_LASS1
	const ROUTE25_YOUNGSTER2
	const ROUTE25_LASS2
	const ROUTE25_YOUNGSTER3
	const ROUTE25_LASS3
	const ROUTE25_SUPER_NERD
	const ROUTE25_COOLTRAINER_M2
	const ROUTE25_POKE_BALL

Route25_MapScripts:
	def_scene_scripts
	scene_script Route25Noop1Scene, SCENE_ROUTE25_NOOP
	scene_script Route25Noop2Scene, SCENE_ROUTE25_MISTYS_DATE

	def_callbacks

Route25Noop1Scene:
	end

Route25Noop2Scene:
	end

Route25MistyDate1Script:
	showemote EMOTE_HEART, ROUTE25_MISTY, 15
	pause 30
	showemote EMOTE_SHOCK, ROUTE25_COOLTRAINER_M1, 10
	turnobject ROUTE25_MISTY, DOWN
	applymovement ROUTE25_COOLTRAINER_M1, Route25MistysDateLeavesMovement1
	disappear ROUTE25_COOLTRAINER_M1
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	turnobject ROUTE25_MISTY, UP
	pause 10
	applymovement ROUTE25_MISTY, Route25MistyApproachesPlayerMovement1
	opentext
	writetext Route25MistyDateText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement ROUTE25_MISTY, Route25MistyLeavesPlayerMovement1
	turnobject PLAYER, LEFT
	applymovement ROUTE25_MISTY, Route25MistyLeavesMovement
	disappear ROUTE25_MISTY
	clearevent EVENT_TRAINERS_IN_CERULEAN_GYM
	setscene SCENE_ROUTE25_NOOP
	special RestartMapMusic
	end

Route25MistyDate2Script:
	showemote EMOTE_HEART, ROUTE25_MISTY, 15
	pause 30
	showemote EMOTE_SHOCK, ROUTE25_COOLTRAINER_M1, 10
	turnobject ROUTE25_MISTY, DOWN
	applymovement ROUTE25_COOLTRAINER_M1, Route25MistysDateLeavesMovement2
	disappear ROUTE25_COOLTRAINER_M1
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	turnobject ROUTE25_MISTY, UP
	pause 10
	applymovement ROUTE25_MISTY, Route25MistyApproachesPlayerMovement2
	opentext
	writetext Route25MistyDateText
	waitbutton
	closetext
	turnobject PLAYER, UP
	applymovement ROUTE25_MISTY, Route25MistyLeavesPlayerMovement2
	turnobject PLAYER, LEFT
	applymovement ROUTE25_MISTY, Route25MistyLeavesMovement
	disappear ROUTE25_MISTY
	clearevent EVENT_TRAINERS_IN_CERULEAN_GYM
	setscene SCENE_ROUTE25_NOOP
	special RestartMapMusic
	end

TrainerSchoolboyDudley:
	trainer SCHOOLBOY, DUDLEY, EVENT_BEAT_SCHOOLBOY_DUDLEY, SchoolboyDudleySeenText, SchoolboyDudleyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyDudleyAfterBattleText
	waitbutton
	closetext
	end

TrainerLassEllen:
	trainer LASS, ELLEN, EVENT_BEAT_LASS_ELLEN, LassEllenSeenText, LassEllenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassEllenAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyJoe:
	trainer SCHOOLBOY, JOE, EVENT_BEAT_SCHOOLBOY_JOE, SchoolboyJoeSeenText, SchoolboyJoeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyJoeAfterBattleText
	waitbutton
	closetext
	end

TrainerLassLaura:
	trainer LASS, LAURA, EVENT_BEAT_LASS_LAURA, LassLauraSeenText, LassLauraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassLauraAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperLloyd:
	trainer CAMPER, LLOYD, EVENT_BEAT_CAMPER_LLOYD, CamperLloydSeenText, CamperLloydBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperLloydAfterBattleText
	waitbutton
	closetext
	end

TrainerLassShannon:
	trainer LASS, SHANNON, EVENT_BEAT_LASS_SHANNON, LassShannonSeenText, LassShannonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassShannonAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdPat:
	trainer SUPER_NERD, PAT, EVENT_BEAT_SUPER_NERD_PAT, SupernerdPatSeenText, SupernerdPatBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdPatAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermKevin:
	faceplayer
	opentext
	checkevent EVENT_BEAT_COOLTRAINERM_KEVIN
	iftrue .AfterBattle
	checkevent EVENT_CLEARED_NUGGET_BRIDGE
	iftrue .AfterNuggetBridge
	writetext CooltrainermKevinNuggetText
	promptbutton
	verbosegiveitem NUGGET
	iffalse .NoRoomForNugget
	setevent EVENT_CLEARED_NUGGET_BRIDGE
.AfterNuggetBridge:
	writetext CooltrainermKevinSeenText
	waitbutton
	closetext
	winlosstext CooltrainermKevinBeatenText, 0
	loadtrainer COOLTRAINERM, KEVIN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERM_KEVIN
	opentext
.AfterBattle:
	writetext CooltrainermKevinAfterBattleText
	waitbutton
.NoRoomForNugget:
	closetext
	end

BillsHouseSign:
	jumptext BillsHouseSignText

Route25Protein:
	itemball PROTEIN

Route25HiddenPotion:
	hiddenitem POTION, EVENT_ROUTE_25_HIDDEN_POTION

Route25MistysDateLeavesMovement1:
	big_step DOWN
	step_end

Route25MistysDateLeavesMovement2:
	big_step DOWN
	big_step DOWN
	step_end

Route25MistyApproachesPlayerMovement1:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end

Route25MistyApproachesPlayerMovement2:
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end

Route25MistyLeavesPlayerMovement1:
	step DOWN
	step LEFT
	step_end

Route25MistyLeavesPlayerMovement2:
	step UP
	step LEFT
	step_end

Route25MistyLeavesMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

Route25MistyDateText:
	text "MISTY: Oh! Per"
	line "què has hagut de"

	para "venir a molestar-"
	line "nos ara?"

	para "Saps com en diuen"
	line "de la gent com tu?"

	para "Pesats! M'has"
	line "sentit bé, pesat!"

	para "…"

	para "…Oh? Aquestes"
	line "MEDALLES… Són"
	cont "MEDALLES de JOHTO?"

	para "Si en tens vuit,"
	line "deus ser bo."

	para "D'acord. Vine al"
	line "GIMNÀS CERULEAN."

	para "Estaré encantada"
	line "de combatre."

	para "Sóc MISTY, la"
	line "LÍDER DE GIMNÀS"
	cont "de CERULEAN."
	done

SchoolboyDudleySeenText:
	text "Venç els sis"
	line "entrenadors per"
	cont "guanyar un premi!"

	para "Creus que tens el"
	line "que cal?"
	done

SchoolboyDudleyBeatenText:
	text "Uau! Ben fet."
	done

SchoolboyDudleyAfterBattleText:
	text "Ho he donat tot."
	line "No em penedeixo."
	done

LassEllenSeenText:
	text "Sóc la segona."
	line "Ara va de debò!"
	done

LassEllenBeatenText:
	text "Com he pogut"
	line "perdre?"
	done

LassEllenAfterBattleText:
	text "Ho he donat tot."
	line "No em penedeixo."
	done

SchoolboyJoeSeenText:
	text "Aquí ve el núm.3!"
	line "No serà fàcil."
	done

SchoolboyJoeBeatenText:
	text "Au! M'has aixafat!"
	done

SchoolboyJoeAfterBattleText:
	text "Ho he donat tot."
	line "No em penedeixo."
	done

LassLauraSeenText:
	text "Sóc la núm. 4!"
	line "Estàs cansat?"
	done

LassLauraBeatenText:
	text "Jo també he"
	line "perdut…"
	done

LassLauraAfterBattleText:
	text "Ho he donat tot."
	line "No em penedeixo."
	done

CamperLloydSeenText:
	text "OK! Sóc el núm.5."
	line "T'aixafaré!"
	done

CamperLloydBeatenText:
	text "Uau! Massa fort."
	done

CamperLloydAfterBattleText:
	text "Ho he donat tot."
	line "No em penedeixo."
	done

LassShannonSeenText:
	text "Sóc l'última de"
	line "la fila, però"
	cont "sóc dura!"
	done

LassShannonBeatenText:
	text "No pot ser."
	done

LassShannonAfterBattleText:
	text "Ho he donat tot."
	line "No em penedeixo."
	done

SupernerdPatSeenText:
	text "Mufufufu…"

	para "Jo no tinc res a"
	line "veure amb els sis"
	cont "entrenadors."

	para "He esperat aquí"
	line "per vèncer-te"

	para "quan estiguessis"
	line "cansat de lluitar."
	done

SupernerdPatBeatenText:
	text "No estàs gens"
	line "cansat?"
	done

SupernerdPatAfterBattleText:
	text "Perdona… No faré"
	line "més trampes…"
	done

CooltrainermKevinNuggetText:
	text "Has fet un combat"
	line "més del que"

	para "esperaves, però"
	line "has guanyat igual."

	para "Com vam prometre,"
	line "aquí tens el premi"
	done

CooltrainermKevinSeenText:
	text "Però veient com"
	line "lluites, vull"

	para "saber com m'anirà"
	line "a mi."

	para "Què me'n dius?"
	line "Deixa'm combatre."
	done

CooltrainermKevinBeatenText:
	text "Mai no havia fet"
	line "un combat així!"
	done

CooltrainermKevinAfterBattleText:
	text "Ha estat un gran"
	line "combat!"

	para "Tu i els teus"
	line "#-"
	cont "MON sou realment"
	cont "excepcionals!"
	done

BillsHouseSignText:
	text "CASETA DEL MAR"
	line "CASA D'EN BILL"
	done

UnusedBillsHouseSignText: ; unreferenced
	text "CASA D'EN BILL"
	done

Route25_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 47,  5, BILLS_HOUSE, 1

	def_coord_events
	coord_event 42,  6, SCENE_ROUTE25_MISTYS_DATE, Route25MistyDate1Script
	coord_event 42,  7, SCENE_ROUTE25_MISTYS_DATE, Route25MistyDate2Script

	def_bg_events
	bg_event 45,  5, BGEVENT_READ, BillsHouseSign
	bg_event  4,  5, BGEVENT_ITEM, Route25HiddenPotion

	def_object_events
	object_event 46,  9, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_25_MISTY_BOYFRIEND
	object_event 46, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_25_MISTY_BOYFRIEND
	object_event 12,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyDudley, -1
	object_event 16, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassEllen, -1
	object_event 21,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyJoe, -1
	object_event 22,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassLaura, -1
	object_event 25,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperLloyd, -1
	object_event 28, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassShannon, -1
	object_event 31,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerSupernerdPat, -1
	object_event 37,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerCooltrainermKevin, -1
	object_event 32,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route25Protein, EVENT_ROUTE_25_PROTEIN
