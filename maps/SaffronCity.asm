	object_const_def
	const SAFFRONCITY_LASS1
	const SAFFRONCITY_POKEFAN_M
	const SAFFRONCITY_COOLTRAINER_M
	const SAFFRONCITY_COOLTRAINER_F
	const SAFFRONCITY_FISHER
	const SAFFRONCITY_YOUNGSTER1
	const SAFFRONCITY_YOUNGSTER2
	const SAFFRONCITY_LASS2

SaffronCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, SaffronCityFlypointCallback

SaffronCityFlypointCallback:
	setflag ENGINE_FLYPOINT_SAFFRON
	endcallback

SaffronCityLass1Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronCityLass1Text
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronCityLass1Text_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronCityPokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronCityPokefanMText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronCityPokefanMText_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronCityCooltrainerMScript:
	jumptextfaceplayer SaffronCityCooltrainerMText

SaffronCityCooltrainerFScript:
	jumptextfaceplayer SaffronCityCooltrainerFText

SaffronCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronCityFisherText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronCityFisherText_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronCityYoungster1Script:
	jumptextfaceplayer SaffronCityYoungster1Text

SaffronCityYoungster2Script:
	jumptextfaceplayer SaffronCityYoungster2Text

SaffronCityLass2Script:
	jumptextfaceplayer SaffronCityLass2Text

SaffronCitySign:
	jumptext SaffronCitySignText

SaffronGymSign:
	jumptext SaffronGymSignText

FightingDojoSign:
	jumptext FightingDojoSignText

SilphCoSign:
	jumptext SilphCoSignText

MrPsychicsHouseSign:
	jumptext MrPsychicsHouseSignText

SaffronCityMagnetTrainStationSign:
	jumptext SaffronCityMagnetTrainStationSignText

SaffronCityPokecenterSign:
	jumpstd PokecenterSignScript

SaffronCityMartSign:
	jumpstd MartSignScript

SaffronCityLass1Text:
	text "Aquí viu una nena"
	line "que és una experta"

	para "imitant la gent."

	para "Fins i tot imita"
	line "les persones amb"

	para "qui parla. És molt"
	line "confús."
	done

SaffronCityLass1Text_ReturnedMachinePart:
	text "La nena imitadora"
	line "semblava trista."

	para "Diu que ha perdut"
	line "la seva nina #"
	cont "preferida:CLEFAIRY"
	done

SaffronCityPokefanMText:
	text "Has vingut de"
	line "JOHTO?"

	para "Pots tornar a casa"
	line "ràpid si el TREN"
	cont "MAGNÈTIC funciona."
	done

SaffronCityPokefanMText_ReturnedMachinePart:
	text "Has vingut de"
	line "JOHTO?"

	para "Pots tornar a casa"
	line "ràpid agafant el"
	cont "TREN MAGNÈTIC."
	done

SaffronCityCooltrainerMText:
	text "Vaig anar al GIM,"
	line "amb ganes de"
	cont "combatre…"

	para "Però vaig entrar"
	line "per error al GIM"

	para "abandonat del"
	line "costat."

	para "Quina vergonya"
	line "que vaig passar!"
	done

SaffronCityCooltrainerFText:
	text "Això és SILPH SA.,"
	line "famosa pels seus"
	cont "productes #MON."

	para "Abans, el TEAM"
	line "ROCKET volia"

	para "l'empresa per"
	line "això."
	done

SaffronCityFisherText:
	text "Nyam… Nyam…"

	para "He sentit que hi"
	line "ha problemes a la"
	cont "CENTRAL ELÈCTRICA."

	para "Nyam… Nyam…"
	done

SaffronCityFisherText_ReturnedMachinePart:
	text "Nyam… Nyam…"

	para "He sentit que hi"
	line "va haver problemes"
	cont "a la CENTRAL."

	para "Nyam… Nyam…"
	line "Aaah, estic ple!"
	done

SaffronCityYoungster1Text:
	text "Entrar en un"
	line "carreró per primer"

	para "cop em posa una"
	line "mica nerviós."
	done

SaffronCityYoungster2Text:
	text "Hi ha un lloc"
	line "anomenat CASA DEL"

	para "ENTRENADOR a"
	line "VIRIDIAN on"

	para "s'apleguen"
	line "entrenadors."
	done

SaffronCityLass2Text:
	text "La nostra ciutat"
	line "va sortir en un"
	cont "programa de ràdio."

	para "És agradable"
	line "sentir elogis de"

	para "la teva ciutat,"
	line "però també fa una"
	cont "mica de vergonya."
	done

SaffronCitySignText:
	text "CIUTAT SAFFRON"

	para "Terra daurada i"
	line "brillant del"
	cont "comerç"
	done

SaffronGymSignText:
	text "GIM #MON DE"
	line "CIUTAT SAFFRON"
	cont "LÍDER: SABRINA"

	para "La mestra dels"
	line "#MON psíquics!"
	done

FightingDojoSignText:
	text "Tothom benvingut!"
	line "DOJO DE LLUITA"
	done

SilphCoSignText:
	text "SILPH SA."
	line "EDIFICI D'OFICINES"
	done

MrPsychicsHouseSignText:
	text "CASA DEL"
	line "SR. PSÍQUIC"
	done

SaffronCityMagnetTrainStationSignText:
	text "CIUTAT SAFFRON"
	line "ESTACIÓ DEL"
	cont "TREN MAGNÈTIC"
	done

SaffronCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 26,  3, FIGHTING_DOJO, 1
	warp_event 34,  3, SAFFRON_GYM, 1
	warp_event 25, 11, SAFFRON_MART, 2
	warp_event  9, 29, SAFFRON_POKECENTER_1F, 1
	warp_event 27, 29, MR_PSYCHICS_HOUSE, 1
	warp_event  8,  3, SAFFRON_MAGNET_TRAIN_STATION, 2
	warp_event 18, 21, SILPH_CO_1F, 1
	warp_event  9, 11, COPYCATS_HOUSE_1F, 1
	warp_event 18,  3, ROUTE_5_SAFFRON_GATE, 3
	warp_event  0, 24, ROUTE_7_SAFFRON_GATE, 3
	warp_event  0, 25, ROUTE_7_SAFFRON_GATE, 4
	warp_event 16, 33, ROUTE_6_SAFFRON_GATE, 1
	warp_event 17, 33, ROUTE_6_SAFFRON_GATE, 2
	warp_event 39, 22, ROUTE_8_SAFFRON_GATE, 1
	warp_event 39, 23, ROUTE_8_SAFFRON_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 21,  5, BGEVENT_READ, SaffronCitySign
	bg_event 33,  5, BGEVENT_READ, SaffronGymSign
	bg_event 25,  5, BGEVENT_READ, FightingDojoSign
	bg_event 15, 21, BGEVENT_READ, SilphCoSign
	bg_event 25, 29, BGEVENT_READ, MrPsychicsHouseSign
	bg_event 11,  5, BGEVENT_READ, SaffronCityMagnetTrainStationSign
	bg_event 10, 29, BGEVENT_READ, SaffronCityPokecenterSign
	bg_event 26, 11, BGEVENT_READ, SaffronCityMartSign

	def_object_events
	object_event  7, 14, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityLass1Script, -1
	object_event 19, 30, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SaffronCityPokefanMScript, -1
	object_event 32,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityCooltrainerMScript, -1
	object_event 20, 24, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityCooltrainerFScript, -1
	object_event 27, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityFisherScript, -1
	object_event 15, 19, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronCityYoungster1Script, -1
	object_event 35, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityYoungster2Script, -1
	object_event 19,  8, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityLass2Script, -1
