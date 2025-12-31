	object_const_def
	const PEWTERGYM_BROCK
	const PEWTERGYM_YOUNGSTER
	const PEWTERGYM_GYM_GUIDE

PewterGym_MapScripts:
	def_scene_scripts

	def_callbacks

PewterGymBrockScript:
	faceplayer
	opentext
	checkflag ENGINE_BOULDERBADGE
	iftrue .FightDone
	writetext BrockIntroText
	waitbutton
	closetext
	winlosstext BrockWinLossText, 0
	loadtrainer BROCK, BROCK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BROCK
	setevent EVENT_BEAT_CAMPER_JERRY
	opentext
	writetext ReceivedBoulderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_BOULDERBADGE
	writetext BrockBoulderBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext BrockFightDoneText
	waitbutton
	closetext
	end

TrainerCamperJerry:
	trainer CAMPER, JERRY, EVENT_BEAT_CAMPER_JERRY, CamperJerrySeenText, CamperJerryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperJerryAfterBattleText
	waitbutton
	closetext
	end

PewterGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BROCK
	iftrue .PewterGymGuideWinScript
	writetext PewterGymGuideText
	waitbutton
	closetext
	end

.PewterGymGuideWinScript:
	writetext PewterGymGuideWinText
	waitbutton
	closetext
	end

PewterGymStatue:
	checkflag ENGINE_BOULDERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, BROCK, BROCK1
	jumpstd GymStatue2Script

BrockIntroText:
	text "BROCK: Vaja, no és"
	line "gaire sovint que"

	para "rebem un aspirant"
	line "de JOHTO."

	para "Soc BROCK, el"
	line "LÍDER del GIMNÀS"
	cont "de PEWTER."

	para "Soc un expert en"
	line "#MON de roca."

	para "Els meus #MON"
	line "són immunes a la"

	para "majoria d'atacs"
	line "físics."

	para "Et costarà molt"
	line "fer-los mal."

	para "Som-hi!"
	done

BrockWinLossText:
	text "BROCK: Els atacs"
	line "poderosos dels"
	cont "teus #MON han"
	cont "superat la meva"
	cont "defensa de roca…"

	para "Ets més fort del"
	line "que m'esperava…"

	para "Endavant, pren"
	line "aquesta MEDALLA."
	done

ReceivedBoulderBadgeText:
	text "<PLAYER> ha rebut"
	line "la MEDALLA ROCA."
	done

BrockBoulderBadgeText:
	text "BROCK: <PLAY_G>,"
	line "gràcies. M'ha"

	para "agradat lluitar"
	line "amb tu, encara que"
	cont "estic disgustat."

	para "La MEDALLA ROCA"
	line "farà els teus"

	para "#MON encara més"
	line "poderosos."
	done

BrockFightDoneText:
	text "BROCK: El món és"
	line "enorme. Encara hi"

	para "ha molts entrena-"
	line "dors forts com tu."

	para "Ja ho veuràs."
	line "Jo també em faré"
	cont "molt més fort."
	done

CamperJerrySeenText:
	text "Els entrenadors"
	line "d'aquest GIMNÀS"
	cont "usen #MON roca."

	para "El tipus roca té"
	line "una DEFENSA alta."

	para "Les batalles"
	line "poden durar molt."

	para "Estàs preparat"
	line "per a això?"
	done

CamperJerryBeatenText:
	text "He de guanyar"
	line "aquestes lluites…"
	done

CamperJerryAfterBattleText:
	text "Ei, tu! Entrena-"
	line "dor de JOHTO!"

	para "BROCK és dur. Et"
	line "castigarà si no"

	para "te'l prens de"
	line "debò."
	done

PewterGymGuideText:
	text "Ei! Futur CAMPIÓ!"
	line "Vas molt bé."

	para "Estàs lluitant"
	line "contra els LÍDERS"

	para "DE GIMNÀS de"
	line "KANTO?"

	para "Són gent forta i"
	line "dedicada, igual"

	para "que els LÍDERS de"
	line "JOHTO."
	done

PewterGymGuideWinText:
	text "Ei! Futur CAMPIÓ!"
	line "Aquest GIMNÀS no"

	para "t'ha donat gaires"
	line "problemes."

	para "La manera com has"
	line "pres el control"

	para "ha estat molt"
	line "inspiradora."
	done

PewterGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 13, PEWTER_CITY, 2
	warp_event  5, 13, PEWTER_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  2, 11, BGEVENT_READ, PewterGymStatue
	bg_event  7, 11, BGEVENT_READ, PewterGymStatue

	def_object_events
	object_event  5,  1, SPRITE_BROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterGymBrockScript, -1
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperJerry, -1
	object_event  6, 11, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, PewterGymGuideScript, -1
