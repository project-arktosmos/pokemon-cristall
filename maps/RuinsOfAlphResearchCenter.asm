	object_const_def
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST1
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST2
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST3

RuinsOfAlphResearchCenter_MapScripts:
	def_scene_scripts
	scene_script RuinsOfAlphResearchCenterNoopScene,        SCENE_RUINSOFALPHRESEARCHCENTER_NOOP
	scene_script RuinsOfAlphResearchCenterGetUnownDexScene, SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX

	def_callbacks
	callback MAPCALLBACK_OBJECTS, RuinsOfAlphResearchCenterScientistCallback

RuinsOfAlphResearchCenterNoopScene:
	end

RuinsOfAlphResearchCenterGetUnownDexScene:
	sdefer RuinsOfAlphResearchCenterGetUnownDexScript
	end

RuinsOfAlphResearchCenterScientistCallback:
	checkscene
	ifequal SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX, .ShowScientist
	endcallback

.ShowScientist:
	moveobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, 3, 7
	appear RUINSOFALPHRESEARCHCENTER_SCIENTIST3
	endcallback

RuinsOfAlphResearchCenterGetUnownDexScript:
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterApproachesComputerMovement
	playsound SFX_BOOT_PC
	pause 60
	playsound SFX_SWITCH_POKEMON
	pause 30
	playsound SFX_TALLY
	pause 30
	playsound SFX_TRANSACTION
	pause 30
	turnobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, DOWN
	opentext
	writetext RuinsOfAlphResearchCenterModifiedDexText
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterApproachesPlayerMovement
	opentext
	writetext RuinsOfAlphResearchCenterDexUpgradedText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_UNOWN_DEX
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterLeavesPlayerMovement
	setscene SCENE_RUINSOFALPHRESEARCHCENTER_NOOP
	special RestartMapMusic
	end

RuinsOfAlphResearchCenterScientist3Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetext RuinsOfAlphResearchCenterScientist3_PrinterAvailable
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterScientist1Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkflag ENGINE_UNOWN_DEX
	iftrue .GotUnownDex
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext RuinsOfAlphResearchCenterScientist1Text
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext RuinsOfAlphResearchCenterScientist1Text_UnownAppeared
	waitbutton
	closetext
	end

.GotUnownDex:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotUnownDex
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotAllUnown
	waitbutton
	closetext
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	end

RuinsOfAlphResearchCenterScientist2Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext RuinsOfAlphResearchCenterScientist2Text
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext RuinsOfAlphResearchCenterScientist2Text_UnownAppeared
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterScientist2Text_GotAllUnown
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterComputer:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
.SkipChecking:
	writetext RuinsOfAlphResearchCenterComputerText
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterComputerText_GotAllUnown
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterPrinter:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
.SkipChecking:
	writetext RuinsOfAlphResearchCenterPrinterText_DoesntWork
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetext RuinsOfAlphResearchCenterUnownPrinterText
	waitbutton
	special UnownPrinter
	closetext
	end

RuinsOfAlphResearchCenterPhoto: ; unreferenced
	jumptext RuinsOfAlphResearchCenterProfSilktreePhotoText

RuinsOfAlphResearchCenterBookshelf:
	jumptext RuinsOfAlphResearchCenterAcademicBooksText

RuinsOfAlphResearchCenterApproachesComputerMovement:
	step UP
	step UP
	step LEFT
	turn_head UP
	step_end

RuinsOfAlphResearchCenterApproachesPlayerMovement:
	step DOWN
	step_end

RuinsOfAlphResearchCenterLeavesPlayerMovement:
	step UP
	step_end

RuinsOfAlphResearchCenterModifiedDexText:
	text "Fet!"

	para "He modificat la"
	line "teva #DEX."

	para "Hi he afegit una"
	line "#DEX opcional"

	para "per desar dades"
	line "d'UNOWN."

	para "Els registra en"
	line "l'ordre en què"
	cont "els has capturat."
	done

RuinsOfAlphResearchCenterDexUpgradedText:
	text "S'ha millorat la"
	line "#DEX d'en"
	cont "<PLAYER>."
	done

RuinsOfAlphResearchCenterScientist3Text:
	text "Tots els UNOWN"
	line "que capturis"
	cont "es registraran."

	para "Mira quants tipus"
	line "n'hi ha."
	done

RuinsOfAlphResearchCenterScientist3_PrinterAvailable:
	text "Has capturat totes"
	line "les variants"
	cont "d'UNOWN?"

	para "Quina gran fita!"

	para "He configurat la"
	line "impressora per a"
	cont "UNOWN."

	para "Fes-la servir"
	line "quan vulguis."
	done

RuinsOfAlphResearchCenterScientist1Text:
	text "Les RUÏNES tenen"
	line "uns 1500 anys"
	cont "d'antiguitat."

	para "Però no se sap per"
	line "què les van fer,"
	cont "ni qui."
	done

RuinsOfAlphResearchCenterScientist1Text_GotUnownDex:
	text "Quants tipus de"
	line "#MON hi deu"
	cont "haver a les"
	cont "RUÏNES?"
	done

RuinsOfAlphResearchCenterScientist1Text_UnownAppeared:
	text "Han aparegut #-"
	line "MON a les RUÏNES?"

	para "Quina notícia més"
	line "increïble!"

	para "Haurem"
	line "d'investigar-ho."
	done

RuinsOfAlphResearchCenterScientist1Text_GotAllUnown:
	text "La investigació,"
	line "amb la teva ajuda,"

	para "ens dóna pistes"
	line "sobre les RUÏNES."

	para "Sembla que les van"
	line "construir com a"

	para "hàbitat per a"
	line "#MON."
	done

RuinsOfAlphResearchCenterScientist2Text:
	text "Hi ha uns patrons"
	line "estranys a les"

	para "parets de les"
	line "RUÏNES."

	para "Han de ser la"
	line "clau per resoldre"
	cont "el misteri de les"
	cont "RUÏNES."
	done

RuinsOfAlphResearchCenterScientist2Text_UnownAppeared:
	text "Els #MON"
	line "estranys que has"
	cont "vist a les RUÏNES?"

	para "S'assemblen molt"
	line "als dibuixos de"

	para "les parets"
	line "d'allà."

	para "Mmm…"

	para "Això vol dir que"
	line "n'hi ha molts"
	cont "tipus…"
	done

RuinsOfAlphResearchCenterUnusedText1: ; unreferenced
	text "Creiem que alguna"
	line "cosa va fer que"

	para "apareguessin els"
	line "símbols críptics."

	para "Hem centrat els"
	line "estudis en això."
	done

RuinsOfAlphResearchCenterUnusedText2: ; unreferenced
	text "Segons la meva"
	line "recerca…"

	para "Els patrons"
	line "misteriosos van"

	para "aparèixer en fer"
	line "el CENTRE #COM."

	para "Vol dir que les"
	line "ones de ràdio hi"

	para "tenen alguna"
	line "relació…"
	done

RuinsOfAlphResearchCenterScientist2Text_GotAllUnown:
	text "Per què han"
	line "aparegut ara els"

	para "patrons antics a"
	line "la paret?"

	para "El misteri"
	line "s'intensifica…"
	done

RuinsOfAlphResearchCenterComputerText:
	text "RUÏNES D'ALPH"

	para "Exploració"
	line "Any 10"
	done

RuinsOfAlphResearchCenterComputerText_GotAllUnown:
	text "#MON misteriós"
	line "Nom: UNOWN"

	para "S'han trobat {d:NUM_UNOWN}"
	line "tipus en total."
	done

RuinsOfAlphResearchCenterPrinterText_DoesntWork:
	text "Sembla que encara"
	line "no funciona."
	done

RuinsOfAlphResearchCenterUnownPrinterText:
	text "Es poden imprimir"
	line "els UNOWN."
	done

RuinsOfAlphResearchCenterProfSilktreePhotoText:
	text "És una foto del"
	line "fundador del"

	para "CENTRE, el"
	line "PROF.SILKTREE."
	done

RuinsOfAlphResearchCenterAcademicBooksText:
	text "Hi ha molts"
	line "llibres acadèmics."

	para "Ruïnes Antigues…"
	line "Misteris dels"
	cont "Antics…"
	done

RuinsOfAlphResearchCenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, RUINS_OF_ALPH_OUTSIDE, 6
	warp_event  3,  7, RUINS_OF_ALPH_OUTSIDE, 6

	def_coord_events

	def_bg_events
	bg_event  6,  5, BGEVENT_READ, RuinsOfAlphResearchCenterBookshelf
	bg_event  3,  4, BGEVENT_READ, RuinsOfAlphResearchCenterComputer
	bg_event  7,  1, BGEVENT_READ, RuinsOfAlphResearchCenterPrinter

	def_object_events
	object_event  4,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist1Script, -1
	object_event  5,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist2Script, -1
	object_event  2,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist3Script, EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
