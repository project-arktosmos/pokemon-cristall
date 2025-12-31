	object_const_def
	const ROUTE40BATTLETOWERGATE_ROCKER
	const ROUTE40BATTLETOWERGATE_TWIN

Route40BattleTowerGate_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, RouteBattleTowerGateShowSailorCallback

RouteBattleTowerGateShowSailorCallback:
	clearevent EVENT_BATTLE_TOWER_OPEN_CIVILIANS
	endcallback

Route40BattleTowerGateRockerScript:
	jumptextfaceplayer Route40BattleTowerGateRockerText

Route40BattleTowerGateTwinScript:
	jumptextfaceplayer Route40BattleTowerGateTwinText

Route40BattleTowerGateUnusedText1: ; unreferenced
	text "Has vingut a"
	line "veure la TORRE"
	cont "BATALLA també?"

	para "Però encara no"
	line "s'hi pot entrar."
	done

Route40BattleTowerGateUnusedText2: ; unreferenced
	text "La TORRE BATALLA"
	line "ha obert."

	para "Vull anar-hi,"
	line "però no he pensat"

	para "cap frase per"
	line "quan guanyi."
	done

Route40BattleTowerGateRockerText:
	text "Vas a la TORRE"
	line "BATALLA?"

	para "Això és un secret"
	line "però si guanyes"

	para "molt, pots rebre"
	line "regals especials."
	done

Route40BattleTowerGateUnusedText3: ; unreferenced
	text "Entrenaré els"
	line "meus #MON per"

	para "estar preparat"
	line "per la TORRE."
	done

Route40BattleTowerGateTwinText:
	text "Els nivells dels"
	line "#MON que vull"

	para "fer servir són"
	line "tots diferents."

	para "Els he d'anar a"
	line "entrenar ara!"
	done

Route40BattleTowerGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, ROUTE_40, 1
	warp_event  5,  7, ROUTE_40, 1
	warp_event  4,  0, BATTLE_TOWER_OUTSIDE, 1
	warp_event  5,  0, BATTLE_TOWER_OUTSIDE, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateRockerScript, EVENT_BATTLE_TOWER_OPEN_CIVILIANS
	object_event  7,  5, SPRITE_TWIN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateTwinScript, -1
