object_const_def
const EARLSPOKEMONACADEMY_EARL
const EARLSPOKEMONACADEMY_YOUNGSTER1
const EARLSPOKEMONACADEMY_GAMEBOY_KID1
const EARLSPOKEMONACADEMY_GAMEBOY_KID2
const EARLSPOKEMONACADEMY_YOUNGSTER2
const EARLSPOKEMONACADEMY_POKEDEX

EarlsPokemonAcademy_MapScripts:
	def_scene_scripts

	def_callbacks

AcademyEarl:
	applymovement EARLSPOKEMONACADEMY_EARL, AcademyEarlSpinMovement
	faceplayer
	opentext
	writetext AcademyEarlIntroText
	yesorno
	iffalse .Part1
	writetext AcademyEarlTeachHowToWinText
	yesorno
	iffalse .Done
.Part1:
	writetext AcademyEarlTeachMoreText
	yesorno
	iffalse .Done
	writetext AcademyEarlTeachHowToRaiseWellText
	waitbutton
	closetext
	end

.Done:
	writetext AcademyEarlNoMoreToTeachText
	waitbutton
	closetext
	end

EarlsPokemonAcademyYoungster1Script:
	jumptextfaceplayer EarlsPokemonAcademyYoungster1Text

EarlsPokemonAcademyGameboyKid1Script:
	faceplayer
	opentext
	writetext EarlsPokemonAcademyGameboyKid1Text
	waitbutton
	closetext
	turnobject EARLSPOKEMONACADEMY_GAMEBOY_KID1, DOWN
	end

EarlsPokemonAcademyGameboyKid2Script:
	faceplayer
	opentext
	writetext EarlsPokemonAcademyGameboyKid2Text
	waitbutton
	closetext
	turnobject EARLSPOKEMONACADEMY_GAMEBOY_KID2, DOWN
	end

EarlsPokemonAcademyYoungster2Script:
	jumptextfaceplayer EarlsPokemonAcademyYoungster2Text

AcademyBlackboard:
	opentext
	writetext AcademyBlackboardText
.Loop:
	loadmenu .BlackboardMenuHeader
	_2dmenu
	closewindow
	ifequal 1, .Poison
	ifequal 2, .Paralysis
	ifequal 3, .Sleep
	ifequal 4, .Burn
	ifequal 5, .Freeze
	closetext
	end

.Poison:
	writetext AcademyPoisonText
	waitbutton
	sjump .Loop

.Paralysis:
	writetext AcademyParalysisText
	waitbutton
	sjump .Loop

.Sleep:
	writetext AcademySleepText
	waitbutton
	sjump .Loop

.Burn:
	writetext AcademyBurnText
	waitbutton
	sjump .Loop

.Freeze:
	writetext AcademyFreezeText
	waitbutton
	sjump .Loop

.BlackboardMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 11, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	dn 3, 2 ; rows, columns
	db 5 ; spacing
	dba .Text
	dbw BANK(@), NULL

.Text:
	db "ENV@"
	db "PAR@"
	db "SON@"
	db "CRE@"
	db "GEL@"
	db "SURT@"

AcademyNotebook:
	opentext
	writetext AcademyNotebookText
	yesorno
	iffalse .Done
	writetext AcademyNotebookText1
	yesorno
	iffalse .Done
	writetext AcademyNotebookText2
	yesorno
	iffalse .Done
	writetext AcademyNotebookText3
	waitbutton
.Done:
	closetext
	end

AcademyStickerMachine: ; unreferenced
	jumptext AcademyStickerMachineText

AcademyBookshelf:
	jumpstd DifficultBookshelfScript

AcademyEarlSpinMovement:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

AcademyEarlIntroText:
	text "Sóc l'EARL!"

	para "Meravellosos són"
	line "els #MON, sí!"

	para "T'ensenyaré a ser"
	line "un entrenador"
	cont "millor!"

	para "Què vols saber?"
	line "Vols ser un"
	cont "guanyador?"
	done

AcademyEarlTeachHowToWinText:
	text "Bé! T'ensenyaré!"

	para "En combat, el"
	line "#MON al"
	cont "capdamunt"
	cont "surt primer!"

	para "Canvia l'ordre de"
	line "la llista i el"
	cont "combat serà fàcil!"

	para "Vols saber-ne"
	line "més?"
	done

AcademyEarlTeachMoreText:
	text "Vols saber com"
	line "criar bé els"
	cont "#MON?"
	done

AcademyEarlTeachHowToRaiseWellText:
	text "Molt bé!"
	line "T'ensenyaré!"

	para "Si un #MON surt"
	line "en combat, encara"

	para "que sigui poc,"
	line "rep punts d'EXP."

	para "Posa un #MON"
	line "feble al capdamunt"
	cont "de la llista."

	para "Canvia'l ràpid"
	line "en combat!"

	para "Així, els #MON"
	line "febles es tornaran"
	cont "forts!"
	done

AcademyEarlNoMoreToTeachText:
	text "Oh! Ets un alumne"
	line "molt llest! No"
	cont "t'ensenyo res més!"

	para "Sigues bo amb els"
	line "#MON!"
	done

EarlsPokemonAcademyYoungster1Text:
	text "Prenc apunts de"
	line "la classe del"
	cont "professor."

	para "Hauria de copiar"
	line "el que hi ha a"
	cont "la pissarra."
	done

EarlsPokemonAcademyGameboyKid1Text:
	text "He canviat el meu"
	line "millor #MON amb"
	cont "el noi del costat."
	done

EarlsPokemonAcademyGameboyKid2Text:
	text "Eh? El #MON que"
	line "acabo de rebre"
	cont "porta alguna cosa!"
	done

EarlsPokemonAcademyYoungster2Text:
	text "Un #MON amb una"
	line "BAIA es curarà"
	cont "sol en combat."

	para "Molts altres"
	line "objectes poden"
	cont "portar els"
	cont "#MON…"

	para "Quina feina,"
	line "prendre apunts…"
	done

AcademyBlackboardText:
	text "La pissarra"
	line "descriu els canvis"

	para "d'estat dels"
	line "#MON en combat."
	done

AcademyBlackboardText2: ; unreferenced
	text "Quin tema vols"
	line "llegir?"
	done

AcademyPoisonText:
	text "Si està enve-"
	line "rinat, un #MON"
	cont "perd PS a poc a"
	cont "poc."

	para "L'enverinament"
	line "continua després"
	cont "del combat,"

	para "i perds PS mentre"
	line "camines."

	para "Per curar-lo, fes"
	line "servir un ANTÍDOT."
	done

AcademyParalysisText:
	text "La paràlisi"
	line "redueix la"
	cont "velocitat i pot"
	cont "impedir moure's."

	para "Continua després"
	line "del combat. Usa"
	cont "una ANTIPARÀLISI."
	done

AcademySleepText:
	text "Si està adormit,"
	line "el teu #MON no"
	cont "pot fer res."

	para "Un #MON adormit"
	line "no es desperta"
	cont "després del"
	cont "combat."

	para "Desperta'l amb un"
	line "DESVETLLADOR."
	done

AcademyBurnText:
	text "Una cremada"
	line "consumeix PS"
	cont "constantment."

	para "També redueix el"
	line "poder d'atac."

	para "La cremada"
	line "continua després"
	cont "del combat."

	para "Usa una CURA"
	line "CREMADA per"
	cont "curar-la."
	done

AcademyFreezeText:
	text "Si el teu #MON"
	line "està congelat, no"
	cont "pot fer res."

	para "Continua congelat"
	line "després del"
	cont "combat."

	para "Descongela'l amb"
	line "una CURA GEL."
	done

AcademyNotebookText:
	text "És la llibreta"
	line "d'aquest nen…"

	para "Captura #MON"
	line "amb # BALLS."

	para "Pots portar-ne"
	line "fins a sis a"
	cont "l'equip."

	para "Segueixo llegint?"
	done

AcademyNotebookText1:
	text "Abans de llançar"
	line "una # BALL,"
	cont "afebleix l'enemic."

	para "Un #MON"
	line "enverinant o"
	cont "cremat és més"
	cont "fàcil de capturar."

	para "Segueixo llegint?"
	done

AcademyNotebookText2:
	text "Alguns moviments"
	line "poden causar"
	cont "confusió."

	para "La confusió pot"
	line "fer que un #MON"
	cont "s'ataqui a ell"
	cont "mateix."

	para "Sortir del combat"
	line "elimina qualsevol"
	cont "confusió."

	para "Segueixo llegint?"
	done

AcademyNotebookText3:
	text "La gent que"
	line "captura i usa"
	cont "#MON en combat"

	para "són entrenadors"
	line "de #MON."

	para "S'espera que"
	line "visitin GIMNASOS"

	para "i derrotin altres"
	line "entrenadors."

	para "La pàgina"
	line "següent és…"
	cont "En blanc!"

	para "Nen: Je-je-je…"

	para "No n'he escrit"
	line "més…"
	done

AcademyStickerMachineText:
	text "Aquesta"
	line "supermàquina"

	para "imprimeix dades"
	line "en adhesius!"
	done

EarlsPokemonAcademy_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 15, VIOLET_CITY, 3
	warp_event  4, 15, VIOLET_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, AcademyBookshelf
	bg_event  1,  1, BGEVENT_READ, AcademyBookshelf
	bg_event  3,  0, BGEVENT_READ, AcademyBlackboard
	bg_event  4,  0, BGEVENT_READ, AcademyBlackboard

	def_object_events
	object_event  4,  2, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AcademyEarl, EVENT_EARLS_ACADEMY_EARL
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyYoungster1Script, -1
	object_event  3, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyGameboyKid1Script, -1
	object_event  4, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyGameboyKid2Script, -1
	object_event  4,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyYoungster2Script, -1
	object_event  2,  4, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AcademyNotebook, -1
