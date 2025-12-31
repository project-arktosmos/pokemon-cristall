	object_const_def
	const BATTLETOWEROUTSIDE_STANDING_YOUNGSTER
	const BATTLETOWEROUTSIDE_BEAUTY
	const BATTLETOWEROUTSIDE_SAILOR
	const BATTLETOWEROUTSIDE_LASS

BattleTowerOutside_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, BattleTowerOutsideNoopCallback
	callback MAPCALLBACK_OBJECTS, BattleTowerOutsideShowCiviliansCallback

BattleTowerOutsideNoopCallback:
	endcallback

BattleTowerOutsideShowCiviliansCallback:
	clearevent EVENT_BATTLE_TOWER_OPEN_CIVILIANS
	endcallback

BattleTowerOutsideYoungsterScript:
	jumptextfaceplayer BattleTowerOutsideYoungsterText

BattleTowerOutsideBeautyScript:
	jumptextfaceplayer BattleTowerOutsideBeautyText

BattleTowerOutsideSailorScript:
	jumptextfaceplayer BattleTowerOutsideSailorText

BattleTowerOutsideSign:
	jumptext BattleTowerOutsideSignText

BattleTowerOutsideYoungsterText_NotYetOpen: ; unreferenced
	text "Uau, la TORRE"
	line "BATALLA és enorme!"

	para "Em fa mal el coll"
	line "de mirar amunt."
	done

BattleTowerOutsideYoungsterText_Mobile: ; unreferenced
	text "Uau, la TORRE"
	line "BATALLA és enorme!"

	para "Com que hi ha"
	line "molts entrenadors"

	para "a dins, hi deu"
	line "haver una gran"

	para "varietat de"
	line "#MON."
	done

BattleTowerOutsideYoungsterText:
	text "Uau, la TORRE"
	line "BATALLA és enorme!"

	para "Hi deu haver molts"
	line "tipus de #MON"
	cont "allà dins!"
	done

BattleTowerOutsideBeautyText_NotYetOpen: ; unreferenced
	text "Què deu ser això?"
	line "Què s'hi fa aquí?"

	para "Pel nom, suposo"
	line "que deu ser per a"

	para "combats de"
	line "#MON."
	done

BattleTowerOutsideBeautyText:
	text "Només pots fer"
	line "servir tres"
	cont "#MON."

	para "És tan difícil"
	line "decidir quins tres"

	para "han d'entrar en"
	line "combat…"
	done

BattleTowerOutsideSailorText_Mobile: ; unreferenced
	text "Ehehehe…"
	line "M'he escapat de la"
	cont "feina per venir."

	para "No em rendiré fins"
	line "que sigui un"
	cont "LÍDER!"
	done

BattleTowerOutsideSailorText:
	text "Hehehe, m'he"
	line "escapat de feina."

	para "No puc marxar fins"
	line "que no guanyi!"

	para "Ho he de guanyar"
	line "tot. Sí, senyor!"
	done

BattleTowerOutsideSignText_NotYetOpen: ; unreferenced
; originally shown when the Battle Tower was closed
	text "TORRE BATALLA"
	done

BattleTowerOutsideSignText:
	text "TORRE BATALLA"

	para "Accepta el Repte"
	line "Definitiu!"
	done

BattleTowerOutsideText_DoorsClosed: ; unreferenced
; originally shown when the Battle Tower was closed
	text "Les portes de la"
	line "TORRE BATALLA…"
	cont "estan tancades."
	done

BattleTowerOutsideText_DoorsOpen: ; unreferenced
; originally shown after the Battle Tower opened
	text "Està oberta!"
	done

BattleTowerOutside_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 21, ROUTE_40_BATTLE_TOWER_GATE, 3
	warp_event  9, 21, ROUTE_40_BATTLE_TOWER_GATE, 4
	warp_event  8,  9, BATTLE_TOWER_1F, 1
	warp_event  9,  9, BATTLE_TOWER_1F, 2

	def_coord_events

	def_bg_events
	bg_event 10, 10, BGEVENT_READ, BattleTowerOutsideSign

	def_object_events
	object_event  6, 12, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideYoungsterScript, -1
	object_event 13, 11, SPRITE_BEAUTY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideBeautyScript, -1
	object_event 12, 18, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideSailorScript, EVENT_BATTLE_TOWER_OPEN_CIVILIANS
	object_event 12, 24, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
