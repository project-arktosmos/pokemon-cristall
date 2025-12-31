	object_const_def
	const CIANWOODCITY_STANDING_YOUNGSTER
	const CIANWOODCITY_POKEFAN_M
	const CIANWOODCITY_LASS
	const CIANWOODCITY_ROCK1
	const CIANWOODCITY_ROCK2
	const CIANWOODCITY_ROCK3
	const CIANWOODCITY_ROCK4
	const CIANWOODCITY_ROCK5
	const CIANWOODCITY_ROCK6
	const CIANWOODCITY_POKEFAN_F
	const CIANWOODCITY_EUSINE
	const CIANWOODCITY_SUICUNE

CianwoodCity_MapScripts:
	def_scene_scripts
	scene_script CianwoodCityNoop1Scene, SCENE_CIANWOODCITY_NOOP
	scene_script CianwoodCityNoop2Scene, SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CianwoodCityFlypointAndSuicuneCallback

CianwoodCityNoop1Scene:
	end

CianwoodCityNoop2Scene:
	end

CianwoodCityFlypointAndSuicuneCallback:
	setflag ENGINE_FLYPOINT_CIANWOOD
	setevent EVENT_EUSINE_IN_BURNED_TOWER
	checkevent EVENT_FOUGHT_EUSINE
	iffalse .Done
	disappear CIANWOODCITY_EUSINE
.Done:
	endcallback

CianwoodCitySuicuneAndEusine:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	playsound SFX_WARP_FROM
	applymovement CIANWOODCITY_SUICUNE, CianwoodCitySuicuneApproachMovement
	turnobject PLAYER, DOWN
	pause 15
	playsound SFX_WARP_FROM
	applymovement CIANWOODCITY_SUICUNE, CianwoodCitySuicuneDepartMovement
	disappear CIANWOODCITY_SUICUNE
	pause 10
	setscene SCENE_CIANWOODCITY_NOOP
	clearevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	setmapscene ROUTE_42, SCENE_ROUTE42_SUICUNE
	checkevent EVENT_FOUGHT_EUSINE
	iftrue .Done
	setevent EVENT_FOUGHT_EUSINE
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	appear CIANWOODCITY_EUSINE
	applymovement CIANWOODCITY_EUSINE, CianwoodCityEusineApproachMovement
	opentext
	writetext EusineSuicuneText
	waitbutton
	closetext
	winlosstext EusineBeatenText, 0
	setlasttalked CIANWOODCITY_EUSINE
	loadtrainer MYSTICALMAN, EUSINE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	opentext
	writetext EusineAfterText
	waitbutton
	closetext
	applymovement CIANWOODCITY_EUSINE, CianwoodCityEusineDepartMovement
	disappear CIANWOODCITY_EUSINE
	pause 20
	special FadeOutMusic
	playmapmusic
	pause 10
.Done:
	end

CianwoodCityChucksWife:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM02_FLY
	iftrue .GotFly
	writetext ChucksWifeEasierToFlyText
	promptbutton
	checkevent EVENT_BEAT_CHUCK
	iftrue .BeatChuck
	writetext ChucksWifeBeatChuckText
	waitbutton
	closetext
	end

.BeatChuck:
	writetext ChucksWifeGiveHMText
	promptbutton
	verbosegiveitem HM_FLY
	iffalse .Done
	setevent EVENT_GOT_HM02_FLY
	writetext ChucksWifeFlySpeechText
	promptbutton
.GotFly:
	writetext ChucksWifeChubbyText
	waitbutton
.Done:
	closetext
	end

CianwoodCityYoungster:
	jumptextfaceplayer CianwoodCityYoungsterText

CianwoodCityPokefanM:
	jumptextfaceplayer CianwoodCityPokefanMText

CianwoodCityLass:
	jumptextfaceplayer CianwoodCityLassText

CianwoodCityUnusedScript: ; unreferenced
	jumptextfaceplayer CianwoodCityUnusedText

CianwoodCitySign:
	jumptext CianwoodCitySignText

CianwoodGymSign:
	jumptext CianwoodGymSignText

CianwoodPharmacySign:
	jumptext CianwoodPharmacySignText

CianwoodPhotoStudioSign:
	jumptext CianwoodPhotoStudioSignText

CianwoodPokeSeerSign:
	jumptext CianwoodPokeSeerSignText

CianwoodPokecenterSign:
	jumpstd PokecenterSignScript

CianwoodCityRock:
	jumpstd SmashRockScript

CianwoodCityHiddenRevive:
	hiddenitem REVIVE, EVENT_CIANWOOD_CITY_HIDDEN_REVIVE

CianwoodCityHiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_CIANWOOD_CITY_HIDDEN_MAX_ETHER

CianwoodCitySuicuneApproachMovement:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step RIGHT
	remove_sliding
	step_end

CianwoodCitySuicuneDepartMovement:
	set_sliding
	fast_jump_step RIGHT
	fast_jump_step UP
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	remove_sliding
	step_end

CianwoodCityEusineApproachMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

CianwoodCityEusineDepartMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

ChucksWifeEasierToFlyText:
	text "Has creuat el mar"
	line "per arribar aquí?"

	para "Això deu haver"
	line "estat difícil."

	para "Seria molt més"
	line "fàcil si els teus"

	para "#MON sabessin"
	line "volar…"
	done

ChucksWifeBeatChuckText:
	text "Però no pots usar"
	line "Vol sense la"
	cont "MEDALLA d'aquí."

	para "Si vences el"
	line "LÍDER DE GIMNÀS,"
	cont "vine a veure'm."

	para "Tinc un regal per"
	line "a tu."
	done

ChucksWifeGiveHMText:
	text "Aquesta és la"
	line "MEDALLA CIANWOOD!"

	para "Doncs hauries"
	line "d'agafar aquesta"
	cont "MO."
	done

ChucksWifeFlySpeechText:
	text "Ensenya Vol als"
	line "teus #MON."

	para "Podràs volar"
	line "a l'instant a"

	para "qualsevol lloc"
	line "que hagis visitat."
	done

ChucksWifeChubbyText:
	text "El meu marit va"
	line "perdre contra tu,"
	cont "i ha d'entrenar."

	para "Està bé, perquè"
	line "s'estava posant"
	cont "una mica gras."
	done

CianwoodCityYoungsterText:
	text "Si uses Vol, pots"
	line "tornar a OLIVINE"

	para "a l'instant."
	done

CianwoodCityPokefanMText:
	text "Les roques al"
	line "nord del poble es"
	cont "poden trencar."

	para "Potser amaguen"
	line "alguna cosa."

	para "Els teus #MON"
	line "poden usar"
	cont "DESTROCAROCS."
	done

CianwoodCityLassText:
	text "CHUCK, el LÍDER"
	line "DEL GIMNÀS, lluita"

	para "amb els seus #-"
	line "MON de lluita."
	done

CianwoodCityUnusedText:
	text "Hi ha diverses"
	line "illes entre aquí"
	cont "i OLIVINE."

	para "Diuen que una"
	line "criatura marina"
	cont "mítica hi viu."
	done

EusineSuicuneText:
	text "EUSINE: Ei,"
	line "<PLAYER>."

	para "No era Suicune"
	line "ara mateix?"

	para "Només l'he vist"
	line "de reüll, però"

	para "m'ha semblat que"
	line "Suicune corria"
	cont "sobre les ones."

	para "Suicune és bell"
	line "i majestuós."

	para "I corre pels"
	line "pobles i camins"

	para "a velocitats"
	line "increïbles."

	para "És meravellós…"

	para "Vull veure"
	line "Suicune de prop…"

	para "Ja ho he decidit."

	para "Lluitaré amb tu"
	line "com a entrenador"
	cont "per guanyar-me el"
	cont "respecte de"
	cont "Suicune!"

	para "Va, <PLAYER>."
	line "Lluitem ara!"
	done

EusineBeatenText:
	text "M'és difícil"
	line "admetre-ho, però"
	cont "has guanyat."
	done

EusineAfterText:
	text "Ets increïble,"
	line "<PLAYER>!"

	para "No és estrany que"
	line "els #MON"
	cont "t'estimin."

	para "Ara ho entenc."

	para "Continuaré"
	line "buscant Suicune."

	para "Segur que ens"
	line "tornarem a veure."

	para "Fins aviat!"
	done

CianwoodCitySignText:
	text "CIUTAT CIANWOOD"

	para "Un Port Envoltat"
	line "de Mars Braus"
	done

CianwoodGymSignText:
	text "CIUTAT CIANWOOD"
	line "GIMNÀS #MON"

	para "LÍDER: CHUCK"

	para "Els Seus Punys"
	line "Parlen per Ell"
	done

CianwoodPharmacySignText:
	text "500 Anys de"
	line "Tradició"

	para "FARMÀCIA"
	line "CIUTAT CIANWOOD"

	para "Esperem les Vos-"
	line "tres Consultes"
	done

CianwoodPhotoStudioSignText:
	text "CIUTAT CIANWOOD"
	line "ESTUDI DE FOTOS"

	para "Fes-te una Foto"
	line "de Record!"
	done

CianwoodPokeSeerSignText:
	text "LA VIDENT #"
	line "ENDAVANT"
	done

CianwoodCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 41, MANIAS_HOUSE, 1
	warp_event  8, 43, CIANWOOD_GYM, 1
	warp_event 23, 43, CIANWOOD_POKECENTER_1F, 1
	warp_event 15, 47, CIANWOOD_PHARMACY, 1
	warp_event  9, 31, CIANWOOD_PHOTO_STUDIO, 1
	warp_event 15, 37, CIANWOOD_LUGIA_SPEECH_HOUSE, 1
	warp_event  5, 17, POKE_SEERS_HOUSE, 1

	def_coord_events
	coord_event 11, 16, SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE, CianwoodCitySuicuneAndEusine

	def_bg_events
	bg_event 20, 34, BGEVENT_READ, CianwoodCitySign
	bg_event  7, 45, BGEVENT_READ, CianwoodGymSign
	bg_event 24, 43, BGEVENT_READ, CianwoodPokecenterSign
	bg_event 19, 47, BGEVENT_READ, CianwoodPharmacySign
	bg_event  8, 32, BGEVENT_READ, CianwoodPhotoStudioSign
	bg_event  8, 24, BGEVENT_READ, CianwoodPokeSeerSign
	bg_event  4, 19, BGEVENT_ITEM, CianwoodCityHiddenRevive
	bg_event  5, 29, BGEVENT_ITEM, CianwoodCityHiddenMaxEther

	def_object_events
	object_event 21, 37, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodCityYoungster, -1
	object_event 17, 33, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityPokefanM, -1
	object_event 14, 42, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityLass, -1
	object_event  8, 16, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  9, 17, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  4, 25, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  5, 29, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event 10, 27, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  4, 19, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event 10, 46, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityChucksWife, -1
	object_event 11, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CIANWOOD_CITY_EUSINE
	object_event 10, 14, SPRITE_SUICUNE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
