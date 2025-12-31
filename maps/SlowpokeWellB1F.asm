	object_const_def
	const SLOWPOKEWELLB1F_ROCKET1
	const SLOWPOKEWELLB1F_ROCKET2
	const SLOWPOKEWELLB1F_ROCKET3
	const SLOWPOKEWELLB1F_ROCKET_GIRL
	const SLOWPOKEWELLB1F_SLOWPOKE1
	const SLOWPOKEWELLB1F_SLOWPOKE2
	const SLOWPOKEWELLB1F_KURT
	const SLOWPOKEWELLB1F_BOULDER
	const SLOWPOKEWELLB1F_POKE_BALL

SlowpokeWellB1F_MapScripts:
	def_scene_scripts

	def_callbacks

SlowpokeWellB1FKurtScript:
	jumptextfaceplayer SlowpokeWellB1FKurtText

TrainerGruntM29:
	trainer GRUNTM, GRUNTM_29, EVENT_BEAT_ROCKET_GRUNTM_29, GruntM29SeenText, GruntM29BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM29AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM1:
	trainer GRUNTM, GRUNTM_1, EVENT_BEAT_ROCKET_GRUNTM_1, GruntM1SeenText, GruntM1BeatenText, 0, .Script

.Script:
	opentext
	writetext TrainerGruntM1WhenTalkText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	disappear SLOWPOKEWELLB1F_ROCKET1
	disappear SLOWPOKEWELLB1F_ROCKET2
	disappear SLOWPOKEWELLB1F_ROCKET3
	disappear SLOWPOKEWELLB1F_ROCKET_GIRL
	pause 15
	special FadeInFromBlack
	disappear SLOWPOKEWELLB1F_KURT
	moveobject SLOWPOKEWELLB1F_KURT, 11, 6
	appear SLOWPOKEWELLB1F_KURT
	applymovement SLOWPOKEWELLB1F_KURT, KurtSlowpokeWellVictoryMovementData
	turnobject PLAYER, RIGHT
	opentext
	writetext KurtLeaveSlowpokeWellText
	waitbutton
	closetext
	setevent EVENT_CLEARED_SLOWPOKE_WELL
	variablesprite SPRITE_AZALEA_ROCKET, SPRITE_RIVAL
	setmapscene AZALEA_TOWN, SCENE_AZALEATOWN_RIVAL_BATTLE
	clearevent EVENT_ILEX_FOREST_APPRENTICE
	clearevent EVENT_ILEX_FOREST_FARFETCHD
	setevent EVENT_CHARCOAL_KILN_FARFETCH_D
	setevent EVENT_CHARCOAL_KILN_APPRENTICE
	setevent EVENT_SLOWPOKE_WELL_SLOWPOKES
	setevent EVENT_SLOWPOKE_WELL_KURT
	clearevent EVENT_AZALEA_TOWN_SLOWPOKES
	clearevent EVENT_KURTS_HOUSE_SLOWPOKE
	clearevent EVENT_KURTS_HOUSE_KURT_1
	special FadeOutToWhite
	special HealParty
	pause 15
	warp KURTS_HOUSE, 3, 3
	end

TrainerGruntM2:
	trainer GRUNTM, GRUNTM_2, EVENT_BEAT_ROCKET_GRUNTM_2, GruntM2SeenText, GruntM2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM2AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF1:
	trainer GRUNTF, GRUNTF_1, EVENT_BEAT_ROCKET_GRUNTF_1, GruntF1SeenText, GruntF1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF1AfterBattleText
	waitbutton
	closetext
	end

SlowpokeWellB1FSlowpokeWithMailScript:
	faceplayer
	opentext
	cry SLOWPOKE
	writetext SlowpokeWellB1FSlowpokeWithMailText
	yesorno
	iftrue .ReadMail
	closetext
	end

.ReadMail:
	writetext SlowpokeWellB1FSlowpokeMailText
	waitbutton
	closetext
	end

SlowpokeWellB1FTaillessSlowpokeScript:
	faceplayer
	opentext
	writetext SlowpokeWellB1FTaillessSlowpokeText
	cry SLOWPOKE
	waitbutton
	closetext
	end

SlowpokeWellB1FBoulder:
	jumpstd StrengthBoulderScript

SlowpokeWellB1FSuperPotion:
	itemball SUPER_POTION

KurtSlowpokeWellVictoryMovementData:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step_sleep 8
	step_sleep 8
	step_sleep 8
	step LEFT
	step UP
	step UP
	step_sleep 8
	step_sleep 8
	step_sleep 8
	turn_head LEFT
	step_end

SlowpokeWellB1FKurtText:
	text "KURT: Ei, hola,"
	line "<PLAYER>!"

	para "El guàrdia de"
	line "dalt ha fugit"
	cont "quan li he cridat."

	para "Però després he"
	line "caigut dins el"
	cont "POU."

	para "M'he colpejat fort"
	line "l'esquena i no em"
	cont "puc moure."

	para "Rai! Si estigués"
	line "bé, els meus"
	cont "#MON"

	para "els haurien"
	line "castigat…"

	para "Bé, no s'hi pot"
	line "fer res."

	para "<PLAYER>,"
	line "demostra'ls"
	cont "el teu coratge en"
	cont "el meu lloc!"
	done

KurtLeaveSlowpokeWellText:
	text "KURT: Ben fet,"
	line "<PLAYER>!"

	para "El TEAM ROCKET ha"
	line "fugit."

	para "L'esquena ja em va"
	line "millor. Marxem"
	cont "d'aquí."
	done

GruntM29SeenText:
	text "Uf! Estava"
	line "vigilant"
	cont "a dalt quan un"

	para "vell ximple m'ha"
	line "cridat."

	para "M'ha espantat tant"
	line "que he caigut"
	cont "aquí baix."

	para "Crec que em"
	line "desfogaré amb tu!"
	done

GruntM29BeatenText:
	text "Argh! Avui NO és"
	line "el meu dia!"
	done

GruntM29AfterBattleText:
	text "Sí, hem estat"
	line "tallant les cues"

	para "dels SLOWPOKE i"
	line "les venem."

	para "Tot el que fem és"
	line "per guanyar."

	para "Això mateix! Som"
	line "el TEAM ROCKET,"

	para "i farem qualsevol"
	line "cosa per diners!"
	done

GruntM1SeenText:
	text "Què vols?"

	para "Si interromps la"
	line "nostra feina, no"
	cont "esperis pietat!"
	done

GruntM1BeatenText:
	text "Avui ho has fet"
	line "bé, però espera"
	cont "la propera vegada!"
	done

TrainerGruntM1WhenTalkText:
	text "Sí, el TEAM ROCKET"
	line "es va dissoldre"
	cont "fa tres anys."

	para "Però vam continuar"
	line "les activitats"
	cont "en secret."

	para "Ara pots gaudir"
	line "mirant com causem"
	cont "problemes!"
	done

GruntM2SeenText:
	text "Que deixem de"
	line "tallar"
	cont "CUESLOWPOKE?"

	para "Si t'obeiéssim, la"
	line "reputació del TEAM"
	cont "ROCKET es perdria!"
	done

GruntM2BeatenText:
	text "Simplement…"
	line "Massa fort…"
	done

GruntM2AfterBattleText:
	text "Necessitem diners,"
	line "però vendre"
	cont "CUESLOWPOKE?"

	para "És dur ser un"
	line "RECLU ROCKET!"
	done

GruntF1SeenText:
	text "Que parem de"
	line "tallar CUES?"

	para "Prova a derrotar-"
	line "nos a tots!"
	done

GruntF1BeatenText:
	text "Ximple fastigós!"
	done

GruntF1AfterBattleText:
	text "Les CUESLOWPOKE"
	line "creixen ràpid!"

	para "Què hi ha de"
	line "dolent en vendre-"
	cont "les?"
	done

SlowpokeWellB1FSlowpokeWithMailText:
	text "Un SLOWPOKE amb"
	line "la CUA tallada…"

	para "Eh? Porta CORREU."
	line "El llegeixes?"
	done

SlowpokeWellB1FSlowpokeMailText:
	text "<PLAYER> ha llegit"
	line "el CORREU."

	para "Sigues bo i cuida"
	line "la casa amb l'avi"

	para "i el SLOWPOKE."

	para "Amb amor, Papa"
	done

SlowpokeWellB1FTaillessSlowpokeText:
	text "Un SLOWPOKE amb"
	line "la CUA tallada…"
	done

SlowpokeWellB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 15, AZALEA_TOWN, 6
	warp_event  7, 11, SLOWPOKE_WELL_B2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 15,  7, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM29, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  5,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGruntM1, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  5,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM2, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event 10,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGruntF1, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  7,  4, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FSlowpokeWithMailScript, EVENT_SLOWPOKE_WELL_SLOWPOKES
	object_event  6,  2, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FTaillessSlowpokeScript, EVENT_SLOWPOKE_WELL_SLOWPOKES
	object_event 16, 14, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FKurtScript, EVENT_SLOWPOKE_WELL_KURT
	object_event  3,  2, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FBoulder, -1
	object_event 10,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SlowpokeWellB1FSuperPotion, EVENT_SLOWPOKE_WELL_B1F_SUPER_POTION
