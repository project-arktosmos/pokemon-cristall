	object_const_def
	const OLIVINEGYM_JASMINE
	const OLIVINEGYM_GYM_GUIDE

OlivineGym_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineGymJasmineScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JASMINE
	iftrue .FightDone
	writetext Jasmine_SteelTypeIntro
	waitbutton
	closetext
	winlosstext Jasmine_BetterTrainer, 0
	loadtrainer JASMINE, JASMINE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JASMINE
	opentext
	writetext Text_ReceivedMineralBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MINERALBADGE
	readvar VAR_BADGES
	scall OlivineGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM23_IRON_TAIL
	iftrue .GotIronTail
	writetext Jasmine_BadgeSpeech
	promptbutton
	verbosegiveitem TM_IRON_TAIL
	iffalse .NoRoomForIronTail
	setevent EVENT_GOT_TM23_IRON_TAIL
	writetext Jasmine_IronTailSpeech
	waitbutton
	closetext
	end

.GotIronTail:
	writetext Jasmine_GoodLuck
	waitbutton
.NoRoomForIronTail:
	closetext
	end

OlivineGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

OlivineGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_JASMINE
	iftrue .OlivineGymGuideWinScript
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iffalse .OlivineGymGuidePreScript
	opentext
	writetext OlivineGymGuideText
	waitbutton
	closetext
	end

.OlivineGymGuideWinScript:
	opentext
	writetext OlivineGymGuideWinText
	waitbutton
	closetext
	end

.OlivineGymGuidePreScript:
	opentext
	writetext OlivineGymGuidePreText
	waitbutton
	closetext
	end

OlivineGymStatue:
	checkflag ENGINE_MINERALBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, JASMINE, JASMINE1
	jumpstd GymStatue2Script

Jasmine_SteelTypeIntro:
	text "…Gràcies per la"
	line "teva ajuda al"
	cont "FAR…"

	para "Però ara és"
	line "diferent. Deixa'm"

	para "que em presenti,"
	line "si us plau."

	para "Sóc JASMINE, la"
	line "LÍDER del GIMNÀS."
	cont "Faig servir acer."

	para "…Coneixes el"
	line "tipus acer?"

	para "És un tipus que"
	line "s'ha descobert"
	cont "fa poc."

	para "…Hum… Comencem?"
	done

Jasmine_BetterTrainer:
	text "…Ets millor"
	line "entrenador que"
	cont "jo,"

	para "tant en habilitat"
	line "com en amabilitat."

	para "Segons les normes"
	line "de la LLIGA,"

	para "et lliuro"
	line "aquesta MEDALLA."
	done

Text_ReceivedMineralBadge:
	text "<PLAYER> ha rebut"
	line "MEDALLAMINERAL."
	done

Jasmine_BadgeSpeech:
	text "MEDALLAMINERAL"
	line "puja la DEFENSA"
	cont "dels #MON."

	para "…Hum… Pren això"
	line "també, si us plau…"
	done

Text_ReceivedTM09: ; unreferenced
	text "<PLAYER> ha rebut"
	line "MT09."
	done

Jasmine_IronTailSpeech:
	text "…Podries fer"
	line "servir aquesta MT"
	cont "per IRON TAIL."
	done

Jasmine_GoodLuck:
	text "Hum… No sé com"
	line "dir-ho, però"
	cont "molta sort…"
	done

OlivineGymGuideText:
	text "JASMINE fa servir"
	line "el tipus acer,"
	cont "descobert fa poc."

	para "No en sé gaire"
	line "cosa, d'això."
	done

OlivineGymGuideWinText:
	text "Això ha estat"
	line "increïble."

	para "El tipus acer,"
	line "oi?"

	para "Ha estat un"
	line "encontre proper"
	cont "de tipus"
	cont "desconegut!"
	done

OlivineGymGuidePreText:
	text "JASMINE, la LÍDER"
	line "del GIMNÀS, és"
	cont "al FAR."

	para "Ha estat cuidant"
	line "un #MON malalt."

	para "Un entrenador"
	line "fort ha de ser"
	cont "compassiu."
	done

OlivineGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, OLIVINE_CITY, 2
	warp_event  5, 15, OLIVINE_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, OlivineGymStatue
	bg_event  6, 13, BGEVENT_READ, OlivineGymStatue

	def_object_events
	object_event  5,  3, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymJasmineScript, EVENT_OLIVINE_GYM_JASMINE
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymGuideScript, -1
