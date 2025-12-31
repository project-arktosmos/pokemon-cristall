	object_const_def
	const WILLSROOM_WILL

WillsRoom_MapScripts:
	def_scene_scripts
	scene_script WillsRoomLockDoorScene, SCENE_WILLSROOM_LOCK_DOOR
	scene_script WillsRoomNoopScene,     SCENE_WILLSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, WillsRoomDoorsCallback

WillsRoomLockDoorScene:
	sdefer WillsRoomDoorLocksBehindYouScript
	end

WillsRoomNoopScene:
	end

WillsRoomDoorsCallback:
	checkevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_WILLS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	endcallback

WillsRoomDoorLocksBehindYouScript:
	applymovement PLAYER, WillsRoom_EnterMovement
	reanchormap $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	refreshmap
	closetext
	setscene SCENE_WILLSROOM_NOOP
	setevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

WillScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_WILL
	iftrue WillScript_AfterBattle
	writetext WillScript_WillBeforeText
	waitbutton
	closetext
	winlosstext WillScript_WillBeatenText, 0
	loadtrainer WILL, WILL1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_WILL
	opentext
	writetext WillScript_WillDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	refreshmap
	closetext
	setevent EVENT_WILLS_ROOM_EXIT_OPEN
	waitsfx
	end

WillScript_AfterBattle:
	writetext WillScript_WillDefeatText
	waitbutton
	closetext
	end

WillsRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

WillScript_WillBeforeText:
	text "Benvingut a la"
	line "LLIGA #,"
	cont "<PLAYER>."

	para "Deixa'm presentar-"
	line "me. Sóc WILL."

	para "He entrenat arreu"
	line "del món, fent els"

	para "meus # psíquics"
	line "molt poderosos."

	para "I, per fi, m'han"
	line "acceptat a l'ALTA"
	cont "COMANDÀNCIA."

	para "Només puc seguir"
	line "millorant!"

	para "Perdre no és una"
	line "opció!"
	done

WillScript_WillBeatenText:
	text "No… no puc"
	line "creure-ho…"
	done

WillScript_WillDefeatText:
	text "Tot i que m'han"
	line "derrotat, no"
	cont "canviaré de camí."

	para "Seguiré lluitant"
	line "fins que estigui"

	para "per sobre de tots"
	line "els entrenadors!"

	para "Ara, <PLAYER>,"
	line "avança"
	cont "i experimenta"

	para "la ferocitat de"
	line "l'ALTA"
	cont "COMANDÀNCIA."
	done

WillsRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 17, INDIGO_PLATEAU_POKECENTER_1F, 4
	warp_event  4,  2, KOGAS_ROOM, 1
	warp_event  5,  2, KOGAS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_WILL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WillScript_Battle, -1
