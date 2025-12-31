	object_const_def
	const VERMILIONGYM_SURGE
	const VERMILIONGYM_GENTLEMAN
	const VERMILIONGYM_ROCKER
	const VERMILIONGYM_SUPER_NERD
	const VERMILIONGYM_GYM_GUIDE

VermilionGym_MapScripts:
	def_scene_scripts

	def_callbacks

VermilionGymSurgeScript:
	faceplayer
	opentext
	checkflag ENGINE_THUNDERBADGE
	iftrue .FightDone
	writetext LtSurgeIntroText
	waitbutton
	closetext
	winlosstext LtSurgeWinLossText, 0
	loadtrainer LT_SURGE, LT_SURGE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LTSURGE
	setevent EVENT_BEAT_GENTLEMAN_GREGORY
	setevent EVENT_BEAT_GUITARIST_VINCENT
	setevent EVENT_BEAT_JUGGLER_HORTON
	opentext
	writetext ReceivedThunderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_THUNDERBADGE
	writetext LtSurgeThunderBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext LtSurgeFightDoneText
	waitbutton
	closetext
	end

TrainerGentlemanGregory:
	trainer GENTLEMAN, GREGORY, EVENT_BEAT_GENTLEMAN_GREGORY, GentlemanGregorySeenText, GentlemanGregoryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanGregoryAfterBattleText
	waitbutton
	closetext
	end

TrainerGuitaristVincent:
	trainer GUITARIST, VINCENT, EVENT_BEAT_GUITARIST_VINCENT, GuitaristVincentSeenText, GuitaristVincentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GuitaristVincentAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerHorton:
	trainer JUGGLER, HORTON, EVENT_BEAT_JUGGLER_HORTON, JugglerHortonSeenText, JugglerHortonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerHortonAfterBattleText
	waitbutton
	closetext
	end

VermilionGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LTSURGE
	iftrue .VermilionGymGuideWinScript
	writetext VermilionGymGuideText
	waitbutton
	closetext
	end

.VermilionGymGuideWinScript:
	writetext VermilionGymGuideWinText
	waitbutton
	closetext
	end

VermilionGymTrashCan:
	jumptext VermilionGymTrashCanText

VermilionGymStatue:
	checkflag ENGINE_THUNDERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, LT_SURGE, LT_SURGE1
	jumpstd GymStatue2Script

LtSurgeIntroText:
	text "SURGE: Ei, tu,"
	line "menut!"

	para "T'ho he de dir."
	line "Potser no és gaire"

	para "intel·ligent que"
	line "em desafiïs, però"
	cont "tens valor!"

	para "Quan es tracta de"
	line "#MON elèctrics,"
	cont "sóc el número u!"

	para "No he perdut mai"
	line "al camp de batalla"

	para "Et fulminare com"
	line "vaig fer amb els"
	cont "enemics a guerra!"
	done

LtSurgeWinLossText:
	text "SURGE: Arrrgh!"
	line "Ets molt fort!"

	para "D'acord, nen."
	line "T'has guanyat la"
	cont "MEDALLA TRON!"
	done

ReceivedThunderBadgeText:
	text "<PLAYER> ha rebut"
	line "la MEDALLA TRON."
	done

LtSurgeThunderBadgeText:
	text "SURGE: La MEDALLA"
	line "TRON augmenta la"
	cont "velocitat #MON."

	para "Considera-la prova"
	line "que m'has vençut."

	para "Porta-la amb"
	line "orgull, entesos?"
	done

LtSurgeFightDoneText:
	text "SURGE: Ei, nen!"
	line "Continues lluitant"
	cont "sense parar?"

	para "Els meus #MON i"
	line "jo seguim igual!"
	done

GentlemanGregorySeenText:
	text "Has vingut a"
	line "vèncer LT.SURGE?"

	para "No si jo ho puc"
	line "evitar!"
	done

GentlemanGregoryBeatenText:
	text "Perdoni per haver"
	line "fallat, LT.SURGE,"
	cont "senyor!"
	done

GentlemanGregoryAfterBattleText:
	text "Quan era a"
	line "l'exèrcit, LT."

	para "SURGE em va salvar"
	line "la vida."
	done

GuitaristVincentSeenText:
	text "LT.SURGE va"
	line "reconèixer el meu"

	para "potencial amb"
	line "#MON elèctrics."

	para "Creus que em pots"
	line "vèncer?"
	done

GuitaristVincentBeatenText:
	text "Ui, quin xoc!"
	done

GuitaristVincentAfterBattleText:
	text "Si les trampes del"
	line "GIMNÀS"
	cont "funcionessin"

	para "hauries quedat"
	line "fregit…"
	done

JugglerHortonSeenText:
	text "Et derrotaré!"
	line "Prepara't per"
	cont "rebre una"
	cont "descàrrega!"
	done

JugglerHortonBeatenText:
	text "Gwaaah!"
	line "M'has superat…"
	done

JugglerHortonAfterBattleText:
	text "No et confiïs per"
	line "haver-me vençut…"

	para "LT.SURGE és molt"
	line "dur."
	done

VermilionGymGuideText:
	text "Ei! Futur CAMPIÓ!"

	para "Has tingut sort"
	line "aquest cop."

	para "LT.SURGE és molt"
	line "prudent. Té"
	cont "trampes"

	para "posades per tot el"
	line "GIMNÀS."

	para "Però, he he, les"
	line "trampes ara no"
	cont "estan actives."

	para "No tindràs cap"
	line "problema per"
	cont "arribar a SURGE."
	done

VermilionGymGuideWinText:
	text "Uau! Ha estat un"
	line "combat"
	cont "electritzant"

	para "M'ha posat molt"
	line "nerviós."
	done

VermilionGymTrashCanText:
	text "No! Aquí només hi"
	line "ha escombraries."
	done

VermilionGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, VERMILION_CITY, 7
	warp_event  5, 17, VERMILION_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  1,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  1,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  1, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3, 15, BGEVENT_READ, VermilionGymStatue
	bg_event  6, 15, BGEVENT_READ, VermilionGymStatue

	def_object_events
	object_event  5,  2, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VermilionGymSurgeScript, -1
	object_event  8,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerGentlemanGregory, -1
	object_event  4,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 3, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGuitaristVincent, -1
	object_event  0, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerJugglerHorton, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, VermilionGymGuideScript, -1
