	object_const_def
	const ROUTE36NATIONALPARKGATE_OFFICER1
	const ROUTE36NATIONALPARKGATE_YOUNGSTER1
	const ROUTE36NATIONALPARKGATE_YOUNGSTER2
	const ROUTE36NATIONALPARKGATE_ROCKER
	const ROUTE36NATIONALPARKGATE_POKEFAN_M
	const ROUTE36NATIONALPARKGATE_YOUNGSTER3
	const ROUTE36NATIONALPARKGATE_YOUNGSTER4
	const ROUTE36NATIONALPARKGATE_LASS
	const ROUTE36NATIONALPARKGATE_YOUNGSTER5
	const ROUTE36NATIONALPARKGATE_YOUNGSTER6
	const ROUTE36NATIONALPARKGATE_YOUNGSTER7
	const ROUTE36NATIONALPARKGATE_OFFICER2

Route36NationalParkGate_MapScripts:
	def_scene_scripts
	scene_script Route36NationalParkGateNoop1Scene,             SCENE_ROUTE36NATIONALPARKGATE_NOOP
	scene_script Route36NationalParkGateNoop2Scene,             SCENE_ROUTE36NATIONALPARKGATE_UNUSED
	scene_script Route36NationalParkGateLeaveContestEarlyScene, SCENE_ROUTE36NATIONALPARKGATE_LEAVE_CONTEST_EARLY

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route36NationalParkGateCheckIfContestRunningCallback
	callback MAPCALLBACK_OBJECTS, Route36NationalParkGateCheckIfContestAvailableCallback

Route36NationalParkGateNoop1Scene:
	end

Route36NationalParkGateNoop2Scene:
	end

Route36NationalParkGateLeaveContestEarlyScene:
	sdefer Route36NationalParkGateLeavingContestEarlyScript
	end

Route36NationalParkGateCheckIfContestRunningCallback:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugContestIsRunning
	setscene SCENE_ROUTE36NATIONALPARKGATE_NOOP
	endcallback

.BugContestIsRunning:
	setscene SCENE_ROUTE36NATIONALPARKGATE_LEAVE_CONTEST_EARLY
	endcallback

Route36NationalParkGateCheckIfContestAvailableCallback:
	checkevent EVENT_WARPED_FROM_ROUTE_35_NATIONAL_PARK_GATE
	iftrue .Return
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .SetContestOfficer
	ifequal THURSDAY, .SetContestOfficer
	ifequal SATURDAY, .SetContestOfficer
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .SetContestOfficer
	disappear ROUTE36NATIONALPARKGATE_OFFICER1
	appear ROUTE36NATIONALPARKGATE_OFFICER2
	endcallback

.SetContestOfficer:
	appear ROUTE36NATIONALPARKGATE_OFFICER1
	disappear ROUTE36NATIONALPARKGATE_OFFICER2
.Return:
	endcallback

Route36NationalParkGateLeavingContestEarlyScript:
	turnobject PLAYER, UP
	opentext
	readvar VAR_CONTESTMINUTES
	addval 1
	getnum STRING_BUFFER_3
	writetext Route36NationalParkGateOfficer1WantToFinishText
	yesorno
	iffalse .GoBackToContest
	writetext Route36NationalParkGateOfficer1WaitHereForAnnouncementText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	scall .CopyContestants
	disappear ROUTE36NATIONALPARKGATE_OFFICER1
	appear ROUTE36NATIONALPARKGATE_OFFICER2
	applymovement PLAYER, Route36NationalParkGatePlayerWaitWithContestantsMovement
	pause 15
	special FadeInFromBlack
	jumpstd BugContestResultsScript

.GoBackToContest:
	writetext Route36NationalParkGateOfficer1OkGoFinishText
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	playsound SFX_EXIT_BUILDING
	special FadeOutToWhite
	waitsfx
	warpfacing LEFT, NATIONAL_PARK_BUG_CONTEST, 33, 18
	end

.CopyContestants:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_1A
	iftrue .Not1
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER1
.Not1:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_2A
	iftrue .Not2
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER2
.Not2:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_3A
	iftrue .Not3
	appear ROUTE36NATIONALPARKGATE_ROCKER
.Not3:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_4A
	iftrue .Not4
	appear ROUTE36NATIONALPARKGATE_POKEFAN_M
.Not4:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_5A
	iftrue .Not5
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER3
.Not5:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_6A
	iftrue .Not6
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER4
.Not6:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_7A
	iftrue .Not7
	appear ROUTE36NATIONALPARKGATE_LASS
.Not7:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_8A
	iftrue .Not8
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER5
.Not8:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_9A
	iftrue .Not9
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER6
.Not9:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_10A
	iftrue .Not10
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER7
.Not10:
	special UpdateSprites
	end

Route36OfficerScriptContest:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, _ContestNotOn
	ifequal MONDAY, _ContestNotOn
	ifequal WEDNESDAY, _ContestNotOn
	ifequal FRIDAY, _ContestNotOn
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route36Officer_ContestHasConcluded
	scall Route36ParkGate_DayToText
	writetext Route36NationalParkGateOfficer1AskToParticipateText
	yesorno
	iffalse .DecidedNotToJoinContest
	readvar VAR_PARTYCOUNT
	ifgreater 1, .LeaveMonsWithOfficer
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
.ResumeStartingContest:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext Route36NationalParkGateOfficer1GiveParkBallsText
	promptbutton
	waitsfx
	writetext Route36NationalParkGatePlayerReceivedParkBallsText
	playsound SFX_ITEM
	waitsfx
	writetext Route36NationalParkGateOfficer1ExplainsRulesText
	waitbutton
	closetext
	setflag ENGINE_BUG_CONTEST_TIMER
	special GiveParkBalls
	turnobject PLAYER, LEFT
	playsound SFX_EXIT_BUILDING
	special FadeOutToWhite
	waitsfx
	special SelectRandomBugContestContestants
	warpfacing LEFT, NATIONAL_PARK_BUG_CONTEST, 33, 18
	end

.LeaveMonsWithOfficer:
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, .ContinueLeavingMons
	readvar VAR_BOXSPACE
	ifequal 0, .BoxFull
.ContinueLeavingMons:
	special CheckFirstMonIsEgg
	ifequal TRUE, .FirstMonIsEgg
	writetext Route36NationalParkGateOfficer1AskToUseFirstMonText
	yesorno
	iffalse .RefusedToLeaveMons
	special ContestDropOffMons
	iftrue .FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext Route36NationalParkGateOfficer1WellHoldYourMonText
	promptbutton
	writetext Route36NationalParkGatePlayersMonLeftWithHelperText
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	promptbutton
	sjump .ResumeStartingContest

.DecidedNotToJoinContest:
	writetext Route36NationalParkGateOfficer1TakePartInFutureText
	waitbutton
	closetext
	end

.RefusedToLeaveMons:
	writetext Route36NationalParkGateOfficer1ChooseMonAndComeBackText
	waitbutton
	closetext
	end

.FirstMonIsFainted:
	writetext Route36NationalParkGateOfficer1FirstMonCantBattleText
	waitbutton
	closetext
	end

.BoxFull:
	writetext Route36NationalParkGateOfficer1MakeRoomText
	waitbutton
	closetext
	end

.FirstMonIsEgg:
	writetext Route36NationalParkGateOfficer1EggAsFirstMonText
	waitbutton
	closetext
	end

Route36Officer_ContestHasConcluded:
	checkevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	iftrue .Sunstone
	checkevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	iftrue .Everstone
	checkevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	iftrue .GoldBerry
	checkevent EVENT_CONTEST_OFFICER_HAS_BERRY
	iftrue .Berry
	writetext Route36NationalParkGateOfficer1ContestIsOverText
	waitbutton
	closetext
	end

.Sunstone:
	writetext Route36NationalParkGateOfficer1HeresThePrizeText
	promptbutton
	verbosegiveitem SUN_STONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	closetext
	end

.Everstone:
	writetext Route36NationalParkGateOfficer1HeresThePrizeText
	promptbutton
	verbosegiveitem EVERSTONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	closetext
	end

.GoldBerry:
	writetext Route36NationalParkGateOfficer1HeresThePrizeText
	promptbutton
	verbosegiveitem GOLD_BERRY
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	closetext
	end

.Berry:
	writetext Route36NationalParkGateOfficer1HeresThePrizeText
	promptbutton
	verbosegiveitem BERRY
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_BERRY
	closetext
	end

.BagFull:
	writetext Route36NationalParkGateOfficer1WellHoldPrizeText
	waitbutton
	closetext
	end

_ContestNotOn:
	jumptextfaceplayer Route36NationalParkGateOfficer1SomeMonOnlySeenInParkText

Route36NationalParkGateOfficerScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route36Officer_ContestHasConcluded
	writetext Route36NationalParkGateOfficer1SomeMonOnlySeenInParkText
	waitbutton
	closetext
	end

Route36ParkGate_DayToText:
	jumpstd DayToTextScript
	end

BugCatchingContestant1BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant1BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant1BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant2BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant2BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant2BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant3BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant3BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant3BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant4BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant4BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant4BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant5BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant5BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant5BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant6BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant6BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant6BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant7BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant7BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant7BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant8BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant8BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant8BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant9BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant9BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant9BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant10BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant10BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant10BStillCompetingText
	waitbutton
	closetext
	end

UnusedBugCatchingContestExplanationSign: ; unreferenced
; duplicate of BugCatchingContestExplanationSign in Route35NationalParkGate.asm
	jumptext UnusedBugCatchingContestExplanationText

Route36NationalParkGatePlayerWaitWithContestantsMovement:
	big_step DOWN
	big_step RIGHT
	turn_head UP
	step_end

Route36NationalParkGateOfficer1AskToParticipateText:
	text "Avui és @"
	text_ram wStringBuffer3
	text "."
	line "Això vol dir que"

	para "el Concurs de"
	line "Caça d'Insectes"
	cont "és avui."

	para "Les normes són"
	line "senzilles."

	para "Fes servir un dels"
	line "teus # per"

	para "capturar un #"
	line "insecte i jutjar."

	para "Vols provar-ho?"
	done

Route36NationalParkGateOfficer1GiveParkBallsText:
	text "Aquí tens les"
	line "PARK BALLS per al"
	cont "Concurs."
	done

Route36NationalParkGatePlayerReceivedParkBallsText:
	text "<PLAYER> ha rebut"
	line "{d:BUG_CONTEST_BALLS} PARK BALLS."
	done

Route36NationalParkGateOfficer1ExplainsRulesText:
	text "El que capturi el"
	line "# insecte més"
	cont "fort guanya."

	para "Tens {d:BUG_CONTEST_MINUTES} minuts."

	para "Si et quedes sense"
	line "PARK BALLS, has"
	cont "acabat."

	para "Pots quedar-te el"
	line "darrer # que"
	cont "capturis."

	para "Surt i captura el"
	line "# insecte més"

	para "fort que puguis"
	line "trobar!"
	done

Route36NationalParkGateOfficer1AskToUseFirstMonText:
	text "Oh…"

	para "Tens més d'un"
	line "#MON."

	para "Hauràs de fer"
	line "servir @"
	text_ram wStringBuffer3
	text ","

	para "el primer #MON"
	line "del teu equip."

	para "Et sembla bé?"
	done

Route36NationalParkGateOfficer1WellHoldYourMonText:
	text "D'acord, guardarem"
	line "els altres #MON"
	cont "mentre competeixs."
	done

Route36NationalParkGatePlayersMonLeftWithHelperText:
	text "Els #MON de"
	line "<PLAYER> es queden"
	cont "amb l'AJUDANT."
	done

Route36NationalParkGateOfficer1ChooseMonAndComeBackText:
	text "Tria el #MON"
	line "que vulguis fer"

	para "servir al Concurs"
	line "i torna a veure'm."
	done

Route36NationalParkGateOfficer1TakePartInFutureText:
	text "D'acord. Esperem"
	line "que participis en"
	cont "el futur."
	done

Route36NationalParkGateOfficer1FirstMonCantBattleText:
	text "Oh…"
	line "El primer #MON"

	para "del teu equip no"
	line "pot combatre."

	para "Canvia'l pel"
	line "#MON que"
	cont "vulguis"

	para "fer servir i"
	line "torna a veure'm."
	done

Route36NationalParkGateOfficer1MakeRoomText:
	text "Oh…"
	line "Tant el teu equip"

	para "com la CAIXA del"
	line "PC són plens."

	para "No tens espai per"
	line "guardar el #"
	cont "insecte capturat."

	para "Fes espai al teu"
	line "equip o a la CAIXA"

	para "del PC i torna"
	line "a veure'm."
	done

Route36NationalParkGateOfficer1EggAsFirstMonText:
	text "Oh…"
	line "Tens un OU com a"

	para "primer #MON"
	line "del teu equip."

	para "Canvia'l pel"
	line "#MON que"
	cont "vulguis"

	para "fer servir i"
	line "torna a veure'm."
	done

Route36NationalParkGateOfficer1WantToFinishText:
	text "Encara tens @"
	text_ram wStringBuffer3
	text_start
	line "minut(s)."

	para "Vols acabar ara?"
	done

Route36NationalParkGateOfficer1WaitHereForAnnouncementText:
	text "D'acord. Espera"
	line "aquí per a l'anun-"

	para "ci dels"
	line "guanyadors."
	done

Route36NationalParkGateOfficer1OkGoFinishText:
	text "D'acord. Torna a"
	line "fora i acaba."
	done

Route36NationalParkGateOfficer1ContestIsOverText:
	text "El Concurs d'avui"
	line "ha acabat. Esperem"

	para "que participis en"
	line "el futur."
	done

Route36NationalParkGateOfficer1SomeMonOnlySeenInParkText:
	text "Alguns #MON"
	line "només es veuen"
	cont "al PARC."
	done

BugCatchingContestant1BText:
	text "DON: Uau, m'has"
	line "guanyat. Ets molt"
	cont "bo."
	done

BugCatchingContestant1BStillCompetingText:
	text "DON: La sort hi"
	line "juga molt."

	para "Mai saps quin"
	line "#MON"
	cont "apareixerà."
	done

BugCatchingContestant2BText:
	text "ED: T'envejo."
	line "Aquest cop no ho"
	cont "he pogut fer."
	done

BugCatchingContestant2BStillCompetingText:
	text "ED: Potser guanyes"
	line "amb # grans?"
	done

BugCatchingContestant3BText:
	text "NICK: Ben fet!"
	line "Criaré millor els"
	cont "meus #MON."
	done

BugCatchingContestant3BStillCompetingText:
	text "NICK: Potser tens"
	line "més punts per un"

	para "#MON de color"
	line "estrany."
	done

BugCatchingContestant4BText:
	text "WILLIAM: Has"
	line "guanyat? Què has"
	cont "capturat?"
	done

BugCatchingContestant4BStillCompetingText:
	text "WILLIAM: Bé, estic"
	line "content perquè"

	para "he capturat el"
	line "#MON que volia."
	done

BugCatchingContestant5BText:
	text "BENNY: Felicitats!"
	line "T'has guanyat el"
	cont "meu respecte!"
	done

BugCatchingContestant5BStillCompetingText:
	text "BENNY: Vaig agafar"
	line "un SCYTHER abans,"
	cont "però no vaig gua-"
	cont "nyar."
	done

BugCatchingContestant6BText:
	text "BARRY: El #MON"
	line "que has capturat…"
	cont "és genial!"
	done

BugCatchingContestant6BStillCompetingText:
	text "BARRY: És més"
	line "fàcil guanyar si"

	para "tens un #"
	line "insec-"
	cont "te de nivell alt."

	para "Però crec que"
	line "també consideren"
	cont "altres punts."
	done

BugCatchingContestant7BText:
	text "CINDY: Has gua-"
	line "nyat? Fantàstic!"

	para "Vols buscar"
	line "#MON"
	cont "insecte amb mi?"
	done

BugCatchingContestant7BStillCompetingText:
	text "CINDY: M'encanten"
	line "els # insecte!"
	done

BugCatchingContestant8BText:
	text "JOSH: No… No em"
	line "puc creure que he"
	cont "perdut…"
	done

BugCatchingContestant8BStillCompetingText:
	text "JOSH: He sentit"
	line "que algú va gua-"
	cont "nyar amb CATERPIE!"
	done

BugCatchingContestant9BText:
	text "SAMUEL: El proper"
	line "cop, guanyaré."
	done

BugCatchingContestant9BStillCompetingText:
	text "SAMUEL: Llàstima."
	line "Pensava que trau-"
	cont "ria més punts…"
	done

BugCatchingContestant10BText:
	text "KIPP: Em podries"
	line "donar consells?"

	para "Vull estudiar el"
	line "teu estil."
	done

BugCatchingContestant10BStillCompetingText:
	text "KIPP: Estudio molt"
	line "però no n'hi ha"

	para "prou per"
	line "guanyar."
	done

UnusedSilphScope2Text: ; unreferenced
; This text is referring to Sudowoodo.
; The SILPHSCOPE2 was later reworked into the SQUIRTBOTTLE.
	text "He sentit que hi"
	line "ha un #MON que"
	cont "sembla un arbre."

	para "Pots revelar la"
	line "seva identitat"
	cont "amb SILPHSCOPE 2."
	done

UnusedBugCatchingContestExplanationText:
; duplicate of BugCatchingContestExplanationText in Route35NationalParkGate.asm
	text "El Concurs de Caça"
	line "d'Insectes és"

	para "dimarts, dijous"
	line "i dissabte."

	para "No només guanyes"
	line "un premi per"

	para "participar, sinó"
	line "que també pots"

	para "quedar-te el #"
	line "insecte que"
	cont "tinguis"

	para "al final del"
	line "concurs."
	done

Route36NationalParkGateOfficer1WellHoldPrizeText:
	text "Oh… La MOTXILLA"
	line "és plena."

	para "Guardarem el teu"
	line "premi, però només"
	cont "per avui."

	para "Fes espai i torna"
	line "a veure'm."
	done

Route36NationalParkGateOfficer1HeresThePrizeText:
	text "<PLAYER>?"

	para "Aquí tens el premi"
	line "que et guardàvem."
	done

Route36NationalParkGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, NATIONAL_PARK, 1
	warp_event  0,  5, NATIONAL_PARK, 2
	warp_event  9,  4, ROUTE_36, 1
	warp_event  9,  5, ROUTE_36, 2

	def_coord_events

	def_bg_events
	bg_event  6,  0, BGEVENT_READ, BugCatchingContestExplanationSign

	def_object_events
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route36OfficerScriptContest, EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant1BScript, EVENT_BUG_CATCHING_CONTESTANT_1B
	object_event  4,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant2BScript, EVENT_BUG_CATCHING_CONTESTANT_2B
	object_event  2,  6, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant3BScript, EVENT_BUG_CATCHING_CONTESTANT_3B
	object_event  6,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant4BScript, EVENT_BUG_CATCHING_CONTESTANT_4B
	object_event  2,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant5BScript, EVENT_BUG_CATCHING_CONTESTANT_5B
	object_event  5,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant6BScript, EVENT_BUG_CATCHING_CONTESTANT_6B
	object_event  3,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant7BScript, EVENT_BUG_CATCHING_CONTESTANT_7B
	object_event  4,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant8BScript, EVENT_BUG_CATCHING_CONTESTANT_8B
	object_event  6,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant9BScript, EVENT_BUG_CATCHING_CONTESTANT_9B
	object_event  6,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant10BScript, EVENT_BUG_CATCHING_CONTESTANT_10B
	object_event  3,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route36NationalParkGateOfficerScript, EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
