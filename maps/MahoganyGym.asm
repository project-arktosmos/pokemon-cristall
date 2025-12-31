object_const_def
	const MAHOGANYGYM_PRYCE
	const MAHOGANYGYM_BEAUTY1
	const MAHOGANYGYM_ROCKER1
	const MAHOGANYGYM_BEAUTY2
	const MAHOGANYGYM_ROCKER2
	const MAHOGANYGYM_ROCKER3
	const MAHOGANYGYM_GYM_GUIDE

MahoganyGym_MapScripts:
	def_scene_scripts

	def_callbacks

MahoganyGymPryceScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .FightDone
	writetext PryceText_Intro
	waitbutton
	closetext
	winlosstext PryceText_Impressed, 0
	loadtrainer PRYCE, PRYCE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PRYCE
	opentext
	writetext Text_ReceivedGlacierBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_GLACIERBADGE
	readvar VAR_BADGES
	scall MahoganyGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM16_ICY_WIND
	iftrue PryceScript_Defeat
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_SKIER_CLARISSA
	setevent EVENT_BEAT_BOARDER_RONALD
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	writetext PryceText_GlacierBadgeSpeech
	promptbutton
	verbosegiveitem TM_ICY_WIND
	iffalse MahoganyGym_NoRoomForIcyWind
	setevent EVENT_GOT_TM16_ICY_WIND
	writetext PryceText_IcyWindSpeech
	waitbutton
	closetext
	end

PryceScript_Defeat:
	writetext PryceText_CherishYourPokemon
	waitbutton
MahoganyGym_NoRoomForIcyWind:
	closetext
	end

MahoganyGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerSkierRoxanne:
	trainer SKIER, ROXANNE, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierRoxanneAfterBattleText
	waitbutton
	closetext
	end

TrainerSkierClarissa:
	trainer SKIER, CLARISSA, EVENT_BEAT_SKIER_CLARISSA, SkierClarissaSeenText, SkierClarissaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierClarissaAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderRonald:
	trainer BOARDER, RONALD, EVENT_BEAT_BOARDER_RONALD, BoarderRonaldSeenText, BoarderRonaldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderRonaldAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderBrad:
	trainer BOARDER, BRAD, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderBradAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderDouglas:
	trainer BOARDER, DOUGLAS, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderDouglasAfterBattleText
	waitbutton
	closetext
	end

MahoganyGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .MahoganyGymGuideWinScript
	writetext MahoganyGymGuideText
	waitbutton
	closetext
	end

.MahoganyGymGuideWinScript:
	writetext MahoganyGymGuideWinText
	waitbutton
	closetext
	end

MahoganyGymStatue:
	checkflag ENGINE_GLACIERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, PRYCE, PRYCE1
	jumpstd GymStatue2Script

PryceText_Intro:
	text "Els # viuen"
	line "moltes experiènci-"
	cont "es, com nosaltres."

	para "Jo també he vist"
	line "i patit molt a la"
	cont "meva vida."

	para "Com que sóc més"
	line "gran, deixa'm"
	cont "ensenyar-t'ho."

	para "He estat amb # "
	line "des d'abans que"
	cont "tu naixessis."

	para "No perdo"
	line "fàcilment."

	para "Jo, PRYCE, el"
	line "mestre de l'hivern"

	para "et mostraré el"
	line "meu poder!"
	done

PryceText_Impressed:
	text "Estic impressionat"
	line "per la teva"
	cont "destresa."

	para "Amb la teva forta"
	line "voluntat, sé que"

	para "superaràs tots"
	line "els obstacles."

	para "Et mereixes"
	line "aquesta MEDALLA!"
	done

Text_ReceivedGlacierBadge:
	text "<PLAYER> ha rebut"
	line "la M. GLACERA."
	done

PryceText_GlacierBadgeSpeech:
	text "Aquesta MEDALLA"
	line "augmenta les est."
	cont "ESPECIALS dels"
	cont "#."

	para "També permet als"
	line "teus # usar"
	cont "WHIRLPOOL per"
	cont "creuar remolins."

	para "I això… Això és"
	line "un regal meu!"
	done

PryceText_IcyWindSpeech:
	text "Aquesta MT conté"
	line "ICY WIND."

	para "Causa dany i"
	line "redueix velocitat."

	para "Demostra la"
	line "duresa de"
	cont "l'hivern."
	done

PryceText_CherishYourPokemon:
	text "Quan el gel i la"
	line "neu es fonen,"
	cont "arriba primavera."

	para "Tu i els teus #"
	line "estareu junts"

	para "durant molts"
	line "anys."

	para "Estima el temps"
	line "que passeu junts!"
	done

BoarderRonaldSeenText:
	text "Congelaré els"
	line "teus #, i no"
	cont "podràs fer res!"
	done

BoarderRonaldBeatenText:
	text "Vaja. No he pogut"
	line "fer res."
	done

BoarderRonaldAfterBattleText:
	text "Crec que hi ha un"
	line "moviment que un"
	cont "#"

	para "pot usar mentre"
	line "està congelat."
	done

BoarderBradSeenText:
	text "Aquest GIM té un"
	line "terra relliscós."

	para "És divertit, oi?"

	para "Però ei, aquí no"
	line "estem jugant!"
	done

BoarderBradBeatenText:
	text "Veus com de"
	line "seriosos som?"
	done

BoarderBradAfterBattleText:
	text "Aquest GIM és"
	line "genial. M'encanta"
	cont "fer surf amb els"
	cont "meus #!"
	done

BoarderDouglasSeenText:
	text "Sé el secret"
	line "de PRYCE."
	done

BoarderDouglasBeatenText:
	text "D'acord. Et diré"
	line "el secret de"
	cont "PRYCE."
	done

BoarderDouglasAfterBattleText:
	text "El secret del"
	line "poder de PRYCE…"

	para "Medita sota una"
	line "cascada cada dia"

	para "per enfortir la"
	line "ment i el cos."
	done

SkierRoxanneSeenText:
	text "Per arribar a"
	line "PRYCE, el nostre"
	cont "LÍDER DE GIM,"

	para "has de pensar"
	line "abans de patinar."
	done

SkierRoxanneBeatenText:
	text "No et guanyaria"
	line "esquiant!"
	done

SkierRoxanneAfterBattleText:
	text "Si no patines amb"
	line "precisió,"

	para "no aniràs gaire"
	line "lluny en aquest"
	cont "GIM."
	done

SkierClarissaSeenText:
	text "Mira el meu gir"
	line "paral·lel!"
	done

SkierClarissaBeatenText:
	text "No! M'has fet"
	line "caure!"
	done

SkierClarissaAfterBattleText:
	text "No hauria d'haver"
	line "presumit del meu"
	cont "esquí…"
	done

MahoganyGymGuideText:
	text "PRYCE és un veterà"
	line "que ha entrenat"

	para "# durant uns"
	line "50 anys."

	para "Diuen que és bo"
	line "congelant rivals"

	para "amb moviments"
	line "de tipus gel."

	para "Això vol dir que"
	line "l'has de fondre"

	para "amb la teva"
	line "ambició ardent!"
	done

MahoganyGymGuideWinText:
	text "PRYCE és increïble"
	line "però tu ets una"
	cont "altra cosa!"

	para "Ha estat un combat"
	line "ardent que ha"

	para "superat la"
	line "barrera"
	cont "generacional!"
	done

MahoganyGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, MAHOGANY_TOWN, 3
	warp_event  5, 17, MAHOGANY_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, MahoganyGymStatue
	bg_event  6, 15, BGEVENT_READ, MahoganyGymStatue

	def_object_events
	object_event  5,  3, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MahoganyGymPryceScript, -1
	object_event  4,  6, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierRoxanne, -1
	object_event  0, 17, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderRonald, -1
	object_event  9, 17, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierClarissa, -1
	object_event  5,  9, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderBrad, -1
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderDouglas, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyGymGuideScript, -1
