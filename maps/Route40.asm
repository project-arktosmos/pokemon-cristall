	object_const_def
	const ROUTE40_OLIVINE_RIVAL1
	const ROUTE40_OLIVINE_RIVAL2
	const ROUTE40_SWIMMER_GIRL1
	const ROUTE40_SWIMMER_GIRL2
	const ROUTE40_ROCK1
	const ROUTE40_ROCK2
	const ROUTE40_ROCK3
	const ROUTE40_LASS1
	const ROUTE40_MONICA
	const ROUTE40_POKEFAN_M
	const ROUTE40_LASS2
	const ROUTE40_STANDING_YOUNGSTER

Route40_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route40MonicaCallback

Route40MonicaCallback:
	clearevent EVENT_BATTLE_TOWER_OPEN_CIVILIANS
	readvar VAR_WEEKDAY
	ifequal MONDAY, .MonicaAppears
	disappear ROUTE40_MONICA
	endcallback

.MonicaAppears:
	appear ROUTE40_MONICA
	endcallback

TrainerSwimmerfElaine:
	trainer SWIMMERF, ELAINE, EVENT_BEAT_SWIMMERF_ELAINE, SwimmerfElaineSeenText, SwimmerfElaineBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfElaineAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfPaula:
	trainer SWIMMERF, PAULA, EVENT_BEAT_SWIMMERF_PAULA, SwimmerfPaulaSeenText, SwimmerfPaulaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfPaulaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermSimon:
	trainer SWIMMERM, SIMON, EVENT_BEAT_SWIMMERM_SIMON, SwimmermSimonSeenText, SwimmermSimonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermSimonAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermRandall:
	trainer SWIMMERM, RANDALL, EVENT_BEAT_SWIMMERM_RANDALL, SwimmermRandallSeenText, SwimmermRandallBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermRandallAfterBattleText
	waitbutton
	closetext
	end

Route40Lass1Script:
	jumptextfaceplayer Route40Lass1Text

Route40PokefanMScript:
	special CheckMobileAdapterStatusSpecial
	iftrue .mobile
	jumptextfaceplayer Route40PokefanMText

.mobile
	jumptextfaceplayer Route40PokefanMText_Mobile

Route40Lass2Script:
	jumptextfaceplayer Route40Lass2Text

Route40StandingYoungsterScript:
	jumptextfaceplayer Route40StandingYoungsterText

MonicaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	iftrue .Monday
	readvar VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checkevent EVENT_MET_MONICA_OF_MONDAY
	iftrue .MetMonica
	writetext MeetMonicaText
	promptbutton
	setevent EVENT_MET_MONICA_OF_MONDAY
.MetMonica:
	writetext MonicaGivesGiftText
	promptbutton
	verbosegiveitem SHARP_BEAK
	iffalse .done
	setevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	writetext MonicaGaveGiftText
	waitbutton
	closetext
	end

.Monday:
	writetext MonicaMondayText
	waitbutton
.done:
	closetext
	end

.NotMonday:
	writetext MonicaNotMondayText
	waitbutton
	closetext
	end

Route40Sign:
	jumptext Route40SignText

Route40Rock:
	jumpstd SmashRockScript

Route40HiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ROUTE_40_HIDDEN_HYPER_POTION

Route40_StepRightUp6Movement: ; unreferenced
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

Route40_StepUp5Movement: ; unreferenced
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

Route40_StepUp4Movement: ; unreferenced
	step UP
	step UP
	step UP
	step UP
	step_end

SwimmermSimonSeenText:
	text "Has d'escalfar"
	line "abans d'entrar"
	cont "a l'aigua."

	para "És bàsic."
	done

SwimmermSimonBeatenText:
	text "D'acord! Em rendo!"
	done

SwimmermSimonAfterBattleText:
	text "CIANWOOD CITY és"
	line "bastant lluny"
	cont "d'aquí."
	done

SwimmermRandallSeenText:
	text "Ei, ets jove i"
	line "estàs en forma!"

	para "No muntis el teu"
	line "#MON! Neda!"
	done

SwimmermRandallBeatenText:
	text "Oh, no. He perdut…"
	done

SwimmermRandallAfterBattleText:
	text "Nedar exercita"
	line "tot el cos."
	cont "És saludable."
	done

SwimmerfElaineSeenText:
	text "Vas a CIANWOOD?"

	para "Què tal un combat"
	line "ràpid primer?"
	done

SwimmerfElaineBeatenText:
	text "He perdut!"
	done

SwimmerfElaineAfterBattleText:
	text "Jo diria que sóc"
	line "millor nedadora"
	cont "que tu. Sí!"
	done

SwimmerfPaulaSeenText:
	text "Jo no porto"
	line "flotador."

	para "M'agafo a un"
	line "#MON marí!"
	done

SwimmerfPaulaBeatenText:
	text "Oh, estic"
	line "marejada!"
	done

SwimmerfPaulaAfterBattleText:
	text "Mentre floto així,"
	line "les onades"
	cont "m'arrosseguen."
	done

Route40Lass1Text:
	text "Tot i que no ho"
	line "pots veure d'aquí,"

	para "CIANWOOD és a"
	line "l'altre costat."
	done

Route40PokefanMText:
	text "Hm! Hi ha un gran"
	line "edifici endavant!"

	para "Què és?"
	done

Route40PokefanMText_Mobile:
	text "Hm! Mira tots"
	line "aquests entrena-"
	cont "dors tan seriosos"
	cont "que hi entren."

	para "Què? Què?"
	done

Route40Lass2Text:
	text "Vaig venir a"
	line "OLIVINE en vaixell"

	para "per veure llocs i"
	line "gaudir l'ambient."

	para "Com que és port,"
	line "és molt diferent"
	cont "d'una gran ciutat."
	done

Route40StandingYoungsterText:
	text "Has anat a la"
	line "TORRE BATALLA?"

	para "Crec que molts"
	line "entrenadors forts"

	para "ja s'hi han"
	line "reunit."

	para "Però com que tens"
	line "tantes MEDALLES,"

	para "no t'hauria d'anar"
	line "gens malament."
	done

MeetMonicaText:
	text "MONICA: Encantada"
	line "de conèixer-te."

	para "Sóc la MONICA,"
	line "la del dilluns."
	done

MonicaGivesGiftText:
	text "Com a mostra de la"
	line "nostra amistat,"
	cont "tinc un regal!"
	done

MonicaGaveGiftText:
	text "MONICA: És un"
	line "objecte que puja"

	para "el poder dels"
	line "atacs de vol."

	para "Hauries d'equipar"
	line "un #MON ocell"
	cont "amb això."
	done

MonicaMondayText:
	text "MONICA: Els meus"
	line "germans i germanes"

	para "són per tot"
	line "arreu."

	para "A veure si pots"
	line "trobar-los a tots!"
	done

MonicaNotMondayText:
	text "MONICA: No crec"
	line "que avui sigui"
	cont "dilluns. Quina…"
	done

Route40SignText:
	text "RUTA 40"

	para "CIANWOOD CITY -"
	line "OLIVINE CITY"
	done

Route40_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  5, ROUTE_40_BATTLE_TOWER_GATE, 1

	def_coord_events

	def_bg_events
	bg_event 14, 10, BGEVENT_READ, Route40Sign
	bg_event  7,  8, BGEVENT_ITEM, Route40HiddenHyperPotion

	def_object_events
	object_event 14, 15, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermSimon, -1
	object_event 18, 30, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerSwimmermRandall, -1
	object_event  3, 19, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfElaine, -1
	object_event 10, 25, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfPaula, -1
	object_event  7, 11, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event  6,  9, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event  7,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event 11, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Lass1Script, -1
	object_event  8, 10, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MonicaScript, EVENT_ROUTE_40_MONICA_OF_MONDAY
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40PokefanMScript, -1
	object_event 13,  4, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40Lass2Script, -1
	object_event 16,  9, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route40StandingYoungsterScript, EVENT_BATTLE_TOWER_OPEN_CIVILIANS
