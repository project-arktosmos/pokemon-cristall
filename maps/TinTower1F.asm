	object_const_def
	const TINTOWER1F_SUICUNE
	const TINTOWER1F_RAIKOU
	const TINTOWER1F_ENTEI
	const TINTOWER1F_EUSINE
	const TINTOWER1F_SAGE1
	const TINTOWER1F_SAGE2
	const TINTOWER1F_SAGE3
	const TINTOWER1F_SAGE4
	const TINTOWER1F_SAGE5
	const TINTOWER1F_SAGE6

TinTower1F_MapScripts:
	def_scene_scripts
	scene_script TinTower1FSuicuneBattleScene, SCENE_TINTOWER1F_SUICUNE_BATTLE
	scene_script TinTower1FNoopScene,          SCENE_TINTOWER1F_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, TinTower1FNPCsCallback
	callback MAPCALLBACK_TILES, TinTower1FStairsCallback

TinTower1FSuicuneBattleScene:
	sdefer TinTower1FSuicuneBattleScript
	end

TinTower1FNoopScene:
	end

TinTower1FNPCsCallback:
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue .GotRainbowWing
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .FaceBeasts
	special BeastsCheck
	iffalse .FaceBeasts
	clearevent EVENT_TIN_TOWER_1F_WISE_TRIO_2
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
.GotRainbowWing:
	checkevent EVENT_FOUGHT_HO_OH
	iffalse .Done
	appear TINTOWER1F_EUSINE
.Done:
	endcallback

.FaceBeasts:
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue .FoughtSuicune
	appear TINTOWER1F_SUICUNE
	setval RAIKOU
	special MonCheck
	iftrue .NoRaikou
	appear TINTOWER1F_RAIKOU
	sjump .CheckEntei

.NoRaikou:
	disappear TINTOWER1F_RAIKOU
.CheckEntei:
	setval ENTEI
	special MonCheck
	iftrue .NoEntei
	appear TINTOWER1F_ENTEI
	sjump .BeastsDone

.NoEntei:
	disappear TINTOWER1F_ENTEI
.BeastsDone:
	endcallback

.FoughtSuicune:
	disappear TINTOWER1F_SUICUNE
	disappear TINTOWER1F_RAIKOU
	disappear TINTOWER1F_ENTEI
	clearevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_2
	endcallback

TinTower1FStairsCallback:
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue .DontHideStairs
	changeblock 10, 2, $09 ; floor
.DontHideStairs:
	endcallback

TinTower1FSuicuneBattleScript:
	applymovement PLAYER, TinTower1FPlayerEntersMovement
	pause 15
	setval RAIKOU
	special MonCheck
	iftrue .Next1 ; if player caught Raikou, it doesn't appear in Tin Tower
	applymovement TINTOWER1F_RAIKOU, TinTower1FRaikouApproachesMovement
	turnobject PLAYER, LEFT
	cry RAIKOU
	pause 10
	playsound SFX_WARP_FROM
	applymovement TINTOWER1F_RAIKOU, TinTower1FRaikouLeavesMovement
	disappear TINTOWER1F_RAIKOU
	playsound SFX_EXIT_BUILDING
	waitsfx
.Next1:
	setval ENTEI
	special MonCheck
	iftrue .Next2 ; if player caught Entei, it doesn't appear in Tin Tower
	applymovement TINTOWER1F_ENTEI, TinTower1FEnteiApproachesMovement
	turnobject PLAYER, RIGHT
	cry ENTEI
	pause 10
	playsound SFX_WARP_FROM
	applymovement TINTOWER1F_ENTEI, TinTower1FEnteiLeavesMovement
	disappear TINTOWER1F_ENTEI
	playsound SFX_EXIT_BUILDING
	waitsfx
.Next2:
	turnobject PLAYER, UP
	pause 10
	applymovement PLAYER, TinTower1FPlayerBacksUpMovement
	applymovement TINTOWER1F_SUICUNE, TinTower1FSuicuneApproachesMovement
	cry SUICUNE
	pause 20
	loadwildmon SUICUNE, 40
	loadvar VAR_BATTLETYPE, BATTLETYPE_SUICUNE
	startbattle
	dontrestartmapmusic
	disappear TINTOWER1F_SUICUNE
	setevent EVENT_FOUGHT_SUICUNE
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	setmapscene ROUTE_42, SCENE_ROUTE42_NOOP
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_36
	setmapscene ROUTE_36, SCENE_ROUTE36_NOOP
	setevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	setmapscene CIANWOOD_CITY, SCENE_CIANWOODCITY_NOOP
	setscene SCENE_TINTOWER1F_NOOP
	clearevent EVENT_SET_WHEN_FOUGHT_HO_OH
	reloadmapafterbattle
	pause 20
	turnobject PLAYER, DOWN
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_EUSINE, 10, 15
	appear TINTOWER1F_EUSINE
	applymovement TINTOWER1F_EUSINE, TinTower1FEusineEntersMovement
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE1, 9, 15
	appear TINTOWER1F_SAGE1
	applymovement TINTOWER1F_SAGE1, TinTower1FSage1EntersMovement
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE2, 9, 15
	appear TINTOWER1F_SAGE2
	applymovement TINTOWER1F_SAGE2, TinTower1FSage2EntersMovement
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE3, 9, 15
	appear TINTOWER1F_SAGE3
	applymovement TINTOWER1F_SAGE3, TinTower1FSage3EntersMovement
	moveobject TINTOWER1F_SAGE1, 7, 13
	moveobject TINTOWER1F_SAGE2, 9, 13
	moveobject TINTOWER1F_SAGE3, 11, 13
	turnobject PLAYER, RIGHT
	opentext
	writetext TinTower1FEusineSuicuneText
	waitbutton
	closetext
	applymovement TINTOWER1F_EUSINE, TinTower1FEusineLeavesMovement
	playsound SFX_EXIT_BUILDING
	disappear TINTOWER1F_EUSINE
	waitsfx
	special FadeOutMusic
	pause 20
	playmapmusic
	end

TinTower1FSage1Script:
	jumptextfaceplayer TinTower1FSage1Text

TinTower1FSage2Script:
	jumptextfaceplayer TinTower1FSage2Text

TinTower1FSage3Script:
	jumptextfaceplayer TinTower1FSage3Text

TinTower1FSage4Script:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .FoughtHoOh
	jumptextfaceplayer TinTower1FSage4Text1

.FoughtHoOh:
	jumptextfaceplayer TinTower1FSage4Text2

TinTower1FSage5Script:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .FoughtHoOh
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue .GotRainbowWing
	writetext TinTower1FSage5Text1
	promptbutton
	verbosegiveitem RAINBOW_WING
	closetext
	reanchormap
	earthquake 72
	waitsfx
	playsound SFX_STRENGTH
	changeblock 10, 2, $20 ; stairs
	refreshmap
	setevent EVENT_GOT_RAINBOW_WING
	closetext
	opentext
.GotRainbowWing:
	writetext TinTower1FSage5Text2
	waitbutton
	closetext
	end

.FoughtHoOh:
	writetext TinTower1FSage5Text3
	waitbutton
	closetext
	end

TinTower1FSage6Script:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .FoughtHoOh
	jumptextfaceplayer TinTower1FSage6Text1

.FoughtHoOh:
	jumptextfaceplayer TinTower1FSage6Text2

TinTower1FEusine:
	jumptextfaceplayer TinTower1FEusineHoOhText

TinTower1FPlayerEntersMovement:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

TinTower1FRaikouApproachesMovement:
	set_sliding
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTower1FRaikouLeavesMovement:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step RIGHT
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTower1FEnteiApproachesMovement:
	set_sliding
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTower1FEnteiLeavesMovement:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step LEFT
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTower1FSuicuneApproachesMovement:
	set_sliding
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTower1FPlayerBacksUpMovement:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

TinTower1FEusineEntersMovement:
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

TinTower1FEusineLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step_end

TinTower1FSage1EntersMovement:
	step UP
	step UP
	step LEFT
	step LEFT
	turn_head UP
	step_end

TinTower1FSage2EntersMovement:
	step UP
	step UP
	step_end

TinTower1FSage3EntersMovement:
	step UP
	step RIGHT
	step RIGHT
	step UP
	step_end

TinTower1FEusineSuicuneText:
	text "EUSINE: Genial!"
	line "Massa genial!"

	para "No havia vist mai"
	line "un combat així."

	para "Ha estat molt"
	line "inspirador."

	para "SUICUNE era fort,"
	line "però tu eres"

	para "encara millor,"
	line "<PLAYER>."

	para "He sentit que el"
	line "poder místic de"

	para "SUICUNE invoca un"
	line "#MON arc de St."

	para "Potser el que ha"
	line "passat avui farà"

	para "que aparegui"
	line "aquest #MON."

	para "Estudiaré més"
	line "les llegendes."

	para "Gràcies per"
	line "mostrar-me aquest"
	cont "combat fantàstic."

	para "Adéu, <PLAYER>!"
	done

TinTower1FSage1Text:
	text "Segons la"
	line "llegenda…"

	para "Quan les ànimes"
	line "dels #MON i els"

	para "humans es comunin,"
	line "del cel baixa un"

	para "#MON de colors"
	line "de l'arc de St.…"

	para "Voldrà dir que"
	line "els #MON"

	para "llegendaris posen"
	line "a prova els humans"
	done

TinTower1FSage2Text:
	text "Quan la TORRE DE"
	line "BRONZE va cremar,"

	para "es diu que tres"
	line "#MON sense nom"

	para "van morir."
	line "Va ser tràgic."

	para "No obstant…"

	para "Un #MON de"
	line "l'arc de St.…"

	para "És a dir…"

	para "HO-OH va baixar"
	line "del cel i va donar"

	para "nova vida als"
	line "tres #MON."

	para "Són…"

	para "SUICUNE, ENTEI i"
	line "RAIKOU."

	para "Això és el que"
	line "diuen."
	done

TinTower1FSage3Text:
	text "Es diu que les"
	line "dues TORRES van"

	para "ser construïdes"
	line "per fomentar"

	para "l'amistat i"
	line "l'esperança entre"

	para "#MON i"
	line "persones."

	para "Fa 700 anys,"
	line "però l'ideal"

	para "segueix sent"
	line "important avui."
	done

TinTower1FSage4Text1:
	text "Sembla que HO-OH"
	line "ha baixat a"

	para "aquesta, la TORRE"
	line "CAMPANA!"
	done

TinTower1FSage5Text1:
	text "Això et protegirà."
	line "Pren-ho."
	done

TinTower1FSage5Text2:
	text "Ara, vés."
	done

TinTower1FSage6Text1:
	text "Crec que t'estan"
	line "posant a prova."

	para "Allibera la ment"
	line "de la incertesa,"
	cont "i avança."
	done

TinTower1FEusineHoOhText:
	text "Ho sabia."

	para "Sabia que veuries"
	line "el #MON de"

	para "colors de l'arc"
	line "de St., <PLAYER>."

	para "Ha passat tal com"
	line "ho havia previst."

	para "La meva recerca"
	line "no és dolenta."

	para "Seguiré estudiant"
	line "#MON per ser un"

	para "#MANIAC famós!"
	done

TinTower1FSage4Text2:
	text "Es diu que els"
	line "#MON"
	cont "llegendaris"

	para "encarnen tres"
	line "poders…"

	para "El llamp que va"
	line "colpejar la TORRE."

	para "El foc que va"
	line "cremar la TORRE."

	para "I la pluja que va"
	line "apagar el foc…"
	done

TinTower1FSage5Text3:
	text "Quan els #MON"
	line "llegendaris van"
	cont "aparèixer…"

	para "Van aterrir els"
	line "que van veure"
	cont "el seu ascens."

	para "I…"

	para "Alguns fins i tot"
	line "els van atacar."

	para "Els #MON"
	line "llegendaris,"

	para "sabent el seu"
	line "poder, van fugir,"

	para "ignorant la gent"
	line "espantada."
	done

TinTower1FSage6Text2:
	text "Dels #MON"
	line "llegendaris,"

	para "es diu que SUICUNE"
	line "és el més proper"
	cont "a HO-OH."

	para "He sentit que pot"
	line "haver-hi un vincle"

	para "amb els #MON"
	line "coneguts com UNOWN"

	para "Els #MON UNOWN"
	line "han de compartir"

	para "un vincle de"
	line "cooperació amb"
	cont "SUICUNE."
	done

TinTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 15, ECRUTEAK_CITY, 12
	warp_event 10, 15, ECRUTEAK_CITY, 12
	warp_event 10,  2, TIN_TOWER_2F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  9, SPRITE_SUICUNE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_1F_SUICUNE
	object_event  7,  9, SPRITE_RAIKOU, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_1F_RAIKOU
	object_event 12,  9, SPRITE_ENTEI, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_1F_ENTEI
	object_event  8,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TinTower1FEusine, EVENT_TIN_TOWER_1F_EUSINE
	object_event  5,  9, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage1Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event 11, 11, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage2Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event 14,  6, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage3Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event  4,  2, SPRITE_SAGE, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage4Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	object_event  9,  1, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage5Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	object_event 14,  2, SPRITE_SAGE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage6Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
