object_const_def
	const KOGASROOM_KOGA

KogasRoom_MapScripts:
	def_scene_scripts
	scene_script KogasRoomLockDoorScene, SCENE_KOGASROOM_LOCK_DOOR
	scene_script KogasRoomNoopScene,     SCENE_KOGASROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, KogasRoomDoorsCallback

KogasRoomLockDoorScene:
	sdefer KogasRoomDoorLocksBehindYouScript
	end

KogasRoomNoopScene:
	end

KogasRoomDoorsCallback:
	checkevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_KOGAS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	endcallback

KogasRoomDoorLocksBehindYouScript:
	applymovement PLAYER, KogasRoom_EnterMovement
	reanchormap $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	refreshmap
	closetext
	setscene SCENE_KOGASROOM_NOOP
	setevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

KogaScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_KOGA
	iftrue KogaScript_AfterBattle
	writetext KogaScript_KogaBeforeText
	waitbutton
	closetext
	winlosstext KogaScript_KogaBeatenText, 0
	loadtrainer KOGA, KOGA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_KOGA
	opentext
	writetext KogaScript_KogaDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	refreshmap
	closetext
	setevent EVENT_KOGAS_ROOM_EXIT_OPEN
	waitsfx
	end

KogaScript_AfterBattle:
	writetext KogaScript_KogaDefeatText
	waitbutton
	closetext
	end

KogasRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

KogaScript_KogaBeforeText:
	text "Muahahaha!"

	para "Soc KOGA, de"
	line "l'ALTA CÚPULA."

	para "Visc a les ombres,"
	line "soc un ninja!"

	para "El meu estil"
	line "intricat et"
	cont "confondrà!"

	para "Confusió, son,"
	line "verí…"

	para "Prepara't per ser"
	line "la víctima de la"
	cont "meva tècnica!"

	para "Muahahaha!"

	para "Els # no són"
	line "només força"

	para "bruta. Ho veuràs"
	line "aviat!"
	done

KogaScript_KogaBeatenText:
	text "Ah!"
	line "Has demostrat"
	cont "la teva vàlua!"
	done

KogaScript_KogaDefeatText:
	text "T'he sotmès a tot"
	line "el que he pogut"
	cont "reunir."

	para "Però he fallat."
	line "He de perfeccionar"
	cont "les meves arts."

	para "Ves a la sala"
	line "següent i posa a"
	cont "prova les teves"
	cont "habilitats!"
	done

KogasRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, WILLS_ROOM, 2
	warp_event  5, 17, WILLS_ROOM, 3
	warp_event  4,  2, BRUNOS_ROOM, 1
	warp_event  5,  2, BRUNOS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_KOGA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KogaScript_Battle, -1
