	object_const_def
	const ECRUTEAKCITY_GRAMPS1
	const ECRUTEAKCITY_GRAMPS2
	const ECRUTEAKCITY_LASS1
	const ECRUTEAKCITY_LASS2
	const ECRUTEAKCITY_FISHER
	const ECRUTEAKCITY_YOUNGSTER
	const ECRUTEAKCITY_GRAMPS3

EcruteakCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, EcruteakCityFlypointCallback

EcruteakCityFlypointCallback:
	setflag ENGINE_FLYPOINT_ECRUTEAK
	endcallback

EcruteakCityGramps1Script:
	jumptextfaceplayer EcruteakCityGramps1Text

EcruteakCityGramps2Script:
	jumptextfaceplayer EcruteakCityGramps2Text

EcruteakCityGramps3Script:
	jumptextfaceplayer EcruteakCityGramps3Text

EcruteakCityLass1Script:
	jumptextfaceplayer EcruteakCityLass1Text

EcruteakCityLass2Script:
	faceplayer
	opentext
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue .ReleasedBeasts
	writetext EcruteakCityLass2Text
	waitbutton
	closetext
	end

.ReleasedBeasts:
	writetext EcruteakCityLass2Text_ReleasedBeasts
	waitbutton
	closetext
	end

EcruteakCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue .JasmineReturned
	writetext EcruteakCityFisherText
	waitbutton
	closetext
	end

.JasmineReturned:
	writetext EcruteakCityFisherText_JasmineReturned
	waitbutton
	closetext
	end

EcruteakCityYoungsterScript:
	jumptextfaceplayer EcruteakCityYoungsterText

EcruteakCitySign:
	jumptext EcruteakCitySignText

TinTowerSign:
	jumptext TinTowerSignText

EcruteakGymSign:
	jumptext EcruteakGymSignText

EcruteakDanceTheaterSign:
	jumptext EcruteakDanceTheaterSignText

BurnedTowerSign:
	jumptext BurnedTowerSignText

EcruteakCityPokecenterSign:
	jumpstd PokecenterSignScript

EcruteakCityMartSign:
	jumpstd MartSignScript

EcruteakCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ECRUTEAK_CITY_HIDDEN_HYPER_POTION

UnusedMissingDaughterText: ; unreferenced
	text "Oh, no. Oh, no…"

	para "La meva filla ha"
	line "desaparegut."

	para "No… No pot haver"
	line "anat a la TORRE"
	cont "CREMADA."

	para "Li vaig dir que"
	line "no s'hi acostés…"

	para "Sembla que la gent"
	line "hi desapareix…"

	para "Què hauria de"
	line "fer…?"
	done

EcruteakCityGramps1Text:
	text "ECRUTEAK abans"
	line "tenia dues torres:"

	para "una a l'est i una"
	line "a l'oest."
	done

EcruteakCityGramps2Text:
	text "Ah, criatura."
	line "Has après a ballar"

	para "com les NOIES DEL"
	line "QUIMONO?"

	para "Si vas al seu"
	line "TEATRE DE DANSA,"

	para "un vell estrany et"
	line "donarà alguna cosa"
	cont "bonica, diuen."
	done

EcruteakCityLass1Text:
	text "Vaig a practicar"
	line "al TEATRE DE"

	para "DANSA. Vols venir"
	line "amb mi?"
	done

EcruteakCityLass2Text:
	text "La torre que hi"
	line "havia aquí…"

	para "La meva àvia em va"
	line "dir que abans era"
	cont "molt més alta."
	done

EcruteakCityLass2Text_ReleasedBeasts:
	text "Tres grans #MON"
	line "van fugir en"
	cont "direccions"
	cont "diferents."
	cont "Què eren?"
	done

EcruteakCityFisherText:
	text "He sentit un rumor"
	line "sobre el FAR"
	cont "D'OLIVINE."

	para "El #MON que"
	line "serveix de far"

	para "ha emmalaltit."
	line "Sembla que tenen"
	cont "problemes."
	done

EcruteakCityFisherText_JasmineReturned:
	text "El #MON del FAR"
	line "D'OLIVINE s'ha"
	cont "curat."

	para "Els vaixells"
	line "poden navegar"
	cont "de nit una altra"
	cont "vegada."
	done

EcruteakCityYoungsterText:
	text "He sentit que els"
	line "#MON estan"

	para "descontrolats al"
	line "LLAC DE LA IRA."
	cont "M'agradaria veure."
	done

EcruteakCityGramps3Text:
	text "En un passat"
	line "llunyà…"

	para "Aquesta torre es"
	line "va cremar. Tres"

	para "#MON sense nom"
	line "hi van morir."

	para "Un #MON de"
	line "colors de l'arc"

	para "de Sant Martí va"
	line "baixar del cel i"
	cont "els va ressuscitar"

	para "És una llegenda"
	line "transmesa pels"

	para "LÍDERS DE GIMNÀS"
	line "D'ECRUTEAK."

	para "Jo?"

	para "Vaig ser"
	line "entrenador"
	cont "fa molt de temps."
	cont "Hohoho!"
	done

EcruteakCitySignText:
	text "CIUTAT D'ECRUTEAK"
	line "Ciutat Històrica"

	para "On el Passat"
	line "Troba el Present"
	done

TinTowerSignText:
	text "TORRE D'ESTANY"

	para "Diuen que un #-"
	line "MON llegendari"
	cont "s'hi refugia."
	done

EcruteakGymSignText:
	text "CIUTAT D'ECRUTEAK"
	line "GIMNÀS #MON"
	cont "LÍDER: MORTY"

	para "El Vident Místic"
	line "del Futur"
	done

EcruteakDanceTheaterSignText:
	text "TEATRE DE DANSA"
	line "D'ECRUTEAK"
	done

BurnedTowerSignText:
	text "TORRE CREMADA"

	para "Va ser destruïda"
	line "per un foc"
	cont "misteriós."

	para "Si us plau, no us"
	line "acosteu, és"
	cont "perillós."
	done

EcruteakCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 35, 26, ROUTE_42_ECRUTEAK_GATE, 1
	warp_event 35, 27, ROUTE_42_ECRUTEAK_GATE, 2
	warp_event 18, 11, ECRUTEAK_TIN_TOWER_ENTRANCE, 1
	warp_event 20,  2, WISE_TRIOS_ROOM, 1
	warp_event 20,  3, WISE_TRIOS_ROOM, 2
	warp_event 23, 27, ECRUTEAK_POKECENTER_1F, 1
	warp_event  5, 21, ECRUTEAK_LUGIA_SPEECH_HOUSE, 1
	warp_event 23, 21, DANCE_THEATER, 1
	warp_event 29, 21, ECRUTEAK_MART, 2
	warp_event  6, 27, ECRUTEAK_GYM, 1
	warp_event 13, 27, ECRUTEAK_ITEMFINDER_HOUSE, 1
	warp_event 37,  7, TIN_TOWER_1F, 1
	warp_event  5,  5, BURNED_TOWER_1F, 1
	warp_event  0, 18, ROUTE_38_ECRUTEAK_GATE, 3
	warp_event  0, 19, ROUTE_38_ECRUTEAK_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 15, 21, BGEVENT_READ, EcruteakCitySign
	bg_event 38, 10, BGEVENT_READ, TinTowerSign
	bg_event  8, 28, BGEVENT_READ, EcruteakGymSign
	bg_event 21, 21, BGEVENT_READ, EcruteakDanceTheaterSign
	bg_event  2, 10, BGEVENT_READ, BurnedTowerSign
	bg_event 24, 27, BGEVENT_READ, EcruteakCityPokecenterSign
	bg_event 30, 21, BGEVENT_READ, EcruteakCityMartSign
	bg_event 23, 14, BGEVENT_ITEM, EcruteakCityHiddenHyperPotion

	def_object_events
	object_event 18, 15, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps1Script, -1
	object_event 20, 21, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps2Script, -1
	object_event 21, 29, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass1Script, -1
	object_event  3,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass2Script, -1
	object_event  9, 22, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakCityFisherScript, -1
	object_event 10, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakCityYoungsterScript, -1
	object_event  3,  7, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps3Script, EVENT_ECRUTEAK_CITY_GRAMPS
