	object_const_def
	const RADIOTOWER3F_SUPER_NERD
	const RADIOTOWER3F_GYM_GUIDE
	const RADIOTOWER3F_COOLTRAINER_F
	const RADIOTOWER3F_ROCKET1
	const RADIOTOWER3F_ROCKET2
	const RADIOTOWER3F_ROCKET3
	const RADIOTOWER3F_SCIENTIST

RadioTower3F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, RadioTower3FCardKeyShutterCallback

RadioTower3FCardKeyShutterCallback:
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .Change
	endcallback

.Change:
	changeblock 14, 2, $2a ; open shutter
	changeblock 14, 4, $01 ; floor
	endcallback

RadioTower3FSuperNerdScript:
	jumptextfaceplayer RadioTower3FSuperNerdText

RadioTower3FGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoRockets
	writetext RadioTower3FGymGuideText_Rockets
	waitbutton
	closetext
	end

.NoRockets:
	writetext RadioTower3FGymGuideText
	waitbutton
	closetext
	end

RadioTower3FCooltrainerFScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SUNNY_DAY_FROM_RADIO_TOWER
	iftrue .GotSunnyDay
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoRockets
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .UsedCardKey
	writetext RadioTower3FCooltrainerFPleaseSaveDirectorText
	waitbutton
	closetext
	end

.UsedCardKey:
	writetext RadioTower3FCooltrainerFIsDirectorSafeText
	waitbutton
	closetext
	end

.NoRockets:
	writetext RadioTower3FCooltrainerFYoureMyHeroText
	promptbutton
	verbosegiveitem TM_SUNNY_DAY
	iffalse .NoRoom
	writetext RadioTower3FCooltrainerFItsSunnyDayText
	waitbutton
	closetext
	setevent EVENT_GOT_SUNNY_DAY_FROM_RADIO_TOWER
	end

.GotSunnyDay:
	writetext RadioTower3FCooltrainerFYouWereMarvelousText
	waitbutton
.NoRoom:
	closetext
	end

TrainerGruntM7:
	trainer GRUNTM, GRUNTM_7, EVENT_BEAT_ROCKET_GRUNTM_7, GruntM7SeenText, GruntM7BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM7AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM8:
	trainer GRUNTM, GRUNTM_8, EVENT_BEAT_ROCKET_GRUNTM_8, GruntM8SeenText, GruntM8BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM8AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM9:
	trainer GRUNTM, GRUNTM_9, EVENT_BEAT_ROCKET_GRUNTM_9, GruntM9SeenText, GruntM9BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM9AfterBattleText
	waitbutton
	closetext
	end

TrainerScientistMarc:
	trainer SCIENTIST, MARC, EVENT_BEAT_SCIENTIST_MARC, ScientistMarcSeenText, ScientistMarcBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistMarcAfterBattleText
	waitbutton
	closetext
	end

CardKeySlotScript::
	opentext
	writetext RadioTower3FCardKeySlotText
	waitbutton
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .UsedCardKey
	checkitem CARD_KEY
	iftrue .HaveCardKey
.UsedCardKey:
	closetext
	end

.HaveCardKey:
	writetext InsertedTheCardKeyText
	waitbutton
	setevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	playsound SFX_ENTER_DOOR
	changeblock 14, 2, $2a ; open shutter
	changeblock 14, 4, $01 ; floor
	refreshmap
	closetext
	waitsfx
	end

RadioTower3FPersonnelSign:
	jumptext RadioTower3FPersonnelSignText

RadioTower3FPokemonMusicSign:
	jumptext RadioTower3FPokemonMusicSignText

RadioTower3FSuperNerdText:
	text "Tenim enregistra-"
	line "ments dels crits"

	para "de tots els"
	line "#MON"
	cont "que hem trobat."

	para "En devem tenir"
	line "unes 200 classes."
	done

RadioTower3FGymGuideText_Rockets:
	text "Pels entrenadors,"
	line "els #MON són"
	cont "companys estimats."

	para "És terrible com"
	line "l'EQUIP ROCKET"

	para "intenta controlar"
	line "els #MON."
	done

RadioTower3FGymGuideText:
	text "Emetem les 24"
	line "hores del dia"

	para "programes entre-"
	line "tinguts."

	para "Faré tot el que"
	line "pugui per seguir"
	cont "el ritme!"
	done

RadioTower3FCooltrainerFPleaseSaveDirectorText:
	text "El cap de l'EQUIP"
	line "ROCKET s'ha"
	cont "tancat a dins."

	para "Però el DIRECTOR"
	line "pot obrir-ho."

	para "És al cinquè pis."

	para "Si us plau,"
	line "salva'l!"
	done

RadioTower3FCooltrainerFIsDirectorSafeText:
	text "El DIRECTOR està"
	line "bé?"
	done

RadioTower3FCooltrainerFYoureMyHeroText:
	text "Gràcies!"
	line "Ets el meu heroi!"

	para "Això és una mostra"
	line "del meu agraïment."
	done

RadioTower3FCooltrainerFItsSunnyDayText:
	text "És SUNNY DAY."
	line "Potencia els atacs"
	cont "de tipus foc"
	cont "una estona."
	done

RadioTower3FCooltrainerFYouWereMarvelousText:
	text "Has estat"
	line "meravellós!"
	done

GruntM7SeenText:
	text "Tinc ordres"
	line "estrictes."

	para "He d'esclafar"
	line "qualsevol que"
	cont "desafiï l'EQUIP"
	cont "ROCKET!"
	done

GruntM7BeatenText:
	text "Què?!"
	done

GruntM7AfterBattleText:
	text "He fallat en les"
	line "meves tasques…"

	para "Em descomptaran"
	line "del sou…"
	done

GruntM8SeenText:
	text "És genial ordenar"
	line "als #MON que"
	cont "cometin crims."
	done

GruntM8BeatenText:
	text "Estàs de broma!"
	done

GruntM8AfterBattleText:
	text "Em sento fatal"
	line "per haver perdut!"

	para "Renoi! Odio els"
	line "#MON inútils!"
	done

GruntM9SeenText:
	text "Per què s'ha"
	line "obert la persiana?"

	para "Hi tens alguna"
	line "cosa a veure?"
	done

GruntM9BeatenText:
	text "Estic acabat!"
	done

GruntM9AfterBattleText:
	text "Què?! Has passat"
	line "per sobre dels"
	cont "nostres homes al"
	cont "SOTERRANI?"

	para "Com has pogut?"
	done

ScientistMarcSeenText:
	text "Un nen desconegut"
	line "voltant per aquí?"

	para "Qui ets?"
	done

ScientistMarcBeatenText:
	text "Tsk! T'he"
	line "subestimat!"
	done

ScientistMarcAfterBattleText:
	text "Bwahahaha…"

	para "Puc transmetre un"
	line "senyal tan potent"
	cont "com calgui des"
	cont "d'aquí."
	done

RadioTower3FCardKeySlotText:
	text "És la ranura de"
	line "la CLAU TARGETA."
	done

InsertedTheCardKeyText:
	text "<PLAYER> ha"
	line "inserit la CLAU"
	cont "TARGETA."
	done

RadioTower3FPersonnelSignText:
	text "3r PERSONAL"
	done

RadioTower3FPokemonMusicSignText:
	text "MÚSICA #MON amb"
	line "el DJ BEN"
	done

RadioTower3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_2F, 1
	warp_event  7,  0, RADIO_TOWER_4F, 2
	warp_event 17,  0, RADIO_TOWER_4F, 4

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, RadioTower3FPersonnelSign
	bg_event  9,  0, BGEVENT_READ, RadioTower3FPokemonMusicSign
	bg_event 14,  2, BGEVENT_UP, CardKeySlotScript

	def_object_events
	object_event  7,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower3FSuperNerdScript, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  3,  4, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower3FGymGuideScript, -1
	object_event 11,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower3FCooltrainerFScript, -1
	object_event  5,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM7, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM8, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 16,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM9, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  9,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerScientistMarc, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
