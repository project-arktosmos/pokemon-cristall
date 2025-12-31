	object_const_def
	const AZALEAGYM_BUGSY
	const AZALEAGYM_BUG_CATCHER1
	const AZALEAGYM_BUG_CATCHER2
	const AZALEAGYM_BUG_CATCHER3
	const AZALEAGYM_TWIN1
	const AZALEAGYM_TWIN2
	const AZALEAGYM_GYM_GUIDE

AzaleaGym_MapScripts:
	def_scene_scripts

	def_callbacks

AzaleaGymBugsyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BUGSY
	iftrue .FightDone
	writetext BugsyText_INeverLose
	waitbutton
	closetext
	winlosstext BugsyText_ResearchIncomplete, 0
	loadtrainer BUGSY, BUGSY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BUGSY
	opentext
	writetext Text_ReceivedHiveBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_HIVEBADGE
	readvar VAR_BADGES
	scall AzaleaGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM49_FURY_CUTTER
	iftrue .GotFuryCutter
	setevent EVENT_BEAT_TWINS_AMY_AND_MAY
	setevent EVENT_BEAT_BUG_CATCHER_BENNY
	setevent EVENT_BEAT_BUG_CATCHER_AL
	setevent EVENT_BEAT_BUG_CATCHER_JOSH
	writetext BugsyText_HiveBadgeSpeech
	promptbutton
	verbosegiveitem TM_FURY_CUTTER
	iffalse .NoRoomForFuryCutter
	setevent EVENT_GOT_TM49_FURY_CUTTER
	writetext BugsyText_FuryCutterSpeech
	waitbutton
	closetext
	end

.GotFuryCutter:
	writetext BugsyText_BugMonsAreDeep
	waitbutton
.NoRoomForFuryCutter:
	closetext
	end

AzaleaGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerTwinsAmyandmay1:
	trainer TWINS, AMYANDMAY1, EVENT_BEAT_TWINS_AMY_AND_MAY, TwinsAmyandmay1SeenText, TwinsAmyandmay1BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinsAmyandmay1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsAmyandmay2:
	trainer TWINS, AMYANDMAY2, EVENT_BEAT_TWINS_AMY_AND_MAY, TwinsAmyandmay2SeenText, TwinsAmyandmay2BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinsAmyandmay2AfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherBenny:
	trainer BUG_CATCHER, BUG_CATCHER_BENNY, EVENT_BEAT_BUG_CATCHER_BENNY, BugCatcherBennySeenText, BugCatcherBennyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherBennyAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherAl:
	trainer BUG_CATCHER, AL, EVENT_BEAT_BUG_CATCHER_AL, BugCatcherAlSeenText, BugCatcherAlBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherAlAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherJosh:
	trainer BUG_CATCHER, JOSH, EVENT_BEAT_BUG_CATCHER_JOSH, BugCatcherJoshSeenText, BugCatcherJoshBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherJoshAfterBattleText
	waitbutton
	closetext
	end

AzaleaGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_BUGSY
	iftrue .AzaleaGymGuideWinScript
	opentext
	writetext AzaleaGymGuideText
	waitbutton
	closetext
	end

.AzaleaGymGuideWinScript:
	opentext
	writetext AzaleaGymGuideWinText
	waitbutton
	closetext
	end

AzaleaGymStatue:
	checkflag ENGINE_HIVEBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, BUGSY, BUGSY1
	jumpstd GymStatue2Script

BugsyText_INeverLose:
	text "Sóc en BUGSY!"
	line "Mai no perdo quan"

	para "es tracta de #-"
	line "MON insecte."

	para "La meva recerca"
	line "em convertirà en"

	para "l'autoritat dels"
	line "#MON insecte!"

	para "Deixa'm mostrar-te"
	line "què he après dels"
	cont "meus estudis."
	done

BugsyText_ResearchIncomplete:
	text "Uau, increïble!"
	line "Ets un expert en"
	cont "#MON!"

	para "La meva recerca"
	line "no és completa."

	para "D'acord, guanyes."
	line "Pren la MEDALLA."
	done

Text_ReceivedHiveBadge:
	text "<PLAYER> ha rebut"
	line "la MEDALLARUSC."
	done

BugsyText_HiveBadgeSpeech:
	text "Coneixes els"
	line "beneficis de la"
	cont "MEDALLARUSC?"

	para "Si la tens, els"
	line "#MON fins a"

	para "N30 t'obeiran,"
	line "fins i tot els"
	cont "intercanviats."

	para "Els #MON que"
	line "saben CUT podran"

	para "usar-lo fora de"
	line "combat també."

	para "Mira, també vull"
	line "que tinguis això."
	done

BugsyText_FuryCutterSpeech:
	text "La MT49 conté"
	line "FURY CUTTER."

	para "Si no falles, es"
	line "fa més fort a"
	cont "cada torn."

	para "Com més dura la"
	line "batalla, millor"
	cont "es torna."

	para "No és genial?"
	line "Jo el vaig trobar!"
	done

BugsyText_BugMonsAreDeep:
	text "Els #MON"
	line "insecte són molt"

	para "complexos. Hi ha"
	line "molts misteris."

	para "Estudia bé els"
	line "teus preferits."
	done

BugCatcherBennySeenText:
	text "Els #MON"
	line "insecte evolucio-"

	para "nen joves. Així es"
	line "fan forts abans."
	done

BugCatcherBennyBeatenText:
	text "Evolucionar no"
	line "n'hi ha prou!"
	done

BugCatcherBennyAfterBattleText:
	text "Els #MON es fan"
	line "més forts si"
	cont "evolucionen. Sí!"
	done

BugCatcherAlSeenText:
	text "Els #MON"
	line "insecte són"

	para "genials i forts!"
	line "T'ho provaré!"
	done

BugCatcherAlBeatenText:
	text "Has provat que"
	line "ets fort…"
	done

BugCatcherAlAfterBattleText:
	text "Són tan genials,"
	line "però a la majoria"

	para "de noies no els"
	line "agraden."

	para "No sé per què…"
	done

BugCatcherJoshSeenText:
	text "Has salvat tots"
	line "els SLOWPOKE?"

	para "Caram, ets fort!"
	line "Però els meus"
	cont "#-"

	para "MON adults també"
	line "són durs!"
	done

BugCatcherJoshBeatenText:
	text "Arrrgh!"
	done

BugCatcherJoshAfterBattleText:
	text "Suposo que els"
	line "hauria d'ensenyar"
	cont "millors moviments…"
	done

TwinsAmyandmay1SeenText:
	text "AMY: Hola! Vols"
	line "desafiar el LÍDER?"
	cont "De cap manera!"
	done

TwinsAmyandmay1BeatenText:
	text "AMY i MAY: Oh,"
	line "doble decepció!"
	done

TwinsAmyandmay1AfterBattleText:
	text "AMY: Ets molt"
	line "fort!"
	done

TwinsAmyandmay2SeenText:
	text "MAY: Vols veure"
	line "el LÍDER? Primer"
	cont "nosaltres!"
	done

TwinsAmyandmay2BeatenText:
	text "AMY i MAY: Oh,"
	line "doble decepció!"
	done

TwinsAmyandmay2AfterBattleText:
	text "MAY: Els nostres"
	line "#MON insecte"

	para "han perdut! Quina"
	line "llàstima."
	done

AzaleaGymGuideText:
	text "Ei, aspirant!"

	para "En BUGSY és jove,"
	line "però el seu"

	para "coneixement dels"
	line "#MON insecte"
	cont "és autèntic."

	para "Serà difícil"
	line "sense el meu"
	cont "consell."

	para "A veure… als #-"
	line "MON insecte no"
	cont "els agrada el foc."

	para "Els moviments de"
	line "tipus volador"
	cont "també són"
	cont "eficaços."
	done

AzaleaGymGuideWinText:
	text "Ben fet! Ha estat"
	line "un gran combat"

	para "entre entrenadors"
	line "joves amb talent."

	para "Amb gent com tu,"
	line "el futur dels"
	cont "#MON és"
	cont "brillant!"
	done

AzaleaGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, AZALEA_TOWN, 5
	warp_event  5, 15, AZALEA_TOWN, 5

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, AzaleaGymStatue
	bg_event  6, 13, BGEVENT_READ, AzaleaGymStatue

	def_object_events
	object_event  5,  7, SPRITE_BUGSY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AzaleaGymBugsyScript, -1
	object_event  5,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBugCatcherBenny, -1
	object_event  8,  8, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherAl, -1
	object_event  0,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherJosh, -1
	object_event  4, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAmyandmay1, -1
	object_event  5, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAmyandmay2, -1
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaGymGuideScript, -1
