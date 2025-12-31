	object_const_def
	const OAKSLAB_OAK
	const OAKSLAB_SCIENTIST1
	const OAKSLAB_SCIENTIST2
	const OAKSLAB_SCIENTIST3

OaksLab_MapScripts:
	def_scene_scripts

	def_callbacks

OaksLabNoopScene: ; unreferenced
	end

Oak:
	faceplayer
	opentext
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .CheckPokedex
	checkevent EVENT_TALKED_TO_OAK_IN_KANTO
	iftrue .CheckBadges
	writetext OakWelcomeKantoText
	promptbutton
	setevent EVENT_TALKED_TO_OAK_IN_KANTO
.CheckBadges:
	readvar VAR_BADGES
	ifequal NUM_BADGES, .OpenMtSilver
	ifequal NUM_JOHTO_BADGES, .Complain
	sjump .AhGood

.CheckPokedex:
	writetext OakLabDexCheckText
	waitbutton
	special ProfOaksPCBoot
	writetext OakLabGoodbyeText
	waitbutton
	closetext
	end

.OpenMtSilver:
	writetext OakOpenMtSilverText
	promptbutton
	setevent EVENT_OPENED_MT_SILVER
	sjump .CheckPokedex

.Complain:
	writetext OakNoKantoBadgesText
	promptbutton
	sjump .CheckPokedex

.AhGood:
	writetext OakYesKantoBadgesText
	promptbutton
	sjump .CheckPokedex

OaksAssistant1Script:
	jumptextfaceplayer OaksAssistant1Text

OaksAssistant2Script:
	jumptextfaceplayer OaksAssistant2Text

OaksAssistant3Script:
	jumptextfaceplayer OaksAssistant3Text

OaksLabBookshelf:
	jumpstd DifficultBookshelfScript

OaksLabPoster1:
	jumptext OaksLabPoster1Text

OaksLabPoster2:
	jumptext OaksLabPoster2Text

OaksLabTrashcan:
	jumptext OaksLabTrashcanText

OaksLabPC:
	jumptext OaksLabPCText

OakWelcomeKantoText:
	text "OAK: Ah, <PLAY_G>!"
	line "Molt bé que hagis"

	para "vingut fins aquí,"
	line "a KANTO."

	para "Què en penses,"
	line "dels entrenadors"

	para "d'aquí?"
	line "Són durs, oi?"
	done

OakLabDexCheckText:
	text "Com va la teva"
	line "#DEX?"

	para "A veure…"
	done

OakLabGoodbyeText:
	text "Si ets per aquí,"
	line "espero que tornis"
	cont "a visitar-me."
	done

OakOpenMtSilverText:
	text "OAK: Uau!"
	line "Fantàstic!"

	para "Has aconseguit"
	line "les MEDALLES dels"
	cont "GIMNASOS de KANTO."

	para "Ben fet!"

	para "Tenia raó amb"
	line "el que pensava"
	cont "de tu."

	para "Faré una cosa,"
	line "<PLAY_G>. Faré els"

	para "preparatius per"
	line "a què puguis anar"
	cont "al MT.PLATA."

	para "El MT.PLATA és"
	line "una gran muntanya"

	para "on viuen molts"
	line "#MON salvatges."

	para "És massa perillós"
	line "per a un entrena-"

	para "dor normal, i per"
	line "això no s'hi pot"

	para "anar. Però farem"
	line "una excepció amb"
	cont "tu, <PLAY_G>."

	para "Ves a la MESETA"
	line "ANYIL. Des d'allà"

	para "pots arribar al"
	line "MT.PLATA."
	done

OakNoKantoBadgesText:
	text "OAK: Hmm? No estàs"
	line "col·leccionant les"
	cont "MEDALLES de KANTO?"

	para "Els LÍDERS dels"
	line "GIMNASOS de KANTO"

	para "són tan durs com"
	line "els de JOHTO."

	para "Et recomano que"
	line "els desafiïs."
	done

OakYesKantoBadgesText:
	text "OAK: Ah, estàs"
	line "col·leccionant les"
	cont "MEDALLES de KANTO."

	para "M'imagino que"
	line "és difícil, però"

	para "l'experiència"
	line "t'ajudarà segur."

	para "Vine a veure'm"
	line "quan les tinguis"
	cont "totes."

	para "Tindré un regal"
	line "per a tu."

	para "Continua esfor-"
	line "çant-te, <PLAY_G>!"
	done

OaksAssistant1Text:
	text "El programa de"
	line "ràdio #MON"
	cont "PARLA"

	para "del PROF. no"
	line "s'emet a KANTO."

	para "Quina llàstima!"
	line "M'agradaria"
	cont "oir-lo."
	done

OaksAssistant2Text:
	text "Gràcies a la teva"
	line "feina amb la #-"
	cont "DEX, la recerca"

	para "del PROF. va molt"
	line "bé."
	done

OaksAssistant3Text:
	text "No ho diguis a"
	line "ningú, però el"

	para "#MON PARLA del"
	line "PROF.OAK no és"
	cont "en directe."
	done

OaksLabPoster1Text:
	text "Prem START per"
	line "obrir el MENÚ."
	done

OaksLabPoster2Text:
	text "L'opció DESAR és"
	line "al MENÚ."

	para "Fes-la servir"
	line "quan calgui."
	done

OaksLabTrashcanText:
	text "No hi ha res"
	line "aquí dins…"
	done

OaksLabPCText:
	text "Hi ha un correu"
	line "electrònic al PC."

	para "…"

	para "PROF.OAK, com va"
	line "la teva recerca?"

	para "Jo encara hi"
	line "treballo."

	para "He sentit rumors"
	line "que <PLAY_G> està"

	para "guanyant força"
	line "reputació."

	para "M'alegro molt"
	line "de saber-ho."

	para "ELM de POBLE"
	line "ALBA 8-)"
	done

OaksLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, PALLET_TOWN, 3
	warp_event  5, 11, PALLET_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  0,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  1,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  2,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  3,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  6,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  4,  0, BGEVENT_READ, OaksLabPoster1
	bg_event  5,  0, BGEVENT_READ, OaksLabPoster2
	bg_event  9,  3, BGEVENT_READ, OaksLabTrashcan
	bg_event  0,  1, BGEVENT_READ, OaksLabPC

	def_object_events
	object_event  4,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Oak, -1
	object_event  1,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant1Script, -1
	object_event  8,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant2Script, -1
	object_event  1,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant3Script, -1
