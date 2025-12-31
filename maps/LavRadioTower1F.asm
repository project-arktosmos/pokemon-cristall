	object_const_def
	const LAVRADIOTOWER1F_RECEPTIONIST
	const LAVRADIOTOWER1F_OFFICER
	const LAVRADIOTOWER1F_SUPER_NERD1
	const LAVRADIOTOWER1F_GENTLEMAN
	const LAVRADIOTOWER1F_SUPER_NERD2

LavRadioTower1F_MapScripts:
	def_scene_scripts

	def_callbacks

LavRadioTower1FReceptionistScript:
	jumptextfaceplayer LavRadioTower1FReceptionistText

LavRadioTower1FOfficerScript:
	jumptextfaceplayer LavRadioTower1FOfficerText

LavRadioTower1FSuperNerd1Script:
	jumptextfaceplayer LavRadioTower1FSuperNerd1Text

LavRadioTower1FGentlemanScript:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue .GotExpnCard
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext LavRadioTower1FGentlemanText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext LavRadioTower1FGentlemanText_ReturnedMachinePart
	promptbutton
	getstring STRING_BUFFER_4, .expncardname
	scall .receiveitem
	setflag ENGINE_EXPN_CARD
.GotExpnCard:
	writetext LavRadioTower1FGentlemanText_GotExpnCard
	waitbutton
	closetext
	end

.receiveitem:
	jumpstd ReceiveItemScript
	end

.expncardname
	db "EXPN CARD@"

LavRadioTower1FSuperNerd2Script:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue .GotExpnCard
	writetext LavRadioTower1FSuperNerd2Text
	waitbutton
	closetext
	end

.GotExpnCard:
	writetext LavRadioTower1FSuperNerd2Text_GotExpnCard
	waitbutton
	closetext
	end

LavRadioTower1FDirectory:
	jumptext LavRadioTower1FDirectoryText

LavRadioTower1FPokeFluteSign:
	jumptext LavRadioTower1FPokeFluteSignText

LavRadioTower1FReferenceLibrary: ; unreferenced
	jumptext LavRadioTower1FReferenceLibraryText

LavRadioTower1FReceptionistText:
	text "Benvingut!"
	line "Pots fer un cop"

	para "d'ull per aquesta"
	line "planta."
	done

LavRadioTower1FOfficerText:
	text "Perdona, però"
	line "només es pot"
	cont "visitar la planta"
	cont "baixa."

	para "Des que la TORRE"
	line "RÀDIO de JOHTO va"

	para "ser ocupada per"
	line "una banda de"

	para "criminals, hem"
	line "hagut de reforçar"
	cont "la seguretat."
	done

LavRadioTower1FSuperNerd1Text:
	text "Molta gent"
	line "treballa"
	cont "dur aquí a la"
	cont "TORRE"
	cont "RÀDIO."

	para "Deuen estar fent"
	line "tot el possible"

	para "per oferir bons"
	line "programes."
	done

LavRadioTower1FGentlemanText:
	text "Oh, no, no, no!"

	para "Hem deixat d'eme-"
	line "tre des que la"

	para "CENTRAL ELÈCTRICA"
	line "va tancar."

	para "Tots els meus"
	line "esforços per obrir"

	para "aquesta emissora"
	line "serien en va si no"
	cont "puc emetre."

	para "Estic perdut!"
	done

LavRadioTower1FGentlemanText_ReturnedMachinePart:
	text "Ah! Tu ets <PLAY_G>"
	line "que va resoldre el"

	para "problema de la"
	line "CENTRAL ELÈCTRICA?"

	para "Gràcies a tu, no"
	line "vaig perdre la"
	cont "feina."

	para "T'ho dic, m'has"
	line "salvat la vida!"

	para "Pren això com a"
	line "mostra del meu"
	cont "agraïment."
	done

LavRadioTower1FGentlemanText_GotExpnCard:
	text "Amb això, pots"
	line "sintonitzar els"

	para "programes de ràdio"
	line "d'aquí a KANTO."

	para "Gahahahaha!"
	done

LavRadioTower1FSuperNerd2Text:
	text "Ei, hola!"

	para "Sóc el super"
	line "DIRECTOR MUSICAL!"

	para "Eh? El teu"
	line "#GEAR"
	cont "no pot sintonitzar"

	para "els meus programes"
	line "musicals."
	cont "Quina llàstima!"

	para "Si aconsegueixes"
	line "una EXPN CARD,"

	para "podràs escoltar-"
	line "los. Aconsegueix-"
	cont "ne una!"
	done

LavRadioTower1FSuperNerd2Text_GotExpnCard:
	text "Ei, hola!"

	para "Sóc el super"
	line "DIRECTOR MUSICAL!"

	para "Sóc el responsable"
	line "de les"
	cont "fantàstiques"

	para "melodies que"
	line "surten"
	cont "per les ones."

	para "No siguis avorrit."
	line "Escolta música"
	cont "per la ràdio!"
	done

LavRadioTower1FDirectoryText:
	text "1F RECEPCIÓ"
	line "2F VENDES"

	para "3F PERSONAL"
	line "4F PRODUCCIÓ"

	para "5F DESPATX DEL"
	line "   DIRECTOR"
	done

LavRadioTower1FPokeFluteSignText:
	text "Anima els #MON"
	line "amb els Sons Suaus"

	para "de la # FLAUTA"
	line "al CANAL 20"
	done

LavRadioTower1FReferenceLibraryText:
	text "Uau! Un prestatge"
	line "ple de CDs i"
	cont "vídeos"
	cont "de #MON."

	para "Això deu ser la"
	line "mediateca."
	done

LavRadioTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAVENDER_TOWN, 7
	warp_event  3,  7, LAVENDER_TOWN, 7

	def_coord_events

	def_bg_events
	bg_event 11,  0, BGEVENT_READ, LavRadioTower1FDirectory
	bg_event  5,  0, BGEVENT_READ, LavRadioTower1FPokeFluteSign

	def_object_events
	object_event  6,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FReceptionistScript, -1
	object_event 15,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FOfficerScript, -1
	object_event  1,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd1Script, -1
	object_event  9,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FGentlemanScript, -1
	object_event 14,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd2Script, -1
