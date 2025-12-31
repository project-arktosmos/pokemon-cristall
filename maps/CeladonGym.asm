object_const_def
const CELADONGYM_ERIKA
const CELADONGYM_LASS1
const CELADONGYM_LASS2
const CELADONGYM_BEAUTY
const CELADONGYM_TWIN1
const CELADONGYM_TWIN2

CeladonGym_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonGymErikaScript:
	faceplayer
	opentext
	checkflag ENGINE_RAINBOWBADGE
	iftrue .FightDone
	writetext ErikaBeforeBattleText
	waitbutton
	closetext
	winlosstext ErikaBeatenText, 0
	loadtrainer ERIKA, ERIKA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ERIKA
	setevent EVENT_BEAT_LASS_MICHELLE
	setevent EVENT_BEAT_PICNICKER_TANYA
	setevent EVENT_BEAT_BEAUTY_JULIA
	setevent EVENT_BEAT_TWINS_JO_AND_ZOE
	opentext
	writetext PlayerReceivedRainbowBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_RAINBOWBADGE
.FightDone:
	checkevent EVENT_GOT_TM19_GIGA_DRAIN
	iftrue .GotGigaDrain
	writetext ErikaExplainTMText
	promptbutton
	verbosegiveitem TM_GIGA_DRAIN
	iffalse .GotGigaDrain
	setevent EVENT_GOT_TM19_GIGA_DRAIN
.GotGigaDrain:
	writetext ErikaAfterBattleText
	waitbutton
	closetext
	end

TrainerLassMichelle:
	trainer LASS, MICHELLE, EVENT_BEAT_LASS_MICHELLE, LassMichelleSeenText, LassMichelleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassMichelleAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerTanya:
	trainer PICNICKER, TANYA, EVENT_BEAT_PICNICKER_TANYA, PicnickerTanyaSeenText, PicnickerTanyaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerTanyaAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyJulia:
	trainer BEAUTY, JULIA, EVENT_BEAT_BEAUTY_JULIA, BeautyJuliaSeenText, BeautyJuliaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyJuliaAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsJoAndZoe1:
	trainer TWINS, JOANDZOE1, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoAndZoe1SeenText, TwinsJoAndZoe1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsJoAndZoe1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsJoAndZoe2:
	trainer TWINS, JOANDZOE2, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoAndZoe2SeenText, TwinsJoAndZoe2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsJoAndZoe2AfterBattleText
	waitbutton
	closetext
	end

CeladonGymStatue:
	checkflag ENGINE_RAINBOWBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, ERIKA, ERIKA1
	jumpstd GymStatue2Script

ErikaBeforeBattleText:
	text "ERIKA: Hola…"
	line "Quin temps més bo"

	para "que fa, oi?"
	line "Tan agradable…"

	para "…Em temo que em"
	line "puc adormir…"

	para "Em dic ERIKA."
	line "Sóc la LÍDER del"
	cont "GIMNÀS CELADON."

	para "…Oh? Véns de"
	line "JOHTO, dius?"
	cont "Que bé…"

	para "Oh. Perdona, no"
	line "m'havia adonat"

	para "que em volies"
	line "desafiar."

	para "D'acord, però"
	line "no perdré."
	done

ErikaBeatenText:
	text "ERIKA: Oh!"
	line "Admeto la derrota…"

	para "Ets molt fort…"

	para "Et donaré la"
	line "MEDALLA ARCIRIS…"
	done

PlayerReceivedRainbowBadgeText:
	text "<PLAYER> ha rebut"
	line "la MEDALLA"
	cont "ARCIRIS."
	done

ErikaExplainTMText:
	text "ERIKA: Ha estat"
	line "un combat"
	cont "deliciós."

	para "M'he sentit"
	line "inspirada. Vull"
	cont "que tinguis la MT."

	para "És GIGA DRAIN."

	para "És un moviment"
	line "meravellós que"

	para "drena la meitat"
	line "del mal que causa"
	cont "per curar el #."

	para "Fes-la servir si"
	line "et plau…"
	done

ErikaAfterBattleText:
	text "ERIKA: Perdre"
	line "deixa un regust"
	cont "amarg…"

	para "Però saber que hi"
	line "ha entrenadors"

	para "forts m'anima a"
	line "millorar…"
	done

LassMichelleSeenText:
	text "Trobes que un"
	line "GIMNÀS només de"
	cont "noies és rar?"
	done

LassMichelleBeatenText:
	text "Oh, bah!"
	done

LassMichelleAfterBattleText:
	text "M'he descuidat,"
	line "això és tot!"
	done

PicnickerTanyaSeenText:
	text "Oh, un combat?"
	line "Fa una mica de"
	cont "por, però va!"
	done

PicnickerTanyaBeatenText:
	text "Oh, ja està?"
	done

PicnickerTanyaAfterBattleText:
	text "Oh, mira quantes"
	line "MEDALLES tens."

	para "No és estrany que"
	line "no pogués guanyar!"
	done

BeautyJuliaSeenText:
	text "Miraves aquestes"
	line "flors o a mi?"
	done

BeautyJuliaBeatenText:
	text "Que molest!"
	done

BeautyJuliaAfterBattleText:
	text "Com puc arribar a"
	line "ser tan elegant"
	cont "com l'ERIKA?"
	done

TwinsJoAndZoe1SeenText:
	text "T'ensenyarem els"
	line "moviments # que"
	cont "l'ERIKA ens va"
	cont "ensenyar!"
	done

TwinsJoAndZoe1BeatenText:
	text "Oh… Hem perdut…"
	done

TwinsJoAndZoe1AfterBattleText:
	text "L'ERIKA et farà"
	line "pagar per això!"
	done

TwinsJoAndZoe2SeenText:
	text "Protegirem"
	line "l'ERIKA!"
	done

TwinsJoAndZoe2BeatenText:
	text "No hem pogut"
	line "guanyar…"
	done

TwinsJoAndZoe2AfterBattleText:
	text "L'ERIKA és molt,"
	line "molt més forta!"
	done

CeladonGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, CELADON_CITY, 8
	warp_event  5, 17, CELADON_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, CeladonGymStatue
	bg_event  6, 15, BGEVENT_READ, CeladonGymStatue

	def_object_events
	object_event  5,  3, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGymErikaScript, -1
	object_event  7,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassMichelle, -1
	object_event  2,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerTanya, -1
	object_event  3,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBeautyJulia, -1
	object_event  4, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsJoAndZoe1, -1
	object_event  5, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsJoAndZoe2, -1
