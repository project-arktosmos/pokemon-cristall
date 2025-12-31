object_const_def
const ECRUTEAKGYM_MORTY
const ECRUTEAKGYM_SAGE1
const ECRUTEAKGYM_SAGE2
const ECRUTEAKGYM_GRANNY1
const ECRUTEAKGYM_GRANNY2
const ECRUTEAKGYM_GYM_GUIDE
const ECRUTEAKGYM_GRAMPS

EcruteakGym_MapScripts:
	def_scene_scripts
	scene_script EcruteakGymForcedToLeaveScene, SCENE_ECRUTEAKGYM_FORCED_TO_LEAVE
	scene_script EcruteakGymNoopScene,          SCENE_ECRUTEAKGYM_NOOP

	def_callbacks

EcruteakGymForcedToLeaveScene:
	sdefer EcruteakGymClosed
	end

EcruteakGymNoopScene:
	end

EcruteakGymMortyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .FightDone
	writetext MortyIntroText
	waitbutton
	closetext
	winlosstext MortyWinLossText, 0
	loadtrainer MORTY, MORTY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MORTY
	opentext
	writetext Text_ReceivedFogBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FOGBADGE
	readvar VAR_BADGES
	scall EcruteakGymActivateRockets
	setmapscene ECRUTEAK_TIN_TOWER_ENTRANCE, SCENE_ECRUTEAKTINTOWERENTRANCE_NOOP
	setevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_RANG_CLEAR_BELL_2
.FightDone:
	checkevent EVENT_GOT_TM30_SHADOW_BALL
	iftrue .GotShadowBall
	setevent EVENT_BEAT_SAGE_JEFFREY
	setevent EVENT_BEAT_SAGE_PING
	setevent EVENT_BEAT_MEDIUM_MARTHA
	setevent EVENT_BEAT_MEDIUM_GRACE
	writetext MortyText_FogBadgeSpeech
	promptbutton
	verbosegiveitem TM_SHADOW_BALL
	iffalse .NoRoomForShadowBall
	setevent EVENT_GOT_TM30_SHADOW_BALL
	writetext MortyText_ShadowBallSpeech
	waitbutton
	closetext
	end

.GotShadowBall:
	writetext MortyFightDoneText
	waitbutton
.NoRoomForShadowBall:
	closetext
	end

EcruteakGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

EcruteakGymClosed:
	applymovement PLAYER, EcruteakGymPlayerStepUpMovement
	applymovement ECRUTEAKGYM_GRAMPS, EcruteakGymGrampsSlowStepDownMovement
	opentext
	writetext EcruteakGymClosedText
	waitbutton
	closetext
	follow PLAYER, ECRUTEAKGYM_GRAMPS
	applymovement PLAYER, EcruteakGymPlayerSlowStepDownMovement
	stopfollow
	special FadeOutToWhite
	playsound SFX_ENTER_DOOR
	waitsfx
	warp ECRUTEAK_CITY, 6, 27
	end

TrainerSageJeffrey:
	trainer SAGE, JEFFREY, EVENT_BEAT_SAGE_JEFFREY, SageJeffreySeenText, SageJeffreyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJeffreyAfterBattleText
	waitbutton
	closetext
	end

TrainerSagePing:
	trainer SAGE, PING, EVENT_BEAT_SAGE_PING, SagePingSeenText, SagePingBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SagePingAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumMartha:
	trainer MEDIUM, MARTHA, EVENT_BEAT_MEDIUM_MARTHA, MediumMarthaSeenText, MediumMarthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumMarthaAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumGrace:
	trainer MEDIUM, GRACE, EVENT_BEAT_MEDIUM_GRACE, MediumGraceSeenText, MediumGraceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumGraceAfterBattleText
	waitbutton
	closetext
	end

EcruteakGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .EcruteakGymGuideWinScript
	writetext EcruteakGymGuideText
	waitbutton
	closetext
	end

.EcruteakGymGuideWinScript:
	writetext EcruteakGymGuideWinText
	waitbutton
	closetext
	end

EcruteakGymStatue:
	checkflag ENGINE_FOGBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, MORTY, MORTY1
	jumpstd GymStatue2Script

EcruteakGymPlayerStepUpMovement:
	step UP
	step_end

EcruteakGymPlayerSlowStepDownMovement:
	fix_facing
	slow_step DOWN
	remove_fixed_facing
	step_end

EcruteakGymGrampsSlowStepDownMovement:
	slow_step DOWN
	step_end

MortyIntroText:
	text "Bé que has vingut."

	para "Aquí a ECRUTEAK,"
	line "els # són"
	cont "venerats."

	para "Es diu que un #"
	line "de colors d'arc"

	para "de Sant Martí"
	line "apareixerà davant"

	para "d'un entrenador"
	line "molt poderós."

	para "Creia aquesta"
	line "llegenda, així que"

	para "he entrenat aquí"
	line "en secret tota la"
	cont "meva vida."

	para "Per això, ara puc"
	line "veure el que"
	cont "altres no veuen."

	para "Només una mica"
	line "més…"

	para "Amb una mica més,"
	line "podria veure un"

	para "futur on em trobo"
	line "amb el # dels"
	cont "colors de l'arc."

	para "M'ajudaràs a"
	line "arribar a aquest"
	cont "nivell!"
	done

MortyWinLossText:
	text "Encara no sóc"
	line "prou bo…"

	para "D'acord. Aquesta"
	line "MEDALLA és teva."
	done

Text_ReceivedFogBadge:
	text "<PLAYER> ha rebut"
	line "MEDALLA BOIRA."
	done

MortyText_FogBadgeSpeech:
	text "Amb la MEDALLA"
	line "BOIRA, els # de"

	para "fins a N50"
	line "t'obeiran."

	para "A més, els #"
	line "que"
	cont "saben SURF podran"

	para "fer servir aquest"
	line "moviment sempre."

	para "Vull que tinguis"
	line "això també."
	done

MortyText_ShadowBallSpeech:
	text "És SHADOW BALL."
	line "Causa dany i pot"

	para "reduir la DEF."
	line "ESP."

	para "Fes-lo servir si"
	line "t'agrada."
	done

MortyFightDoneText:
	text "Ja veig…"

	para "El teu viatge t'ha"
	line "portat a llocs"
	cont "molt llunyans."

	para "I has vist molt"
	line "més que jo."

	para "T'envejo per"
	line "això…"
	done

SageJeffreySeenText:
	text "Vaig passar la"
	line "primavera amb els"
	cont "meus #."

	para "Després l'estiu,"
	line "la tardor i"
	cont "l'hivern…"

	para "I la primavera va"
	line "tornar. Hem viscut"

	para "junts durant molt"
	line "de temps."
	done

SageJeffreyBeatenText:
	text "Victòries i"
	line "derrotes, he"
	cont "viscut ambdues."
	done

SageJeffreyAfterBattleText:
	text "D'on vénen els"
	line "#?"
	done

SagePingSeenText:
	text "Pots fer mal als"
	line "nostres #?"
	done

SagePingBeatenText:
	text "Ah! Ben fet!"
	done

SagePingAfterBattleText:
	text "Només fem servir"
	line "# de tipus"
	cont "fantasma."

	para "Cap atac de tipus"
	line "normal els pot"
	cont "fer mal!"
	done

MediumMarthaSeenText:
	text "Guanyaré!"
	done

MediumMarthaBeatenText:
	text "He, he, he perdut!"
	done

MediumMarthaAfterBattleText:
	text "Qui més vol"
	line "guanyar, guanya!"
	done

MediumGraceSeenText:
	text "Confós pel terra"
	line "invisible?"

	para "Venç-me si vols"
	line "una pista!"
	done

MediumGraceBeatenText:
	text "Què, què?"
	done

MediumGraceAfterBattleText:
	text "D'acord. Et diré"
	line "el secret del"

	para "terra invisible."

	para "El camí és just"
	line "davant nostre!"
	done

EcruteakGymGuideText:
	text "Els entrenadors"
	line "d'aquí tenen"
	cont "motius secrets."

	para "Si guanyes, et"
	line "podrien explicar"

	para "secrets profunds"
	line "sobre ECRUTEAK."
	done

EcruteakGymGuideWinText:
	text "Uau, <PLAYER>."
	line "Ho has fet genial!"

	para "Jo estava amagat"
	line "al racó de pur"
	cont "terror!"
	done

EcruteakGymClosedText:
	text "MORTY, el LÍDER"
	line "del GIMNÀS, no hi"
	cont "és."

	para "Ho sento, però"
	line "hauràs de marxar."

	para "Hohohoho."
	done

EcruteakGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, ECRUTEAK_CITY, 10
	warp_event  5, 17, ECRUTEAK_CITY, 10
	warp_event  4, 14, ECRUTEAK_GYM, 4
	warp_event  2,  4, ECRUTEAK_GYM, 3
	warp_event  3,  4, ECRUTEAK_GYM, 3
	warp_event  4,  4, ECRUTEAK_GYM, 3
	warp_event  4,  5, ECRUTEAK_GYM, 3
	warp_event  6,  7, ECRUTEAK_GYM, 3
	warp_event  7,  4, ECRUTEAK_GYM, 3
	warp_event  2,  6, ECRUTEAK_GYM, 3
	warp_event  3,  6, ECRUTEAK_GYM, 3
	warp_event  4,  6, ECRUTEAK_GYM, 3
	warp_event  5,  6, ECRUTEAK_GYM, 3
	warp_event  7,  6, ECRUTEAK_GYM, 3
	warp_event  7,  7, ECRUTEAK_GYM, 3
	warp_event  4,  8, ECRUTEAK_GYM, 3
	warp_event  5,  8, ECRUTEAK_GYM, 3
	warp_event  6,  8, ECRUTEAK_GYM, 3
	warp_event  7,  8, ECRUTEAK_GYM, 3
	warp_event  2,  8, ECRUTEAK_GYM, 3
	warp_event  2,  9, ECRUTEAK_GYM, 3
	warp_event  2, 10, ECRUTEAK_GYM, 3
	warp_event  2, 11, ECRUTEAK_GYM, 3
	warp_event  4, 10, ECRUTEAK_GYM, 3
	warp_event  5, 10, ECRUTEAK_GYM, 3
	warp_event  2, 12, ECRUTEAK_GYM, 3
	warp_event  3, 12, ECRUTEAK_GYM, 3
	warp_event  4, 12, ECRUTEAK_GYM, 3
	warp_event  5, 12, ECRUTEAK_GYM, 3
	warp_event  7, 10, ECRUTEAK_GYM, 3
	warp_event  7, 11, ECRUTEAK_GYM, 3
	warp_event  7, 12, ECRUTEAK_GYM, 3
	warp_event  7, 13, ECRUTEAK_GYM, 3

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, EcruteakGymStatue
	bg_event  6, 15, BGEVENT_READ, EcruteakGymStatue

	def_object_events
	object_event  5,  1, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, EcruteakGymMortyScript, -1
	object_event  2,  7, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSageJeffrey, -1
	object_event  3, 13, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSagePing, -1
	object_event  7,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerMediumMartha, -1
	object_event  7,  9, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerMediumGrace, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakGymGuideScript, -1
	object_event  4, 14, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_GYM_GRAMPS
