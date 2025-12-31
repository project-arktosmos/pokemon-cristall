	object_const_def
	const ROUTE35NATIONALPARKGATE_OFFICER1
	const ROUTE35NATIONALPARKGATE_YOUNGSTER
	const ROUTE35NATIONALPARKGATE_OFFICER2

Route35NationalParkGate_MapScripts:
	def_scene_scripts
	scene_script Route35NationalParkGateNoop1Scene,             SCENE_ROUTE35NATIONALPARKGATE_NOOP
	scene_script Route35NationalParkGateNoop2Scene,             SCENE_ROUTE35NATIONALPARKGATE_UNUSED
	scene_script Route35NationalParkGateLeaveContestEarlyScene, SCENE_ROUTE35NATIONALPARKGATE_LEAVE_CONTEST_EARLY

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route35NationalParkGateCheckIfContestRunningCallback
	callback MAPCALLBACK_OBJECTS, Route35NationalParkGateCheckIfContestAvailableCallback

Route35NationalParkGateNoop1Scene:
	end

Route35NationalParkGateNoop2Scene:
	end

Route35NationalParkGateLeaveContestEarlyScene:
	sdefer Route35NationalParkGateLeavingContestEarlyScript
	end

Route35NationalParkGateCheckIfContestRunningCallback:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue Route35NationalParkBugContestIsRunningScript
	setscene SCENE_ROUTE35NATIONALPARKGATE_NOOP
	endcallback

Route35NationalParkBugContestIsRunningScript:
	setscene SCENE_ROUTE35NATIONALPARKGATE_LEAVE_CONTEST_EARLY
	endcallback

Route35NationalParkGateCheckIfContestAvailableCallback:
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .SetContestOfficer
	ifequal THURSDAY, .SetContestOfficer
	ifequal SATURDAY, .SetContestOfficer
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue Route35NationalParkBugContestIsRunningScript
	disappear ROUTE35NATIONALPARKGATE_OFFICER1
	appear ROUTE35NATIONALPARKGATE_YOUNGSTER
	appear ROUTE35NATIONALPARKGATE_OFFICER2
	endcallback

.SetContestOfficer:
	appear ROUTE35NATIONALPARKGATE_OFFICER1
	disappear ROUTE35NATIONALPARKGATE_YOUNGSTER
	disappear ROUTE35NATIONALPARKGATE_OFFICER2
	endcallback

Route35NationalParkGateLeavingContestEarlyScript:
	applymovement PLAYER, Route35NationalParkGatePlayerApproachOfficer1Movement
	turnobject ROUTE35NATIONALPARKGATE_OFFICER1, RIGHT
	opentext
	readvar VAR_CONTESTMINUTES
	addval 1
	getnum STRING_BUFFER_3
	writetext Route35NationalParkGateOfficer1WantToFinishText
	yesorno
	iffalse .GoBackToContest
	writetext Route35NationalParkGateOfficer1WaitAtNorthGateText
	waitbutton
	closetext
	jumpstd BugContestResultsWarpScript

.GoBackToContest:
	writetext Route35NationalParkGateOfficer1OkGoFinishText
	waitbutton
	closetext
	scall Route35NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutToWhite
	waitsfx
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, 10, 47
	end

Route35OfficerScriptContest:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, Route35NationalParkGate_NoContestToday
	ifequal MONDAY, Route35NationalParkGate_NoContestToday
	ifequal WEDNESDAY, Route35NationalParkGate_NoContestToday
	ifequal FRIDAY, Route35NationalParkGate_NoContestToday
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route35NationalParkGate_ContestIsOver
	scall Route35NationalParkGate_GetDayOfWeek
	writetext Route35NationalParkGateOfficer1AskToParticipateText
	yesorno
	iffalse Route35NationalParkGate_DeclinedToParticipate
	readvar VAR_PARTYCOUNT
	ifgreater 1, Route35NationalParkGate_LeaveTheRestBehind
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
Route35NationalParkGate_OkayToProceed:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext Route35NationalParkGateOfficer1GiveParkBallsText
	promptbutton
	writetext Route35NationalParkGatePlayerReceivedParkBallsText
	playsound SFX_ITEM
	waitsfx
	writetext Route35NationalParkGateOfficer1ExplainsRulesText
	waitbutton
	closetext
	special GiveParkBalls
	scall Route35NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutToWhite
	waitsfx
	special SelectRandomBugContestContestants
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, 10, 47
	end

Route35NationalParkGate_EnterContest:
	readvar VAR_FACING
	ifequal LEFT, Route35NationalParkGate_FacingLeft
	applymovement PLAYER, Route35NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement
	end

Route35NationalParkGate_FacingLeft:
	applymovement PLAYER, Route35NationalParkGatePlayerEnterParkMovement
	end

Route35NationalParkGate_LeaveTheRestBehind:
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, Route35NationalParkGate_LessThanFullParty
	readvar VAR_BOXSPACE
	ifequal 0, Route35NationalParkGate_NoRoomInBox

Route35NationalParkGate_LessThanFullParty:
	special CheckFirstMonIsEgg
	ifequal TRUE, Route35NationalParkGate_FirstMonIsEgg
	writetext Route35NationalParkGateOfficer1AskToUseFirstMonText
	yesorno
	iffalse Route35NationalParkGate_DeclinedToLeaveMonsBehind
	special ContestDropOffMons
	iftrue Route35NationalParkGate_FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext Route35NationalParkGateOfficer1WellHoldYourMonText
	promptbutton
	writetext Route35NationalParkGatePlayersMonLeftWithHelperText
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	promptbutton
	sjump Route35NationalParkGate_OkayToProceed

Route35NationalParkGate_DeclinedToParticipate:
	writetext Route35NationalParkGateOfficer1TakePartInFutureText
	waitbutton
	closetext
	end

Route35NationalParkGate_DeclinedToLeaveMonsBehind:
	writetext Route35NationalParkGateOfficer1ChooseMonAndComeBackText
	waitbutton
	closetext
	end

Route35NationalParkGate_FirstMonIsFainted:
	writetext Route35NationalParkGateOfficer1FirstMonCantBattleText
	waitbutton
	closetext
	end

Route35NationalParkGate_NoRoomInBox:
	writetext Route35NationalParkGateOfficer1MakeRoomText
	waitbutton
	closetext
	end

Route35NationalParkGate_FirstMonIsEgg:
	writetext Route35NationalParkGateOfficer1EggAsFirstMonText
	waitbutton
	closetext
	end

Route35NationalParkGate_ContestIsOver:
	writetext Route35NationalParkGateOfficer1ContestIsOverText
	waitbutton
	closetext
	end

Route35NationalParkGate_NoContestToday:
	jumptextfaceplayer Route35NationalParkGateOfficer1WeHoldContestsText

Route35NationalParkGateOfficerScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route35NationalParkGate_ContestIsOver
	writetext Route35NationalParkGateOfficer1WeHoldContestsText
	waitbutton
	closetext
	end

Route35NationalParkGateYoungsterScript:
	jumptextfaceplayer Route35NationalParkGateYoungsterText

BugCatchingContestExplanationSign:
	jumptext BugCatchingContestExplanationText

Route35NationalParkGate_GetDayOfWeek:
	jumpstd DayToTextScript
	end

Route35NationalParkGatePlayerApproachOfficer1Movement:
	step DOWN
	turn_head LEFT
	step_end

Route35NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement:
	step RIGHT
	step UP
	step UP
	step_end

Route35NationalParkGatePlayerEnterParkMovement:
	step UP
	step_end

Route35NationalParkGateOfficer1AskToParticipateText:
	text "Avui és @"
	text_ram wStringBuffer3
	text "."
	line "Això vol dir que"

	para "hi ha el Concurs"
	line "de Caça d'Insectes"

	para "Les normes són"
	line "senzilles."

	para "Amb un dels teus"
	line "#MON, captura"

	para "un #MON insecte"
	line "per ser jutjat."

	para "T'agradaria"
	line "provar-ho?"
	done

Route35NationalParkGateOfficer1GiveParkBallsText:
	text "Aquí tens les"
	line "PARK BALLS pel"
	cont "Concurs."
	done

Route35NationalParkGatePlayerReceivedParkBallsText:
	text "<PLAYER> ha rebut"
	line "{d:BUG_CONTEST_BALLS} PARK BALLS."
	done

Route35NationalParkGateOfficer1ExplainsRulesText:
	text "La persona que"
	line "atrapi l'insecte"
	cont "#MON més fort"
	cont "és el guanyador."

	para "Tens {d:BUG_CONTEST_MINUTES}"
	line "minuts."

	para "Si et quedes sense"
	line "PARK BALLS, s'ha"
	cont "acabat."

	para "Pots quedar-te"
	line "l'últim #MON"
	cont "que atrapis."

	para "Surt i atrapa"
	line "l'insecte #MON"

	para "més fort que"
	line "puguis trobar!"
	done

Route35NationalParkGateOfficer1AskToUseFirstMonText:
	text "Oh…"

	para "Tens més d'un"
	line "#MON."

	para "Hauràs d'usar"
	line "@"
	text_ram wStringBuffer3
	text ", el"

	para "primer #MON del"
	line "teu equip."

	para "Et sembla bé?"
	done

Route35NationalParkGateOfficer1WellHoldYourMonText:
	text "Bé, guardarem els"
	line "altres #MON"
	cont "mentre competeixis"
	done

Route35NationalParkGatePlayersMonLeftWithHelperText:
	text "Els #MON de"
	line "<PLAYER> es queden"
	cont "amb l'AJUDANT."
	done

Route35NationalParkGateOfficer1ChooseMonAndComeBackText:
	text "Tria el #MON"
	line "que vulguis usar"

	para "al Concurs, i"
	line "després vine a mi."
	done

Route35NationalParkGateOfficer1TakePartInFutureText:
	text "D'acord. Esperem"
	line "que hi participis"
	cont "en el futur."
	done

Route35NationalParkGateOfficer1FirstMonCantBattleText:
	text "Oh…"
	line "El primer #MON"

	para "del teu equip"
	line "no pot lluitar."

	para "Canvia'l pel"
	line "#MON que"

	para "vulguis usar, i"
	line "després vine a mi."
	done

Route35NationalParkGateOfficer1MakeRoomText:
	text "Oh…"
	line "El teu equip i"

	para "la teva CAIXA PC"
	line "són plens."

	para "No tens lloc per"
	line "posar l'insecte"
	cont "#MON capturat."

	para "Fes lloc a l'equip"
	line "o a la CAIXA PC,"

	para "i després vine"
	line "a veure'm."
	done

Route35NationalParkGateOfficer1EggAsFirstMonText:
	text "Oh…"
	line "Tens un OU com"

	para "a primer #MON"
	line "del teu equip."

	para "Canvia'l pel"
	line "#MON que"

	para "vulguis usar, i"
	line "després vine a mi."
	done

Route35NationalParkGateOfficer1WantToFinishText:
	text "Encara tens @"
	text_ram wStringBuffer3
	text_start
	line "minut(s)."

	para "Vols acabar ara?"
	done

Route35NationalParkGateOfficer1WaitAtNorthGateText:
	text "Bé. Espera a la"
	line "Porta Nord per"

	para "l'anunci dels"
	line "guanyadors."
	done

Route35NationalParkGateOfficer1OkGoFinishText:
	text "Bé. Torna a fora"
	line "i acaba."
	done

Route35NationalParkGateOfficer1ContestIsOverText:
	text "El Concurs d'avui"
	line "s'ha acabat."

	para "Esperem que hi"
	line "participis aviat."
	done

Route35NationalParkGateOfficer1WeHoldContestsText:
	text "Fem Concursos"
	line "regularment al"

	para "PARC. Hauries de"
	line "provar-ho."
	done

Route35NationalParkGateYoungsterText:
	text "Quan serà el"
	line "proper Concurs de"
	cont "Caça d'Insectes?"
	done

BugCatchingContestExplanationText:
	text "El Concurs de Caça"
	line "d'Insectes es fa"

	para "dimarts, dijous"
	line "i dissabte."

	para "No només guanyes"
	line "un premi per"

	para "participar, també"
	line "et quedes amb"

	para "l'insecte #MON"
	line "que tinguis al"

	para "final del"
	line "concurs."
	done

Route35NationalParkGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  0, NATIONAL_PARK, 3
	warp_event  4,  0, NATIONAL_PARK, 4
	warp_event  3,  7, ROUTE_35, 3
	warp_event  4,  7, ROUTE_35, 3

	def_coord_events

	def_bg_events
	bg_event  5,  0, BGEVENT_READ, BugCatchingContestExplanationSign

	def_object_events
	object_event  2,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35OfficerScriptContest, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event  6,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route35NationalParkGateYoungsterScript, EVENT_ROUTE_35_NATIONAL_PARK_GATE_YOUNGSTER
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35NationalParkGateOfficerScript, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
