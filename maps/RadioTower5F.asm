object_const_def
const RADIOTOWER5F_DIRECTOR
const RADIOTOWER5F_ROCKET
const RADIOTOWER5F_ROCKET_GIRL
const RADIOTOWER5F_ROCKER
const RADIOTOWER5F_POKE_BALL

RadioTower5F_MapScripts:
	def_scene_scripts
	scene_script RadioTower5FNoop1Scene, SCENE_RADIOTOWER5F_FAKE_DIRECTOR
	scene_script RadioTower5FNoop2Scene, SCENE_RADIOTOWER5F_ROCKET_BOSS
	scene_script RadioTower5FNoop3Scene, SCENE_RADIOTOWER5F_NOOP

	def_callbacks

RadioTower5FNoop1Scene:
	end

RadioTower5FNoop2Scene:
	end

RadioTower5FNoop3Scene:
	end

FakeDirectorScript:
	turnobject RADIOTOWER5F_DIRECTOR, UP
	showemote EMOTE_SHOCK, RADIOTOWER5F_DIRECTOR, 15
	opentext
	writetext FakeDirectorTextBefore1
	waitbutton
	closetext
	applymovement RADIOTOWER5F_DIRECTOR, FakeDirectorMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext FakeDirectorTextBefore2
	waitbutton
	closetext
	winlosstext FakeDirectorWinText, 0
	setlasttalked RADIOTOWER5F_DIRECTOR
	loadtrainer EXECUTIVEM, EXECUTIVEM_3
	startbattle
	reloadmapafterbattle
	opentext
	writetext FakeDirectorTextAfter
	promptbutton
	verbosegiveitem BASEMENT_KEY
	closetext
	setscene SCENE_RADIOTOWER5F_ROCKET_BOSS
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_3
	end

Director:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .TrueDirector
	writetext FakeDirectorTextAfter
	waitbutton
	closetext
	end

.TrueDirector:
	writetext RadioTower5FDirectorText
	waitbutton
	closetext
	end

TrainerExecutivef1:
	trainer EXECUTIVEF, EXECUTIVEF_1, EVENT_BEAT_ROCKET_EXECUTIVEF_1, Executivef1SeenText, Executivef1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Executivef1AfterBattleText
	waitbutton
	closetext
	end

RadioTower5FRocketBossScript:
	applymovement PLAYER, RadioTower5FPlayerTwoStepsLeftMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject RADIOTOWER5F_ROCKET, RIGHT
	opentext
	writetext RadioTower5FRocketBossBeforeText
	waitbutton
	closetext
	winlosstext RadioTower5FRocketBossWinText, 0
	setlasttalked RADIOTOWER5F_ROCKET
	loadtrainer EXECUTIVEM, EXECUTIVEM_1
	startbattle
	reloadmapafterbattle
	opentext
	writetext RadioTower5FRocketBossAfterText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	disappear RADIOTOWER5F_ROCKET
	disappear RADIOTOWER5F_ROCKET_GIRL
	pause 15
	special FadeInFromBlack
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_1
	setevent EVENT_CLEARED_RADIO_TOWER
	clearflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	setevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_MAHOGANY_MART_OWNERS
	clearflag ENGINE_ROCKETS_IN_MAHOGANY
	clearevent EVENT_GOLDENROD_CITY_CIVILIANS
	clearevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
	setevent EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	clearevent EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	special PlayMapMusic
	disappear RADIOTOWER5F_DIRECTOR
	moveobject RADIOTOWER5F_DIRECTOR, 12, 0
	appear RADIOTOWER5F_DIRECTOR
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksIn
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower5FDirectorThankYouText
	promptbutton
	verbosegiveitem CLEAR_BELL
	writetext RadioTower5FDirectorDescribeClearBellText
	waitbutton
	closetext
	setscene SCENE_RADIOTOWER5F_NOOP
	setmapscene ECRUTEAK_TIN_TOWER_ENTRANCE, SCENE_ECRUTEAKTINTOWERENTRANCE_SAGE_BLOCKS
	setevent EVENT_GOT_CLEAR_BELL
	setevent EVENT_TEAM_ROCKET_DISBANDED
	sjump .UselessJump

.UselessJump:
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksOut
	playsound SFX_EXIT_BUILDING
	disappear RADIOTOWER5F_DIRECTOR
	end

Ben:
	jumptextfaceplayer BenText

RadioTower5FUltraBall:
	itemball ULTRA_BALL

RadioTower5FDirectorsOfficeSign:
	jumptext RadioTower5FDirectorsOfficeSignText

RadioTower5FStudio1Sign:
	jumptext RadioTower5FStudio1SignText

RadioTower5FBookshelf:
	jumpstd MagazineBookshelfScript

FakeDirectorMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

RadioTower5FDirectorWalksIn:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step_end

RadioTower5FDirectorWalksOut:
	step RIGHT
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

RadioTower5FPlayerTwoStepsLeftMovement:
	step LEFT
	step LEFT
	step_end

FakeDirectorTextBefore1:
	text "T-tu! Has vingut"
	line "a rescatar-me?"
	done

FakeDirectorTextBefore2:
	text "És el que"
	line "t'esperaves?"

	para "Doncs no!"
	line "Sóc un impostor!"

	para "He fingit ser el"
	line "DIRECTOR real per"

	para "preparar la"
	line "nostra conquesta."

	para "Vols saber on hem"
	line "amagat el DIREC-"
	cont "TOR de veritat?"

	para "T'ho diré. Però"
	line "només si pots"
	cont "guanyar-me!"
	done

FakeDirectorWinText:
	text "D'acord. Et diré"
	line "on és."
	done

FakeDirectorTextAfter:
	text "Hem amagat el"
	line "DIRECTOR real al"

	para "MAGATZEM"
	line "SUBTERRANI."

	para "És al fons del"
	line "PASSATGE"
	cont "SUBTERRANI."

	para "Però dubto que"
	line "hi arribis."
	done

Executivef1SeenText:
	text "Em recordes de"
	line "l'AMAGATALL de"
	cont "MAHOGANY TOWN?"

	para "Vaig perdre,"
	line "però ara no."
	done

Executivef1BeatenText:
	text "No pot ser!"

	para "He lluitat fort,"
	line "però he perdut…"
	done

Executivef1AfterBattleText:
	text "<PLAYER>, oi?"

	para "Un marrec com tu"
	line "no pot apreciar"

	para "la magnificència"
	line "del TEAM ROCKET."

	para "Quina llàstima."
	line "Admiro el teu"
	cont "poder."
	done

RadioTower5FRocketBossBeforeText:
	text "Oh? Has arribat"
	line "fins aquí?"

	para "Has de ser un"
	line "bon entrenador."

	para "Volem apoderar-"
	line "nos d'aquesta"

	para "TORRE DE RÀDIO i"
	line "anunciar el"
	cont "nostre retorn."

	para "Això farà que"
	line "el nostre cap,"

	para "GIOVANNI, torni"
	line "del seu viatge."

	para "Recuperarem"
	line "la nostra antiga"
	cont "glòria."

	para "No permetré que"
	line "interfereixis en"
	cont "els nostres plans."
	done

RadioTower5FRocketBossWinText:
	text "No! Perdona'm,"
	line "GIOVANNI!"
	done

RadioTower5FRocketBossAfterText:
	text "Com pot ser?"

	para "Els nostres somnis"
	line "s'han esvaït."

	para "No he estat a"
	line "l'alçada."

	para "Com va fer"
	line "GIOVANNI abans,"

	para "dissoldré el TEAM"
	line "ROCKET avui."

	para "Adéu."
	done

RadioTower5FDirectorThankYouText:
	text "DIRECTOR: <PLAY_G>,"
	line "gràcies!"

	para "Les teves accions"
	line "valentes han"

	para "salvat els #MON"
	line "de tot el país."

	para "Sé que no és gaire"
	line "però accepta"
	cont "això, si us plau."
	done

RadioTower5FDirectorDescribeClearBellText:
	text "Abans hi havia una"
	line "torre just aquí,"

	para "a GOLDENROD CITY."

	para "Però era vella i"
	line "cruixia."

	para "Així que la vam"
	line "reemplaçar per la"
	cont "TORRE DE RÀDIO."

	para "Vam trobar aquesta"
	line "campana durant la"
	cont "construcció."

	para "He sentit que"
	line "molts #MON"

	para "vivien a GOLDENROD"
	line "antigament."

	para "Potser…"

	para "Aquesta campana"
	line "té connexió amb"

	para "la TORRE CAMPANA"
	line "d'ECRUTEAK CITY…"

	para "Ah!"

	para "Això em recorda…"

	para "Vaig sentir el"
	line "TEAM ROCKET"
	cont "xiuxiuejant."

	para "Pel que sembla,"
	line "passa alguna cosa"

	para "a la TORRE"
	line "CAMPANA."

	para "No tinc ni idea"
	line "de què passa,"

	para "però potser ho"
	line "hauries de mirar."

	para "Bé, millor que"
	line "vagi al DESPATX."
	done

RadioTower5FDirectorText:
	text "DIRECTOR: Hola,"
	line "<PLAY_G>!"

	para "Saps, m'encanten"
	line "els #MON."

	para "Vaig construir"
	line "aquesta TORRE DE"

	para "RÀDIO per expresar"
	line "el meu amor pels"
	cont "#MON."

	para "Estaria bé que"
	line "la gent gaudís"
	cont "dels programes."
	done

BenText:
	text "BEN: Escoltes"
	line "la nostra música?"
	done

RadioTower5FDirectorsOfficeSignText:
	text "5a DESPATX DEL"
	line "   DIRECTOR"
	done

RadioTower5FStudio1SignText:
	text "5a ESTUDI 1"
	done

RadioTower5F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_4F, 1
	warp_event 12,  0, RADIO_TOWER_4F, 3

	def_coord_events
	coord_event  0,  3, SCENE_RADIOTOWER5F_FAKE_DIRECTOR, FakeDirectorScript
	coord_event 16,  5, SCENE_RADIOTOWER5F_ROCKET_BOSS, RadioTower5FRocketBossScript

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, RadioTower5FDirectorsOfficeSign
	bg_event 11,  0, BGEVENT_READ, RadioTower5FStudio1Sign
	bg_event 15,  0, BGEVENT_READ, RadioTower5FStudio1Sign
	bg_event 16,  1, BGEVENT_READ, RadioTower5FBookshelf
	bg_event 17,  1, BGEVENT_READ, RadioTower5FBookshelf

	def_object_events
	object_event  3,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Director, -1
	object_event 13,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 17,  2, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerExecutivef1, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 13,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Ben, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  8,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RadioTower5FUltraBall, EVENT_RADIO_TOWER_5F_ULTRA_BALL
