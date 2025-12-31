	object_const_def
	const LAKEOFRAGE_LANCE
	const LAKEOFRAGE_GRAMPS
	const LAKEOFRAGE_SUPER_NERD1
	const LAKEOFRAGE_COOLTRAINER_F1
	const LAKEOFRAGE_FISHER1
	const LAKEOFRAGE_FISHER2
	const LAKEOFRAGE_COOLTRAINER_M
	const LAKEOFRAGE_COOLTRAINER_F2
	const LAKEOFRAGE_GYARADOS
	const LAKEOFRAGE_WESLEY
	const LAKEOFRAGE_POKE_BALL1
	const LAKEOFRAGE_POKE_BALL2

LakeOfRage_MapScripts:
	def_scene_scripts
	scene_script LakeOfRageNoop1Scene ; unusable
	scene_script LakeOfRageNoop2Scene ; unusable

	def_callbacks
	callback MAPCALLBACK_NEWMAP, LakeOfRageFlypointCallback
	callback MAPCALLBACK_OBJECTS, LakeOfRageWesleyCallback

LakeOfRageNoop1Scene:
	end

LakeOfRageNoop2Scene:
	end

LakeOfRageFlypointCallback:
	setflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	endcallback

LakeOfRageWesleyCallback:
	readvar VAR_WEEKDAY
	ifequal WEDNESDAY, .WesleyAppears
	disappear LAKEOFRAGE_WESLEY
	endcallback

.WesleyAppears:
	appear LAKEOFRAGE_WESLEY
	endcallback

LakeOfRageLanceScript:
	checkevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	iftrue .AskAgainForHelp
	opentext
	writetext LakeOfRageLanceForcedToEvolveText
	promptbutton
	faceplayer
	writetext LakeOfRageLanceIntroText
	yesorno
	iffalse .RefusedToHelp
.AgreedToHelp:
	writetext LakeOfRageLanceRadioSignalText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement LAKEOFRAGE_LANCE, LakeOfRageLanceTeleportIntoSkyMovement
	disappear LAKEOFRAGE_LANCE
	clearevent EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	setevent EVENT_DECIDED_TO_HELP_LANCE
	setmapscene MAHOGANY_MART_1F, SCENE_MAHOGANYMART1F_LANCE_UNCOVERS_STAIRS
	end

.RefusedToHelp:
	writetext LakeOfRageLanceRefusedText
	waitbutton
	closetext
	setevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	end

.AskAgainForHelp:
	faceplayer
	opentext
	writetext LakeOfRageLanceAskHelpText
	yesorno
	iffalse .RefusedToHelp
	sjump .AgreedToHelp

RedGyarados:
	opentext
	writetext LakeOfRageGyaradosCryText
	pause 15
	cry GYARADOS
	closetext
	loadwildmon GYARADOS, 30
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCESHINY
	startbattle
	ifequal LOSE, .NotBeaten
	disappear LAKEOFRAGE_GYARADOS
.NotBeaten:
	reloadmapafterbattle
	opentext
	giveitem RED_SCALE
	waitsfx
	writetext LakeOfRageGotRedScaleText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	setscene 0 ; Lake of Rage does not have a scene variable
	appear LAKEOFRAGE_LANCE
	end

LakeOfRageGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	writetext LakeOfRageGrampsText
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext LakeOfRageGrampsText_ClearedRocketHideout
	waitbutton
	closetext
	end

LakeOfRageSuperNerdScript:
	jumptextfaceplayer LakeOfRageSuperNerdText

LakeOfRageCooltrainerFScript:
	jumptextfaceplayer LakeOfRageCooltrainerFText

LakeOfRageSign:
	jumptext LakeOfRageSignText

MagikarpHouseSignScript:
	opentext
	writetext FishingGurusHouseSignText
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .MagikarpLengthRecord
	waitbutton
	closetext
	end

.MagikarpLengthRecord:
	promptbutton
	special MagikarpHouseSign
	closetext
	end

TrainerFisherAndre:
	trainer FISHER, ANDRE, EVENT_BEAT_FISHER_ANDRE, FisherAndreSeenText, FisherAndreBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherAndreAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherRaymond:
	trainer FISHER, RAYMOND, EVENT_BEAT_FISHER_RAYMOND, FisherRaymondSeenText, FisherRaymondBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherRaymondAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermAaron:
	trainer COOLTRAINERM, AARON, EVENT_BEAT_COOLTRAINERM_AARON, CooltrainermAaronSeenText, CooltrainermAaronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermAaronAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfLois:
	trainer COOLTRAINERF, LOIS, EVENT_BEAT_COOLTRAINERF_LOIS, CooltrainerfLoisSeenText, CooltrainerfLoisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfLoisAfterBattleText
	waitbutton
	closetext
	end

WesleyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	iftrue WesleyWednesdayScript
	readvar VAR_WEEKDAY
	ifnotequal WEDNESDAY, WesleyNotWednesdayScript
	checkevent EVENT_MET_WESLEY_OF_WEDNESDAY
	iftrue .MetWesley
	writetext MeetWesleyText
	promptbutton
	setevent EVENT_MET_WESLEY_OF_WEDNESDAY
.MetWesley:
	writetext WesleyGivesGiftText
	promptbutton
	verbosegiveitem BLACKBELT_I
	iffalse WesleyDoneScript
	setevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	writetext WesleyGaveGiftText
	waitbutton
	closetext
	end

WesleyWednesdayScript:
	writetext WesleyWednesdayText
	waitbutton
WesleyDoneScript:
	closetext
	end

WesleyNotWednesdayScript:
	writetext WesleyNotWednesdayText
	waitbutton
	closetext
	end

LakeOfRageElixer:
	itemball ELIXER

LakeOfRageTMDetect:
	itemball TM_DETECT

LakeOfRageHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_LAKE_OF_RAGE_HIDDEN_FULL_RESTORE

LakeOfRageHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_LAKE_OF_RAGE_HIDDEN_RARE_CANDY

LakeOfRageHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_LAKE_OF_RAGE_HIDDEN_MAX_POTION

LakeOfRageLanceTeleportIntoSkyMovement:
	teleport_from
	step_end

LakeOfRageLanceForcedToEvolveText:
	text "Aquest llac és"
	line "ple de GYARADOS i"
	cont "res més…"

	para "Així que forcen"
	line "els MAGIKARP a"
	cont "evolucionar…"
	done

LakeOfRageLanceIntroText:
	text "Has vingut pels"
	line "rumors?"

	para "Ets <PLAYER>?"
	line "Soc en LANCE, un"
	cont "entrenador com tu."

	para "He sentit rumors"
	line "i he vingut a"
	cont "investigar…"

	para "He vist com"
	line "lluitaves abans,"
	cont "<PLAY_G>."

	para "Veig que ets un"
	line "entrenador amb"

	para "habilitat"
	line "considerable."

	para "Si no et fa res,"
	line "em podries ajudar"
	cont "a investigar?"
	done

LakeOfRageLanceRadioSignalText:
	text "LANCE: Excel·lent!"

	para "Sembla que els"
	line "MAGIKARP del llac"

	para "estan sent forçats"
	line "a evolucionar."

	para "Una emissió de"
	line "ràdio misteriosa"

	para "de CAOBA n'és"
	line "la causa."

	para "T'esperaré,"
	line "<PLAY_G>."
	done

LakeOfRageLanceRefusedText:
	text "Oh… Bé, si canvies"
	line "d'opinió, si us"
	cont "plau ajuda'm."
	done

LakeOfRageLanceAskHelpText:
	text "LANCE: Hm? Em"
	line "vols ajudar?"
	done

LakeOfRageGyaradosCryText:
	text "GYARADOS: Gyashaa!"
	done

LakeOfRageGotRedScaleText:
	text "<PLAYER> ha"
	line "obtingut"
	cont "una ESCATA ROJA."
	done

LakeOfRageGrampsText:
	text "Els GYARADOS estan"
	line "enfadats!"

	para "És un mal presagi!"
	done

LakeOfRageGrampsText_ClearedRocketHideout:
	text "Hahah! Els MAGI-"
	line "KARP piquen!"
	done

LakeOfRageSuperNerdText:
	text "He sentit que"
	line "GYARADOS furiosos"
	cont "van fer el llac."

	para "Em pregunto si té"
	line "relació amb la"

	para "seva aparició"
	line "massiva actual?"
	done

LakeOfRageCooltrainerFText:
	text "M'han enganyat"
	line "els ulls? He vist"

	para "un GYARADOS roig"
	line "al llac…"

	para "Però els GYARADOS"
	line "no eren blaus?"
	done

FisherAndreSeenText:
	text "Lluita amb els"
	line "# que acabo de"
	cont "pescar!"
	done

FisherAndreBeatenText:
	text "Potser soc un bon"
	line "pescador, però com"

	para "a entrenador de"
	line "#"
	cont "no valc res…"
	done

FisherAndreAfterBattleText:
	text "Com a pescador no"
	line "perdré! Pesco #"
	cont "tot el dia."
	done

FisherRaymondSeenText:
	text "Faci el que faci,"
	line "només pesco els"

	para "mateixos #…"
	done

FisherRaymondBeatenText:
	text "El meu fil s'ha"
	line "embolicat…"
	done

FisherRaymondAfterBattleText:
	text "Per què no pesco"
	line "# bons?"
	done

CooltrainermAaronSeenText:
	text "Si un entrenador"
	line "en veu un altre,"

	para "l'ha de desafiar."

	para "És el nostre"
	line "destí."
	done

CooltrainermAaronBeatenText:
	text "Uf…"
	line "Bon combat."
	done

CooltrainermAaronAfterBattleText:
	text "Els # i el seu"
	line "entrenador es fan"

	para "forts lluitant"
	line "constantment."
	done

CooltrainerfLoisSeenText:
	text "Què ha passat amb"
	line "el GYARADOS roig?"

	para "Ha marxat?"

	para "Vaja. He vingut"
	line "per res?"

	para "Ja ho sé,"
	line "lluitem!"
	done

CooltrainerfLoisBeatenText:
	text "Ben fet!"
	done

CooltrainerfLoisAfterBattleText:
	text "Ara que hi penso,"
	line "he vist un"
	cont "BUTTERFREE rosa."
	done

MeetWesleyText:
	text "WESLEY: Bé, com"
	line "estàs?"

	para "Com que avui és"
	line "dimecres,"

	para "soc en WESLEY del"
	line "dimecres."
	done

WesleyGivesGiftText:
	text "Encantat de"
	line "conèixer-te. Pren"
	cont "un record."
	done

WesleyGaveGiftText:
	text "WESLEY: El CINTURÓ"
	line "augmenta la força"
	cont "dels atacs lluita."
	done

WesleyWednesdayText:
	text "WESLEY: Com que"
	line "m'has trobat, deus"

	para "haver conegut els"
	line "meus germans."

	para "O has tingut"
	line "sort?"
	done

WesleyNotWednesdayText:
	text "WESLEY: Avui no és"
	line "dimecres."
	cont "Quina llàstima."
	done

LakeOfRageSignText:
	text "LLAC DE LA IRA,"
	line "també conegut com"
	cont "LLAC GYARADOS."
	done

FishingGurusHouseSignText:
	text "CASA DEL GURU"
	line "PESCADOR"
	done

LakeOfRage_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  3, LAKE_OF_RAGE_HIDDEN_POWER_HOUSE, 1
	warp_event 27, 31, LAKE_OF_RAGE_MAGIKARP_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 21, 27, BGEVENT_READ, LakeOfRageSign
	bg_event 25, 31, BGEVENT_READ, MagikarpHouseSignScript
	bg_event 11, 28, BGEVENT_ITEM, LakeOfRageHiddenFullRestore
	bg_event  4,  4, BGEVENT_ITEM, LakeOfRageHiddenRareCandy
	bg_event 35,  5, BGEVENT_ITEM, LakeOfRageHiddenMaxPotion

	def_object_events
	object_event 21, 28, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageLanceScript, EVENT_LAKE_OF_RAGE_LANCE
	object_event 20, 26, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageGrampsScript, -1
	object_event 36, 13, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageSuperNerdScript, -1
	object_event 25, 29, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageCooltrainerFScript, -1
	object_event 30, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherAndre, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 24, 26, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherRaymond, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event  4, 15, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermAaron, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 36,  7, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerCooltrainerfLois, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 18, 22, SPRITE_GYARADOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RedGyarados, EVENT_LAKE_OF_RAGE_RED_GYARADOS
	object_event  4,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WesleyScript, EVENT_LAKE_OF_RAGE_WESLEY_OF_WEDNESDAY
	object_event  7, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LakeOfRageElixer, EVENT_LAKE_OF_RAGE_ELIXER
	object_event 35,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LakeOfRageTMDetect, EVENT_LAKE_OF_RAGE_TM_DETECT
