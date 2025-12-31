	object_const_def
	const CERULEANGYM_ROCKET
	const CERULEANGYM_MISTY
	const CERULEANGYM_SWIMMER_GIRL1
	const CERULEANGYM_SWIMMER_GIRL2
	const CERULEANGYM_SWIMMER_GUY
	const CERULEANGYM_GYM_GUIDE

CeruleanGym_MapScripts:
	def_scene_scripts
	scene_script CeruleanGymNoopScene,         SCENE_CERULEANGYM_NOOP
	scene_script CeruleanGymGruntRunsOutScene, SCENE_CERULEANGYM_GRUNT_RUNS_OUT

	def_callbacks

CeruleanGymNoopScene:
	end

CeruleanGymGruntRunsOutScene:
	sdefer CeruleanGymGruntRunsOutScript
	end

CeruleanGymGruntRunsOutScript:
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntRunsDownMovement
	playsound SFX_TACKLE
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntRunsIntoYouMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext CeruleanGymGruntIntroText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, CERULEANGYM_ROCKET, 15
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntBacksAwayMovement
	opentext
	writetext CeruleanGymGruntBigMistakeText
	waitbutton
	closetext
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntMovesCloseMovement
	opentext
	writetext CeruleanGymGruntByeText
	waitbutton
	closetext
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntRunsOutMovement
	playsound SFX_EXIT_BUILDING
	disappear CERULEANGYM_ROCKET
	setevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	clearevent EVENT_ROUTE_24_ROCKET
	clearevent EVENT_ROUTE_25_MISTY_BOYFRIEND
	setscene SCENE_CERULEANGYM_NOOP
	setmapscene ROUTE_25, SCENE_ROUTE25_MISTYS_DATE
	setmapscene POWER_PLANT, SCENE_POWERPLANT_NOOP
	waitsfx
	special RestartMapMusic
	pause 15
	turnobject PLAYER, DOWN
	pause 15
	end

CeruleanGymMistyScript:
	faceplayer
	opentext
	checkflag ENGINE_CASCADEBADGE
	iftrue .FightDone
	writetext MistyIntroText
	waitbutton
	closetext
	winlosstext MistyWinLossText, 0
	loadtrainer MISTY, MISTY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MISTY
	setevent EVENT_BEAT_SWIMMERF_DIANA
	setevent EVENT_BEAT_SWIMMERF_BRIANA
	setevent EVENT_BEAT_SWIMMERM_PARKER
	opentext
	writetext ReceivedCascadeBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_CASCADEBADGE
.FightDone:
	writetext MistyFightDoneText
	waitbutton
	closetext
	end

TrainerSwimmerfDiana:
	trainer SWIMMERF, DIANA, EVENT_BEAT_SWIMMERF_DIANA, SwimmerfDianaSeenText, SwimmerfDianaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDianaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfBriana:
	trainer SWIMMERF, BRIANA, EVENT_BEAT_SWIMMERF_BRIANA, SwimmerfBrianaSeenText, SwimmerfBrianaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfBrianaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermParker:
	trainer SWIMMERM, PARKER, EVENT_BEAT_SWIMMERM_PARKER, SwimmermParkerSeenText, SwimmermParkerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermParkerAfterBattleText
	waitbutton
	closetext
	end

CeruleanGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MISTY
	iftrue .CeruleanGymGuideWinScript
	writetext CeruleanGymGuideText
	waitbutton
	closetext
	end

.CeruleanGymGuideWinScript:
	writetext CeruleanGymGuideWinText
	waitbutton
	closetext
	end

CeruleanGymHiddenMachinePart:
	hiddenitem MACHINE_PART, EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM

CeruleanGymStatue1:
	checkevent EVENT_TRAINERS_IN_CERULEAN_GYM
	iffalse CeruleanGymStatue
	opentext
	writetext CeruleanGymNote1Text
	waitbutton
	closetext
	end

CeruleanGymStatue2:
	checkevent EVENT_TRAINERS_IN_CERULEAN_GYM
	iffalse CeruleanGymStatue
	opentext
	writetext CeruleanGymNote2Text
	waitbutton
	closetext
	end

CeruleanGymStatue:
	checkflag ENGINE_CASCADEBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, MISTY, MISTY1
	jumpstd GymStatue2Script

CeruleanGymGruntRunsDownMovement:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

CeruleanGymGruntRunsOutMovement:
	big_step RIGHT
	big_step DOWN
	step_end

CeruleanGymGruntRunsIntoYouMovement:
	fix_facing
	set_sliding
	jump_step UP
	remove_sliding
	remove_fixed_facing
	step_sleep 8
	step_sleep 8
	step DOWN
	step DOWN
	step_end

CeruleanGymGruntMovesCloseMovement:
	big_step DOWN
	step_end

CeruleanGymGruntBacksAwayMovement:
	fix_facing
	slow_step UP
	remove_fixed_facing
	step_end

CeruleanGymGruntIntroText:
	text "Ui! Ho sento molt!"
	line "No t'has fet mal,"
	cont "oi?"

	para "Tinc molta pressa."
	line "No tinc temps de"
	cont "parlar amb tu. No"
	cont "em convé que em"
	cont "vegi ningú."
	done

CeruleanGymGruntBigMistakeText:
	text "Oh, no! Ja m'has"
	line "vist! He comès un"
	cont "gran error!"
	done

CeruleanGymGruntByeText:
	text "Ei, tu! Oblida que"
	line "m'has vist, d'ac?"

	para "No has vist res,"
	line "no has sentit res"

	para "i no saps res,"
	line "entesos?"

	para "Adéu, nen! Res de"
	line "res! Xao xao!"
	done

CeruleanGymNote1Text:
	text "Perdó, estaré fora"
	line "una estona."
	cont "MISTY, LÍDER"
	done

CeruleanGymNote2Text:
	text "Com que MISTY no"
	line "hi és, nosaltres"
	cont "també marxem."
	cont "ELS ENTRENADORS"
	done

MistyIntroText:
	text "MISTY: T'estava"
	line "esperant, bèstia!"

	para "Potser tens moltes"
	line "MEDALLES de JOHTO,"

	para "però no em"
	line "subestimis."

	para "Els meus #MON"
	line "d'aigua són durs!"
	done

MistyWinLossText:
	text "MISTY: Ets molt"
	line "bo…"

	para "Admetré que tens"
	line "molta habilitat…"

	para "Aquí tens. És la"
	line "MEDALLA CASCADA."
	done

ReceivedCascadeBadgeText:
	text "<PLAYER> ha rebut"
	line "la MEDALLA"
	cont "CASCADA."
	done

MistyFightDoneText:
	text "MISTY: Hi ha"
	line "molts entrenadors"
	cont "forts a JOHTO?"
	cont "Com tu, vull dir."

	para "Algun dia viatja-"
	line "ré per combatre"

	para "entrenadors molt"
	line "hàbils."
	done

SwimmerfDianaSeenText:
	text "Perdona per no"
	line "ser-hi! Anem-hi!"
	done

SwimmerfDianaBeatenText:
	text "Em rendeixo! Has"
	line "guanyat!"
	done

SwimmerfDianaAfterBattleText:
	text "Nedaré una mica"
	line "en silenci."
	done

SwimmerfBrianaSeenText:
	text "No deixis que el"
	line "meu nedar elegant"
	cont "et posi nerviós."
	done

SwimmerfBrianaBeatenText:
	text "Uau, m'has vençut"
	line "amb molta calma…"
	done

SwimmerfBrianaAfterBattleText:
	text "No et creguis gai-"
	line "re per guanyar-me."

	para "MISTY t'esclafarà"
	line "si et confies."
	done

SwimmermParkerSeenText:
	text "Glub…"

	para "Sóc el primer!"
	line "Vine a buscar-me!"
	done

SwimmermParkerBeatenText:
	text "No pot ser…"
	done

SwimmermParkerAfterBattleText:
	text "MISTY ha millorat"
	line "molt els últims"
	cont "anys."

	para "No baixis la"
	line "guàrdia o et"
	cont "destrossarà!"
	done

CeruleanGymGuideText:
	text "Ei! Futur CAMPIÓ!"

	para "Com que MISTY no"
	line "hi era, jo també"

	para "vaig sortir a fer"
	line "el ròdol."
	cont "He, he, he."
	done

CeruleanGymGuideWinText:
	text "Uau, m'has demos-"
	line "trat com ets de"
	cont "fort."

	para "Com sempre, ha"
	line "estat un combat"
	cont "increïble!"
	done

CeruleanGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, CERULEAN_CITY, 5
	warp_event  5, 15, CERULEAN_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  3,  8, BGEVENT_ITEM, CeruleanGymHiddenMachinePart
	bg_event  2, 13, BGEVENT_READ, CeruleanGymStatue1
	bg_event  6, 13, BGEVENT_READ, CeruleanGymStatue2

	def_object_events
	object_event  4, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CERULEAN_GYM_ROCKET
	object_event  5,  3, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanGymMistyScript, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  4,  6, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDiana, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  1,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerSwimmerfBriana, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  8,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermParker, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanGymGuideScript, EVENT_TRAINERS_IN_CERULEAN_GYM
