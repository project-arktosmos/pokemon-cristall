object_const_def
const ECRUTEAKTINTOWERENTRANCE_SAGE1
const ECRUTEAKTINTOWERENTRANCE_SAGE2
const ECRUTEAKTINTOWERENTRANCE_SAGE3
const ECRUTEAKTINTOWERENTRANCE_GRAMPS

EcruteakTinTowerEntrance_MapScripts:
	def_scene_scripts
	scene_script EcruteakTinTowerEntranceNoop1Scene, SCENE_ECRUTEAKTINTOWERENTRANCE_SAGE_BLOCKS
	scene_script EcruteakTinTowerEntranceNoop2Scene, SCENE_ECRUTEAKTINTOWERENTRANCE_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, EcruteakTinTowerEntranceInitializeSagesCallback

EcruteakTinTowerEntranceNoop1Scene:
	end

EcruteakTinTowerEntranceNoop2Scene:
	end

EcruteakTinTowerEntranceInitializeSagesCallback:
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue .DontBlockTower
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .DontBlockTower
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .BlockTower
	endcallback

.BlockTower:
	clearevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_RANG_CLEAR_BELL_2
	setevent EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_WANDERING_SAGE
	checkitem CLEAR_BELL
	iftrue .NoClearBell
	setscene SCENE_ECRUTEAKTINTOWERENTRANCE_SAGE_BLOCKS
.NoClearBell:
	endcallback

.DontBlockTower:
	clearevent EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_WANDERING_SAGE
	endcallback

EcruteakTinTowerEntranceSageBlocksLeft:
	checkevent EVENT_RANG_CLEAR_BELL_2
	iftrue EcruteakTinTowerEntranceAlreadyBlocked
	applymovement ECRUTEAKTINTOWERENTRANCE_SAGE2, EcruteakTinTowerEntranceSageBlocksLeftMovement
	moveobject ECRUTEAKTINTOWERENTRANCE_SAGE1, 4, 6
	appear ECRUTEAKTINTOWERENTRANCE_SAGE1
	pause 5
	disappear ECRUTEAKTINTOWERENTRANCE_SAGE2
	end

EcruteakTinTowerEntranceSageBlocksRight:
	checkevent EVENT_RANG_CLEAR_BELL_1
	iftrue EcruteakTinTowerEntranceAlreadyBlocked
	applymovement ECRUTEAKTINTOWERENTRANCE_SAGE1, EcruteakTinTowerEntranceSageBlocksRightMovement
	moveobject ECRUTEAKTINTOWERENTRANCE_SAGE2, 5, 6
	appear ECRUTEAKTINTOWERENTRANCE_SAGE2
	pause 5
	disappear ECRUTEAKTINTOWERENTRANCE_SAGE1
	end

EcruteakTinTowerEntranceAlreadyBlocked:
	end

EcruteakTinTowerEntranceSageScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .CheckForClearBell
	checkflag ENGINE_FOGBADGE
	iftrue .BlockPassage_GotFogBadge
	writetext EcruteakTinTowerEntranceSageText
	waitbutton
	closetext
	end

.BlockPassage_GotFogBadge:
	writetext EcruteakTinTowerEntranceSageText_GotFogBadge
	waitbutton
	closetext
	end

.CheckForClearBell:
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .AllowedThrough
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .RangClearBell
	checkitem CLEAR_BELL
	iftrue .GotClearBell
	writetext EcruteakTinTowerEntranceSageText_NoClearBell
	waitbutton
	closetext
	end

.GotClearBell:
	writetext EcruteakTinTowerEntranceSageText_HearsClearBell
	waitbutton
	closetext
	setscene SCENE_ECRUTEAKTINTOWERENTRANCE_NOOP
	setevent EVENT_RANG_CLEAR_BELL_2
	clearevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end

.AllowedThrough:
	writetext EcruteakTinTowerEntranceSageText_PleaseDoGoOn
	waitbutton
	closetext
	end

.RangClearBell:
	writetext EcruteakTinTowerEntranceSageText_HeardClearBell
	waitbutton
	closetext
	end

EcruteakTinTowerEntranceWanderingSageScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_CLEAR_BELL
	iftrue .GotClearBell
	writetext EcruteakTinTowerEntranceWanderingSageText
	waitbutton
	closetext
	end

.GotClearBell:
	writetext EcruteakTinTowerEntranceWanderingSageText_GotClearBell
	waitbutton
	closetext
	end

EcruteakTinTowerEntranceGrampsScript:
	jumptextfaceplayer EcruteakTinTowerEntranceGrampsText

EcruteakTinTowerEntranceSageBlocksLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	turn_head DOWN
	step_end

EcruteakTinTowerEntranceSageBlocksRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	turn_head DOWN
	step_end

EcruteakTinTowerEntranceSageText:
	text "L'accés a la TORRE"
	line "CAMPANA és vetat"

	para "a qui no tingui la"
	line "MEDALLA d'ECRUTEAK"

	para "Disculpa, però has"
	line "de marxar."
	done

EcruteakTinTowerEntranceSageText_GotFogBadge:
	text "L'accés a la TORRE"
	line "CAMPANA és vetat"

	para "a qui no tingui la"
	line "MEDALLA d'ECRUTEAK"

	para "Ah!"

	para "La MEDALLA"
	line "d'ECRUTEAK! Passa,"
	cont "si us plau."
	done

EcruteakTinTowerEntranceSageText_NoClearBell:
	text "Ha succeït un"
	line "fet transcendental"

	para "Disculpa, però he"
	line "de demanar-te que"
	cont "te'n vagis."

	para "…Allò que calma"
	line "l'ànima…"

	para "El TRIO SAVI diu"
	line "coses que són tan"

	para "difícils"
	line "d'entendre…"
	done

EcruteakTinTowerEntranceSageText_HearsClearBell:
	text "Ha succeït un"
	line "fet transcendental"

	para "Disculpa, però he"
	line "de demanar-te que"
	cont "te'n vagis."

	para "<……><……><……>"

	para "Ah!"

	para "El so d'aquesta"
	line "CAMPANA CLARA!"

	para "És… És sublim!"

	para "Mai no havia"
	line "sentit un so tan"
	cont "bell!"

	para "El so d'aquesta"
	line "campana reflecteix"
	cont "l'ànima del qui la"
	cont "porta."

	para "Tu…"

	para "Potser podràs"
	line "arribar al cim de"
	cont "la TORRE CAMPANA."

	para "Passa, si us plau."
	done

EcruteakTinTowerEntranceSageText_PleaseDoGoOn:
	text "Passa, si us plau."
	done

EcruteakTinTowerEntranceSageText_HeardClearBell:
	text "El so d'aquesta"
	line "campana reflecteix"
	cont "l'ànima del qui la"
	cont "porta."

	para "Tu…"

	para "Potser podràs"
	line "arribar al cim de"
	cont "la TORRE CAMPANA."

	para "Passa, si us plau."
	done

EcruteakTinTowerEntranceWanderingSageText:
	text "La TORRE CAMPANA"
	line "és una torre de"

	para "nou pisos d'una"
	line "bellesa divina."

	para "Calma l'ànima de"
	line "tots els qui la"
	cont "contemplen."
	done

EcruteakTinTowerEntranceWanderingSageText_GotClearBell:
	text "La TORRE CAMPANA"
	line "ha tremolat! Un"

	para "#MON deu haver"
	line "tornat al cim!"
	done

EcruteakTinTowerEntranceGrampsText:
	text "Dues torres…"
	line "Dos #MON…"

	para "Però quan una"
	line "es va cremar, els"

	para "#MON van fugir"
	line "per no tornar mai."
	done

EcruteakTinTowerEntrance_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, ECRUTEAK_CITY, 3
	warp_event  5, 17, ECRUTEAK_CITY, 3
	warp_event  5,  3, ECRUTEAK_TIN_TOWER_ENTRANCE, 4
	warp_event 17, 15, ECRUTEAK_TIN_TOWER_ENTRANCE, 3
	warp_event 17,  3, WISE_TRIOS_ROOM, 3

	def_coord_events
	coord_event  4,  7, SCENE_ECRUTEAKTINTOWERENTRANCE_SAGE_BLOCKS, EcruteakTinTowerEntranceSageBlocksLeft
	coord_event  5,  7, SCENE_ECRUTEAKTINTOWERENTRANCE_SAGE_BLOCKS, EcruteakTinTowerEntranceSageBlocksRight

	def_bg_events

	def_object_events
	object_event  4,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceSageScript, EVENT_RANG_CLEAR_BELL_1
	object_event  5,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceSageScript, EVENT_RANG_CLEAR_BELL_2
	object_event  6,  9, SPRITE_SAGE, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceWanderingSageScript, EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_WANDERING_SAGE
	object_event  3, 11, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceGrampsScript, EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_WANDERING_SAGE
