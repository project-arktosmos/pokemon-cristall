	object_const_def
	const FASTSHIPB1F_SAILOR1
	const FASTSHIPB1F_SAILOR2
	const FASTSHIPB1F_SAILOR3
	const FASTSHIPB1F_LASS
	const FASTSHIPB1F_SUPER_NERD
	const FASTSHIPB1F_SAILOR4
	const FASTSHIPB1F_FISHER
	const FASTSHIPB1F_BLACK_BELT
	const FASTSHIPB1F_SAILOR5
	const FASTSHIPB1F_TEACHER
	const FASTSHIPB1F_YOUNGSTER1
	const FASTSHIPB1F_YOUNGSTER2

FastShipB1F_MapScripts:
	def_scene_scripts
	scene_script FastShipB1FNoop1Scene, SCENE_FASTSHIPB1F_SAILOR_BLOCKS
	scene_script FastShipB1FNoop2Scene, SCENE_FASTSHIPB1F_NOOP

	def_callbacks

FastShipB1FNoop1Scene:
	end

FastShipB1FNoop2Scene:
	end

FastShipB1FSailorBlocksLeft:
	checkevent EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	iftrue FastShipB1FAlreadyBlocked
	applymovement FASTSHIPB1F_SAILOR2, FastShipB1FSailorBlocksLeftMovement
	moveobject FASTSHIPB1F_SAILOR1, 30, 6
	appear FASTSHIPB1F_SAILOR1
	pause 5
	disappear FASTSHIPB1F_SAILOR2
	end

FastShipB1FSailorBlocksRight:
	checkevent EVENT_FAST_SHIP_B1F_SAILOR_LEFT
	iftrue FastShipB1FAlreadyBlocked
	applymovement FASTSHIPB1F_SAILOR1, FastShipB1FSailorBlocksRightMovement
	moveobject FASTSHIPB1F_SAILOR2, 31, 6
	appear FASTSHIPB1F_SAILOR2
	pause 5
	disappear FASTSHIPB1F_SAILOR1
	end

FastShipB1FAlreadyBlocked:
	end

FastShipB1FSailorScript:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .FirstTime
	checkevent EVENT_FAST_SHIP_LAZY_SAILOR
	iftrue .LazySailor
	checkevent EVENT_FAST_SHIP_INFORMED_ABOUT_LAZY_SAILOR
	iftrue .AlreadyInformed
	writetext FastShipB1FOnDutySailorText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_INFORMED_ABOUT_LAZY_SAILOR
	clearevent EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	end

.AlreadyInformed:
	writetext FastShipB1FOnDutySailorRefusedText
	waitbutton
	closetext
	end

.LazySailor:
	writetext FastShipB1FOnDutySailorThanksText
	checkevent EVENT_FAST_SHIP_FOUND_GIRL
	iffalse .NotFoundGirl
	waitbutton
	closetext
	end

.NotFoundGirl:
	promptbutton
	writetext FastShipB1FOnDutySailorSawLittleGirlText
	waitbutton
	closetext
	end

.FirstTime:
	writetext FastShipB1FOnDutySailorDirectionsText
	waitbutton
	closetext
	end

TrainerSailorJeff:
	trainer SAILOR, JEFF, EVENT_BEAT_SAILOR_JEFF, SailorJeffSeenText, SailorJeffBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorJeffAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerDebra:
	trainer PICNICKER, DEBRA, EVENT_BEAT_PICNICKER_DEBRA, PicnickerDebraSeenText, PicnickerDebraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerDebraAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerFritz:
	trainer JUGGLER, FRITZ, EVENT_BEAT_JUGGLER_FRITZ, JugglerFritzSeenText, JugglerFritzBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerFritzAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorGarrett:
	trainer SAILOR, GARRETT, EVENT_BEAT_SAILOR_GARRETT, SailorGarrettSeenText, SailorGarrettBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorGarrettAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherJonah:
	trainer FISHER, JONAH, EVENT_BEAT_FISHER_JONAH, FisherJonahSeenText, FisherJonahBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherJonahAfterBattleText
	waitbutton
	closetext
	end

TrainerBlackbeltWai:
	trainer BLACKBELT_T, WAI, EVENT_BEAT_BLACKBELT_WAI, BlackbeltWaiSeenText, BlackbeltWaiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltWaiAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorKenneth:
	trainer SAILOR, KENNETH, EVENT_BEAT_SAILOR_KENNETH, SailorKennethSeenText, SailorKennethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorKennethAfterBattleText
	waitbutton
	closetext
	end

TrainerTeacherShirley:
	trainer TEACHER, SHIRLEY, EVENT_BEAT_TEACHER_SHIRLEY, TeacherShirleySeenText, TeacherShirleyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherShirleyAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyNate:
	trainer SCHOOLBOY, NATE, EVENT_BEAT_SCHOOLBOY_NATE, SchoolboyNateSeenText, SchoolboyNateBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyNateAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyRicky:
	trainer SCHOOLBOY, RICKY, EVENT_BEAT_SCHOOLBOY_RICKY, SchoolboyRickySeenText, SchoolboyRickyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyRickyAfterBattleText
	waitbutton
	closetext
	end

FastShipB1FTrashcan:
	jumpstd TrashCanScript

FastShipB1FSailorBlocksRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	turn_head DOWN
	step_end

FastShipB1FSailorBlocksLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	turn_head DOWN
	step_end

FastShipB1FOnDutySailorText:
	text "Ei, nen. Podries"
	line "buscar el meu"
	cont "company?"

	para "Està fent el ròdol"
	line "per algun lloc,"
	cont "el dropo!"

	para "Vull anar a"
	line "buscar-lo, però"
	cont "estic de guàrdia."
	done

FastShipB1FOnDutySailorRefusedText:
	text "Oh, vaja…"

	para "El CAPITÀ"
	line "s'enfadarà molt…"
	done

FastShipB1FOnDutySailorThanksText:
	text "Gràcies, nen!"
	line "L'he renyat bé"

	para "perquè deixi de"
	line "fer el mandra!"
	done

FastShipB1FOnDutySailorSawLittleGirlText:
	text "Una nena petita?"

	para "Potser l'he vista"
	line "passar per aquí."
	done

FastShipB1FOnDutySailorDirectionsText:
	text "El menjador és"
	line "més endavant."

	para "Les escales del"
	line "fons porten a la"
	cont "cabina del CAPITÀ."
	done

SailorJeffSeenText:
	text "No hi ha res com"
	line "un combat durant"
	cont "la pausa."
	done

SailorJeffBeatenText:
	text "Guanyi o perdi,"
	line "la pausa s'acaba!"
	done

SailorJeffAfterBattleText:
	text "Suposo que no puc"
	line "guanyar si no em"
	cont "poso seriós."
	done

PicnickerDebraSeenText:
	text "M'avorreixo molt."
	line "Vols combatre?"
	done

PicnickerDebraBeatenText:
	text "Ui! Ets massa"
	line "fort!"
	done

PicnickerDebraAfterBattleText:
	text "SAFFRON, CELADON…"
	line "He sentit que hi"

	para "ha moltes ciutats"
	line "grans a KANTO."
	done

JugglerFritzSeenText:
	text "Ugh…"
	line "Estic marejat!"
	done

JugglerFritzBeatenText:
	text "No em puc moure"
	line "més…"
	done

JugglerFritzAfterBattleText:
	text "Mai més vaixells."
	line "El proper cop,"

	para "agafaré el TREN"
	line "MAGNÈTIC."
	done

SailorGarrettSeenText:
	text "Aquí és on"
	line "treballem els"
	cont "mariners!"
	done

SailorGarrettBeatenText:
	text "He perdut a casa"
	line "meva…"
	done

SailorGarrettAfterBattleText:
	text "Tenim passatgers"
	line "diferents de"

	para "CIUTAT VERMILION a"
	line "CIUTAT OLIVINE."
	done

FisherJonahSeenText:
	text "Tot i ser al mar,"
	line "no puc pescar!"

	para "Quin avorriment!"
	line "Lluitem!"
	done

FisherJonahBeatenText:
	text "Ja… ja no"
	line "m'avorreixo…"
	done

FisherJonahAfterBattleText:
	text "Penso pescar al"
	line "moll de VERMILION."
	done

BlackbeltWaiSeenText:
	text "Enforteixo les"
	line "cames aguantant"

	para "el balanceig"
	line "del vaixell!"
	done

BlackbeltWaiBeatenText:
	text "M'han sacsejat"
	line "i tombat!"
	done

BlackbeltWaiAfterBattleText:
	text "No vaig trobar el"
	line "REI DEL KARATE a"
	cont "JOHTO."

	para "Diuen que entrena"
	line "en una cova en"
	cont "algun lloc."
	done

SailorKennethSeenText:
	text "Sóc un mariner!"

	para "Però entreno"
	line "#MON per ser"
	cont "el CAMPIÓ!"
	done

SailorKennethBeatenText:
	text "La meva manca"
	line "d'entrenament és"
	cont "evident…"
	done

SailorKennethAfterBattleText:
	text "Vuit MEDALLES!"
	line "Han de provar"

	para "que has vençut"
	line "LÍDERS DE GIMNÀS."

	para "No és estrany que"
	line "siguis tan bo!"
	done

TeacherShirleySeenText:
	text "No toquis els"
	line "meus alumnes!"
	done

TeacherShirleyBeatenText:
	text "Aaaah!"
	done

TeacherShirleyAfterBattleText:
	text "Som d'excursió a"
	line "les RUÏNES a prop"
	cont "de VIOLET."
	done

SchoolboyNateSeenText:
	text "Coneixes les"
	line "RUÏNES D'ALPH?"
	done

SchoolboyNateBeatenText:
	text "Aargh!"
	done

SchoolboyNateAfterBattleText:
	text "Les ràdios capten"
	line "senyals estranys"
	cont "a les RUÏNES."
	done

SchoolboyRickySeenText:
	text "Hi ha uns panells"
	line "de pedra estranys"
	cont "a les RUÏNES."
	done

SchoolboyRickyBeatenText:
	text "M'han derrotat!"
	done

SchoolboyRickyAfterBattleText:
	text "He llegit que hi"
	line "ha quatre panells"
	cont "de pedra."
	done

FastShipB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 11, FAST_SHIP_1F, 11
	warp_event 31, 13, FAST_SHIP_1F, 12

	def_coord_events
	coord_event 30,  7, SCENE_FASTSHIPB1F_SAILOR_BLOCKS, FastShipB1FSailorBlocksLeft
	coord_event 31,  7, SCENE_FASTSHIPB1F_SAILOR_BLOCKS, FastShipB1FSailorBlocksRight

	def_bg_events
	bg_event 27,  9, BGEVENT_READ, FastShipB1FTrashcan

	def_object_events
	object_event 30,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FastShipB1FSailorScript, EVENT_FAST_SHIP_B1F_SAILOR_LEFT
	object_event 31,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FastShipB1FSailorScript, EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	object_event  9, 11, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorJeff, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  6,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerDebra, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event 26,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerJugglerFritz, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event 17,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorGarrett, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 25,  8, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherJonah, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 15, 11, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltWai, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 23,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorKenneth, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  9, 11, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerTeacherShirley, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event 14,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyNate, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event 14, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyRicky, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
