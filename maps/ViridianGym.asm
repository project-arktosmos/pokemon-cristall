	object_const_def
	const VIRIDIANGYM_BLUE
	const VIRIDIANGYM_GYM_GUIDE

ViridianGym_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianGymBlueScript:
	faceplayer
	opentext
	checkflag ENGINE_EARTHBADGE
	iftrue .FightDone
	writetext LeaderBlueBeforeText
	waitbutton
	closetext
	winlosstext LeaderBlueWinText, 0
	loadtrainer BLUE, BLUE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BLUE
	opentext
	writetext Text_ReceivedEarthBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_EARTHBADGE
	writetext LeaderBlueAfterText
	waitbutton
	closetext
	end

.FightDone:
	writetext LeaderBlueEpilogueText
	waitbutton
	closetext
	end

ViridianGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BLUE
	iftrue .ViridianGymGuideWinScript
	writetext ViridianGymGuideText
	waitbutton
	closetext
	end

.ViridianGymGuideWinScript:
	writetext ViridianGymGuideWinText
	waitbutton
	closetext
	end

ViridianGymStatue:
	checkflag ENGINE_EARTHBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script

.Beaten:
	gettrainername STRING_BUFFER_4, BLUE, BLUE1
	jumpstd GymStatue2Script

LeaderBlueBeforeText:
	text "BLUE: Ei! Per fi"
	line "has arribat, eh?"

	para "No estava d'humor"
	line "a CINNABAR,"

	para "però ara estic a"
	line "punt per lluitar."

	para "…"

	para "Em dius que has"
	line "conquerit tots els"
	cont "GIMNASOS de JOHTO?"

	para "Bah! Els GIMNASOS"
	line "de JOHTO deuen ser"
	cont "molt fluixos."

	para "Ei, no et"
	line "preocupis."

	para "Sabré si ets bo o"
	line "no lluitant contra"

	para "tu ara mateix."

	para "Preparat, CAMPIÓ"
	line "de JOHTO?"
	done

LeaderBlueWinText:
	text "BLUE: Què?"

	para "Com dimonis he"
	line "pogut perdre?"

	para "…"

	para "Tsc, bé…"
	line "Té, agafa això:"
	cont "la INSÍGNIA TERRA."
	done

Text_ReceivedEarthBadge:
	text "<PLAYER> ha rebut"
	line "INSÍGNIA TERRA."
	done

LeaderBlueAfterText:
	text "BLUE: …"

	para "D'acord, m'he"
	line "equivocat. Ets"

	para "autèntic. Ets un"
	line "bon entrenador."

	para "Però algun dia et"
	line "venceré."

	para "No ho oblidis!"
	done

LeaderBlueEpilogueText:
	text "BLUE: Escolta'm."

	para "Més val que no"
	line "perdis fins que et"
	cont "venci. Entès?"
	done

ViridianGymGuideText:
	text "Ei, futur CAMPIÓ!"

	para "Com va? Sembla que"
	line "vas molt bé."

	para "El LÍDER del"
	line "GIMNÀS és un tipus"

	para "que va lluitar amb"
	line "el CAMPIÓ fa tres"
	cont "anys."

	para "No és fàcil."

	para "Dóna-ho tot!"
	done

ViridianGymGuideWinText:
	text "Noi, ets realment"
	line "dur…"

	para "Ha estat un combat"
	line "molt inspirador."

	para "M'ha fet plorar"
	line "d'emoció."
	done

ViridianGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, VIRIDIAN_CITY, 1
	warp_event  5, 17, VIRIDIAN_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, ViridianGymStatue
	bg_event  6, 13, BGEVENT_READ, ViridianGymStatue

	def_object_events
	object_event  5,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianGymBlueScript, EVENT_VIRIDIAN_GYM_BLUE
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianGymGuideScript, EVENT_VIRIDIAN_GYM_BLUE
