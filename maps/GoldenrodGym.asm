	object_const_def
	const GOLDENRODGYM_WHITNEY
	const GOLDENRODGYM_LASS1
	const GOLDENRODGYM_LASS2
	const GOLDENRODGYM_BEAUTY1
	const GOLDENRODGYM_BEAUTY2
	const GOLDENRODGYM_GYM_GUIDE

GoldenrodGym_MapScripts:
	def_scene_scripts
	scene_script GoldenrodGymNoop1Scene, SCENE_GOLDENRODGYM_NOOP
	scene_script GoldenrodGymNoop2Scene, SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING

	def_callbacks

GoldenrodGymNoop1Scene:
	end

GoldenrodGymNoop2Scene:
	end

GoldenrodGymWhitneyScript:
	faceplayer
	checkevent EVENT_BEAT_WHITNEY
	iftrue .FightDone
	opentext
	writetext WhitneyBeforeText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadtrainer WHITNEY, WHITNEY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WHITNEY
	setevent EVENT_MADE_WHITNEY_CRY
	setscene SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING
	setevent EVENT_BEAT_BEAUTY_VICTORIA
	setevent EVENT_BEAT_BEAUTY_SAMANTHA
	setevent EVENT_BEAT_LASS_CARRIE
	setevent EVENT_BEAT_LASS_BRIDGET
.FightDone:
	opentext
	checkevent EVENT_MADE_WHITNEY_CRY
	iffalse .StoppedCrying
	writetext WhitneyYouMeanieText
	waitbutton
	closetext
	end

.StoppedCrying:
	checkevent EVENT_GOT_TM45_ATTRACT
	iftrue .GotAttract
	checkflag ENGINE_PLAINBADGE
	iftrue .GotPlainBadge
	writetext WhitneyWhatDoYouWantText
	promptbutton
	waitsfx
	writetext PlayerReceivedPlainBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_PLAINBADGE
	readvar VAR_BADGES
	scall GoldenrodGymActivateRockets
.GotPlainBadge:
	writetext WhitneyPlainBadgeText
	promptbutton
	verbosegiveitem TM_ATTRACT
	iffalse .NoRoomForAttract
	setevent EVENT_GOT_TM45_ATTRACT
	writetext WhitneyAttractText
	waitbutton
	closetext
	end

.GotAttract:
	writetext WhitneyGoodCryText
	waitbutton
.NoRoomForAttract:
	closetext
	end

GoldenrodGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerLassCarrie:
	trainer LASS, CARRIE, EVENT_BEAT_LASS_CARRIE, LassCarrieSeenText, LassCarrieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassCarrieAfterBattleText
	waitbutton
	closetext
	end

WhitneyCriesScript:
	showemote EMOTE_SHOCK, GOLDENRODGYM_LASS2, 15
	applymovement GOLDENRODGYM_LASS2, BridgetWalksUpMovement
	turnobject PLAYER, DOWN
	opentext
	writetext BridgetWhitneyCriesText
	waitbutton
	closetext
	applymovement GOLDENRODGYM_LASS2, BridgetWalksAwayMovement
	setscene SCENE_GOLDENRODGYM_NOOP
	clearevent EVENT_MADE_WHITNEY_CRY
	end

TrainerLassBridget:
	trainer LASS, BRIDGET, EVENT_BEAT_LASS_BRIDGET, LassBridgetSeenText, LassBridgetBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassBridgetAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyVictoria:
	trainer BEAUTY, VICTORIA, EVENT_BEAT_BEAUTY_VICTORIA, BeautyVictoriaSeenText, BeautyVictoriaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyVictoriaAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautySamantha:
	trainer BEAUTY, SAMANTHA, EVENT_BEAT_BEAUTY_SAMANTHA, BeautySamanthaSeenText, BeautySamanthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautySamanthaAfterBattleText
	waitbutton
	closetext
	end

GoldenrodGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_WHITNEY
	iftrue .GoldenrodGymGuideWinScript
	opentext
	writetext GoldenrodGymGuideText
	waitbutton
	closetext
	end

.GoldenrodGymGuideWinScript:
	opentext
	writetext GoldenrodGymGuideWinText
	waitbutton
	closetext
	end

GoldenrodGymStatue:
	checkflag ENGINE_PLAINBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, WHITNEY, WHITNEY1
	jumpstd GymStatue2Script

BridgetWalksUpMovement:
	step LEFT
	turn_head UP
	step_end

BridgetWalksAwayMovement:
	step RIGHT
	turn_head LEFT
	step_end

WhitneyBeforeText:
	text "Hola! Sóc WHITNEY!"

	para "Tothom anava boig"
	line "pels #MON, i a"
	cont "mi em van agradar!"

	para "Els #MON són"
	line "supermacos!"

	para "Vols combatre?"
	line "T'aviso: sóc"
	cont "molt bona!"
	done

WhitneyShouldntBeSoSeriousText:
	text "Bua…"

	para "…Buaaaaaaaa!"
	line "Ets dolent!"

	para "No hauries de ser"
	line "tan seriós! Tu…"
	cont "ets un nen!"
	done

WhitneyYouMeanieText:
	text "Buaaaaa!"

	para "Buaaaaa!"

	para "…Snif, hic…"
	line "…Ets dolent!"
	done

WhitneyWhatDoYouWantText:
	text "…Snif…"

	para "Què? Què vols?"
	line "Una MEDALLA?"

	para "Ah, sí."
	line "M'oblidava. Aquí"
	cont "tens la PLANURA."
	done

PlayerReceivedPlainBadgeText:
	text "<PLAYER> ha rebut"
	line "la M. PLANURA."
	done

WhitneyPlainBadgeText:
	text "La M. PLANURA"
	line "permet usar"

	para "STRENGTH fora"
	line "de combat."

	para "També augmenta"
	line "la VELOCITAT"
	cont "dels #MON."

	para "Ei, pots quedar-te"
	line "això també!"
	done

WhitneyAttractText:
	text "És Attract!"
	line "Utilitza l'encant"

	para "dels #MON"
	line "al màxim."

	para "No és perfecte"
	line "per a una bonica"
	cont "com jo?"
	done

WhitneyGoodCryText:
	text "Ah, m'ha anat bé"
	line "plorar!"

	para "Vine a visitar-me"
	line "un altre cop! Déu!"
	done

LassCarrieSeenText:
	text "No et deixis"
	line "enganyar per"

	para "l'aspecte maco"
	line "dels meus #MON."
	done

LassCarrieBeatenText:
	text "Uf… Pensava que"
	line "eres fluix…"
	done

LassCarrieAfterBattleText:
	text "Els meus #MON"
	line "em troben maca?"
	done

LassBridgetSeenText:
	text "M'agraden més els"
	line "#MON macos que"
	cont "els forts."

	para "Però en tinc de"
	line "forts i macos!"
	done

LassBridgetBeatenText:
	text "Oh, no, no, no!"
	done

LassBridgetAfterBattleText:
	text "Vull guanyar a la"
	line "WHITNEY, però…"
	cont "És depriment."

	para "Estic bé! Si"
	line "perdo, m'esforça-"

	para "ré més el proper"
	line "cop!"
	done

BridgetWhitneyCriesText:
	text "Oh, no. Has fet"
	line "plorar la WHITNEY."

	para "No passa res."
	line "Aviat pararà."

	para "Sempre plora quan"
	line "perd."
	done

BeautyVictoriaSeenText:
	text "Oh, ets un"
	line "entrenador maco!"

	para "M'agrades, però"
	line "no em contindré!"
	done

BeautyVictoriaBeatenText:
	text "A veure… Ui,"
	line "ja s'ha acabat?"
	done

BeautyVictoriaAfterBattleText:
	text "Uau, has de ser"
	line "bo per guanyar-me!"
	cont "Continua així!"
	done

BeautySamanthaSeenText:
	text "Dóna-ho tot, o"
	line "t'esclafarem!"
	done

BeautySamanthaBeatenText:
	text "No! Oh, Meowth,"
	line "ho sento tant!"
	done

BeautySamanthaAfterBattleText:
	text "Vaig ensenyar a"
	line "Meowth moviments"
	cont "per a qualsevol…"
	done

GoldenrodGymGuideText:
	text "Ep! Futur"
	line "campió!"

	para "Aquest GIM és la"
	line "llar d'entrenadors"
	cont "de tipus normal."

	para "Et recomano usar"
	line "#MON de tipus"
	cont "lluita."
	done

GoldenrodGymGuideWinText:
	text "Has guanyat? Bé!"
	line "Jo mirava les"
	cont "noies d'aquí."
	done

GoldenrodGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 17, GOLDENROD_CITY, 1
	warp_event  3, 17, GOLDENROD_CITY, 1

	def_coord_events
	coord_event  8,  5, SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING, WhitneyCriesScript

	def_bg_events
	bg_event  1, 15, BGEVENT_READ, GoldenrodGymStatue
	bg_event  4, 15, BGEVENT_READ, GoldenrodGymStatue

	def_object_events
	object_event  8,  3, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGymWhitneyScript, -1
	object_event  9, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerLassCarrie, -1
	object_event  9,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassBridget, -1
	object_event  0,  2, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyVictoria, -1
	object_event 19,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautySamantha, -1
	object_event  5, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGymGuideScript, -1
