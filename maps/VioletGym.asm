	object_const_def
	const VIOLETGYM_FALKNER
	const VIOLETGYM_YOUNGSTER1
	const VIOLETGYM_YOUNGSTER2
	const VIOLETGYM_GYM_GUIDE

VioletGym_MapScripts:
	def_scene_scripts

	def_callbacks

VioletGymFalknerScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .FightDone
	writetext FalknerIntroText
	waitbutton
	closetext
	winlosstext FalknerWinLossText, 0
	loadtrainer FALKNER, FALKNER1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FALKNER
	opentext
	writetext ReceivedZephyrBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_ZEPHYRBADGE
	readvar VAR_BADGES
	scall VioletGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue .SpeechAfterTM
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	setmapscene ELMS_LAB, SCENE_ELMSLAB_NOOP
	specialphonecall SPECIALCALL_ASSISTANT
	writetext FalknerZephyrBadgeText
	promptbutton
	verbosegiveitem TM_MUD_SLAP
	iffalse .NoRoomForMudSlap
	setevent EVENT_GOT_TM31_MUD_SLAP
	writetext FalknerTMMudSlapText
	waitbutton
	closetext
	end

.SpeechAfterTM:
	writetext FalknerFightDoneText
	waitbutton
.NoRoomForMudSlap:
	closetext
	end

VioletGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerBirdKeeperRod:
	trainer BIRD_KEEPER, ROD, EVENT_BEAT_BIRD_KEEPER_ROD, BirdKeeperRodSeenText, BirdKeeperRodBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRodAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperAbe:
	trainer BIRD_KEEPER, ABE, EVENT_BEAT_BIRD_KEEPER_ABE, BirdKeeperAbeSeenText, BirdKeeperAbeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperAbeAfterBattleText
	waitbutton
	closetext
	end

VioletGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .VioletGymGuideWinScript
	writetext VioletGymGuideText
	waitbutton
	closetext
	end

.VioletGymGuideWinScript:
	writetext VioletGymGuideWinText
	waitbutton
	closetext
	end

VioletGymStatue:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, FALKNER, FALKNER1
	jumpstd GymStatue2Script

FalknerIntroText:
	text "Sóc FALKNER, el"
	line "Líder del Gimnàs"
	cont "#MON de VIOLET!"

	para "Diuen que pots"
	line "tallar les ales"

	para "dels #MON de"
	line "tipus volador amb"
	cont "electricitat…"

	para "No permetré tals"
	line "insults als"
	cont "#MON ocell!"

	para "Et mostraré el"
	line "veritable poder"

	para "dels magnífics"
	line "#MON ocell!"
	done

FalknerWinLossText:
	text "…Renoi! Els"
	line "#MON"
	cont "ocell del meu"
	cont "pare…"

	para "D'acord."
	line "Pren això."

	para "És la MEDALLA"
	line "CÉFIR oficial de"
	cont "la LLIGA #MON."
	done

ReceivedZephyrBadgeText:
	text "<PLAYER> ha rebut"
	line "la MEDALLA CÉFIR."
	done

FalknerZephyrBadgeText:
	text "La MEDALLA CÉFIR"
	line "augmenta el poder"
	cont "d'atac dels"
	cont "#MON."

	para "També permet als"
	line "#MON fer servir"

	para "FLASH, si el"
	line "tenen, sempre."

	para "Té, pren això"
	line "també."
	done

FalknerTMMudSlapText:
	text "Amb un MT, un"
	line "#MON aprendrà"

	para "un nou moviment"
	line "a l'instant."

	para "Pensa abans"
	line "d'actuar: un MT"
	cont "s'usa un sol cop."

	para "El MT31 conté"
	line "MUD-SLAP."

	para "Redueix la"
	line "precisió de"

	para "l'enemic mentre"
	line "fa mal."

	para "És a dir, és tant"
	line "defensiu com"
	cont "ofensiu."
	done

FalknerFightDoneText:
	text "Hi ha GIMNASOS"
	line "#MON a ciutats"
	cont "i pobles propers."

	para "Hauries de provar"
	line "les teves habilit."
	cont "en aquests GIMN.!"

	para "Entrenaré més dur"
	line "per convertir-me"

	para "en el millor"
	line "mestre d'ocells!"
	done

BirdKeeperRodSeenText:
	text "La clau és el"
	line "coratge!"

	para "Els d'aquí"
	line "entrenem nit i"

	para "dia per ser"
	line "mestres d'ocells."

	para "Vine!"
	done

BirdKeeperRodBeatenText:
	text "Aaaah!"
	done

BirdKeeperRodAfterBattleText:
	text "Les habilitats de"
	line "FALKNER són reals!"

	para "No et confiïs"
	line "només perquè"
	cont "m'has guanyat!"
	done

BirdKeeperAbeSeenText:
	text "Deixa'm veure si"
	line "ets prou bo per"
	cont "enfrontar FALKNER!"
	done

BirdKeeperAbeBeatenText:
	text "Això no pot ser"
	line "veritat!"
	done

BirdKeeperAbeAfterBattleText:
	text "Això és patètic,"
	line "perdre contra un"
	cont "entrenador novell…"
	done

VioletGymGuideText:
	text "Ei! No sóc entre-"
	line "nador però et puc"
	cont "donar consells!"

	para "Creu-me!"
	line "Si creus, el somni"

	para "de ser campió es"
	line "pot fer realitat."

	para "Hi creus?"
	line "Doncs escolta."

	para "El tipus planta és"
	line "feble contra el"

	para "tipus volador."
	line "Recorda-ho."
	done

VioletGymGuideWinText:
	text "Bon combat!"
	line "Segueix"
	cont "així, i seràs"

	para "el CAMPIÓ en un"
	line "no res!"
	done

VioletGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, VIOLET_CITY, 2
	warp_event  5, 15, VIOLET_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, VioletGymStatue
	bg_event  6, 13, BGEVENT_READ, VioletGymStatue

	def_object_events
	object_event  5,  1, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletGymFalknerScript, -1
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRod, -1
	object_event  2, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperAbe, -1
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletGymGuideScript, -1
