	object_const_def
	const CELADONCITY_FISHER
	const CELADONCITY_POLIWAG
	const CELADONCITY_TEACHER1
	const CELADONCITY_GRAMPS1
	const CELADONCITY_GRAMPS2
	const CELADONCITY_YOUNGSTER1
	const CELADONCITY_YOUNGSTER2
	const CELADONCITY_TEACHER2
	const CELADONCITY_LASS

CeladonCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CeladonCityFlypointCallback

CeladonCityFlypointCallback:
	setflag ENGINE_FLYPOINT_CELADON
	endcallback

CeladonCityFisherScript:
	jumptextfaceplayer CeladonCityFisherText

CeladonCityPoliwrath:
	opentext
	writetext CeladonCityPoliwrathText
	cry POLIWRATH
	waitbutton
	closetext
	end

CeladonCityTeacher1Script:
	jumptextfaceplayer CeladonCityTeacher1Text

CeladonCityGramps1Script:
	jumptextfaceplayer CeladonCityGramps1Text

CeladonCityGramps2Script:
	jumptextfaceplayer CeladonCityGramps2Text

CeladonCityYoungster1Script:
	jumptextfaceplayer CeladonCityYoungster1Text

CeladonCityYoungster2Script:
	jumptextfaceplayer CeladonCityYoungster2Text

CeladonCityTeacher2Script:
	jumptextfaceplayer CeladonCityTeacher2Text

CeladonCityLassScript:
	jumptextfaceplayer CeladonCityLassText

CeladonCitySign:
	jumptext CeladonCitySignText

CeladonGymSign:
	jumptext CeladonGymSignText

CeladonCityDeptStoreSign:
	jumptext CeladonCityDeptStoreSignText

CeladonCityMansionSign:
	jumptext CeladonCityMansionSignText

CeladonCityGameCornerSign:
	jumptext CeladonCityGameCornerSignText

CeladonCityTrainerTips:
	jumptext CeladonCityTrainerTipsText

CeladonCityPokecenterSign:
	jumpstd PokecenterSignScript

CeladonCityHiddenPpUp:
	hiddenitem PP_UP, EVENT_CELADON_CITY_HIDDEN_PP_UP

CeladonCityFisherText:
	text "Aquest POLIWRATH"
	line "és el meu company."

	para "Em pregunto si"
	line "algun dia evolu-"
	cont "cionarà a granota."
	done

CeladonCityPoliwrathText:
	text "POLIWRATH: Croac!"
	done

CeladonCityTeacher1Text:
if DEF(_CRYSTAL_AU)
	text "He perdut a les"
	line "màquines."
	done
else
	text "He tornat a perdre"
	line "a les màquines…"

	para "Les noies també"
	line "juguem ara."

	para "Tu també hauries"
	line "de provar-les."
	done
endc

CeladonCityGramps1Text:
	text "Últimament aparei-"
	line "xen molts GRIMER."

	para "Veus aquell estany"
	line "davant de casa?"

	para "Ara hi viuen"
	line "GRIMER."

	para "D'on han sortit?"
	line "És un problema"
	cont "greu…"
	done

CeladonCityGramps2Text:
	text "Nihihi! Aquest GIM"
	line "és genial!"

	para "Només s'hi admeten"
	line "noies!"
	done

CeladonCityYoungster1Text:
	text "Vols saber un"
	line "secret?"

	para "La MANSIÓ CELADON"
	line "té una porta del"
	cont "darrere amagada."
	done

CeladonCityYoungster2Text:
	text "Fan un concurs de"
	line "menjar al"
	cont "restaurant."

	para "Només de mirar-los"
	line "ja em sento"
	cont "tip…"
	done

CeladonCityTeacher2Text:
	text "Els GRANS MAGAT-"
	line "ZEMS CELADON tenen"

	para "la millor selecció"
	line "de productes."

	para "Si no ho trobes"
	line "allà, no ho"

	para "trobaràs enlloc."

	para "Semblo una"
	line "dependenta…"
	done

CeladonCityLassText_Mobile: ; unreferenced
	text "M'encanta estar"
	line "envoltada"
	cont "d'edificis alts!"

	para "És cert que el"
	line "CENTRE # de"

	para "POKEMON DAURADA"
	line "l'han fet molt"
	cont "més gran?"

	para "Què genial!"
	line "M'agradaria tenir"

	para "un lloc així a"
	line "KANTO…"
	done

CeladonCityLassText:
	text "Mirar a terra"
	line "mentre caminava"

	para "m'ha marejat."
	done

CeladonCitySignText:
	text "CIUTAT CELADON"

	para "La Ciutat dels"
	line "Somnis de l'Arc"
	cont "de Sant Martí"
	done

CeladonGymSignText:
	text "GIM # DE"
	line "CIUTAT CELADON"
	cont "LÍDER: ERIKA"

	para "La Princesa"
	line "Amant de la"
	cont "Natura"
	done

CeladonCityDeptStoreSignText:
	text "Troba el que"
	line "necessites als"
	cont "G.M. CELADON!"
	done

CeladonCityMansionSignText:
	text "MANSIÓ CELADON"
	done

CeladonCityGameCornerSignText:
if DEF(_CRYSTAL_AU)
	text "Zona de Jocs per"
	line "a Adults--SALA DE"
	cont "JOCS CELADON"
	done
else
	text "Diversió per a"
	line "Tothom--SALA DE"
	cont "JOCS CELADON"
	done
endc

CeladonCityTrainerTipsText:
	text "CONSELLS"

	para "El GUARDAESP."
	line "protegeix els #"

	para "d'atacs ESPECIALS"
	line "com el foc i"
	cont "l'aigua."

	para "Compra objectes"
	line "als G.M. CELADON!"
	done

CeladonCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  9, CELADON_DEPT_STORE_1F, 1
	warp_event 16,  9, CELADON_MANSION_1F, 1
	warp_event 16,  3, CELADON_MANSION_1F, 3
	warp_event 17,  3, CELADON_MANSION_1F, 3
	warp_event 29,  9, CELADON_POKECENTER_1F, 1
	warp_event 18, 19, CELADON_GAME_CORNER, 1
	warp_event 23, 19, CELADON_GAME_CORNER_PRIZE_ROOM, 1
	warp_event 10, 29, CELADON_GYM, 1
	warp_event 25, 29, CELADON_CAFE, 1

	def_coord_events

	def_bg_events
	bg_event 23, 21, BGEVENT_READ, CeladonCitySign
	bg_event 11, 31, BGEVENT_READ, CeladonGymSign
	bg_event  6,  9, BGEVENT_READ, CeladonCityDeptStoreSign
	bg_event 13,  9, BGEVENT_READ, CeladonCityMansionSign
	bg_event 19, 21, BGEVENT_READ, CeladonCityGameCornerSign
	bg_event 29, 21, BGEVENT_READ, CeladonCityTrainerTips
	bg_event 30,  9, BGEVENT_READ, CeladonCityPokecenterSign
	bg_event 37, 21, BGEVENT_ITEM, CeladonCityHiddenPpUp

	def_object_events
	object_event 26, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityFisherScript, -1
	object_event 27, 11, SPRITE_POLIWAG, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCityPoliwrath, -1
	object_event 20, 24, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityTeacher1Script, -1
	object_event 14, 16, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeladonCityGramps1Script, -1
	object_event  8, 31, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityGramps2Script, -1
	object_event 18, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCityYoungster1Script, -1
	object_event 24, 33, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityYoungster2Script, -1
	object_event  6, 14, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityTeacher2Script, -1
	object_event  7, 22, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityLassScript, -1
