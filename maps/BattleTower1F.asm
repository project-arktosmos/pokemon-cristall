object_const_def
const BATTLETOWER1F_RECEPTIONIST
const BATTLETOWER1F_YOUNGSTER
const BATTLETOWER1F_COOLTRAINER_F
const BATTLETOWER1F_BUG_CATCHER
const BATTLETOWER1F_GRANNY

BattleTower1F_MapScripts:
	def_scene_scripts
	scene_script BattleTower1FCheckStateScene, SCENE_BATTLETOWER1F_CHECKSTATE
	scene_script BattleTower1FNoopScene,       SCENE_BATTLETOWER1F_NOOP

	def_callbacks

BattleTower1FCheckStateScene:
	setval BATTLETOWERACTION_CHECKSAVEFILEISYOURS
	special BattleTowerAction
	iffalse .SkipEverything
	setval BATTLETOWERACTION_GET_CHALLENGE_STATE ; readmem sBattleTowerChallengeState
	special BattleTowerAction
	ifequal $0, .SkipEverything
	ifequal $2, .LeftWithoutSaving
	ifequal $3, .SkipEverything
	ifequal $4, .SkipEverything
	opentext
	writetext Text_WeveBeenWaitingForYou
	waitbutton
	closetext
	sdefer Script_ResumeBattleTowerChallenge
	end

.LeftWithoutSaving
	sdefer BattleTower_LeftWithoutSaving
	setval BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	setval BATTLETOWERACTION_06
	special BattleTowerAction
.SkipEverything:
	setscene SCENE_BATTLETOWER1F_NOOP
	; fallthrough
BattleTower1FNoopScene:
	end

BattleTower1FRulesSign:
	opentext
	writetext Text_ReadBattleTowerRules
	yesorno
	iffalse .skip
	writetext Text_BattleTowerRules
	waitbutton
.skip:
	closetext
	end

BattleTower1FReceptionistScript:
	setval BATTLETOWERACTION_GET_CHALLENGE_STATE ; readmem sBattleTowerChallengeState
	special BattleTowerAction
	ifequal $3, Script_BeatenAllTrainers2 ; maps/BattleTowerBattleRoom.asm
	opentext
	writetext Text_BattleTowerWelcomesYou
	promptbutton
	setval BATTLETOWERACTION_CHECK_EXPLANATION_READ ; if new save file: bit 1, [sBattleTowerSaveFileFlags]
	special BattleTowerAction
	ifnotequal $0, Script_Menu_ChallengeExplanationCancel
	sjump Script_BattleTowerIntroductionYesNo

Script_Menu_ChallengeExplanationCancel:
	writetext Text_WantToGoIntoABattleRoom
	setval TRUE
	special Menu_ChallengeExplanationCancel
	ifequal 1, Script_ChooseChallenge
	ifequal 2, Script_BattleTowerExplanation
	sjump Script_BattleTowerHopeToServeYouAgain

Script_ChooseChallenge:
	setval BATTLETOWERACTION_RESETDATA ; ResetBattleTowerTrainerSRAM
	special BattleTowerAction
	special CheckForBattleTowerRules
	ifnotequal FALSE, Script_WaitButton
	writetext Text_SaveBeforeEnteringBattleRoom
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_BATTLETOWER1F_CHECKSTATE
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_BATTLETOWER1F_NOOP
	setval BATTLETOWERACTION_SET_EXPLANATION_READ ; set 1, [sBattleTowerSaveFileFlags]
	special BattleTowerAction
	special BattleTowerRoomMenu
	ifequal $a, Script_Menu_ChallengeExplanationCancel
	ifnotequal $0, Script_MobileError
	setval BATTLETOWERACTION_11
	special BattleTowerAction
	writetext Text_RightThisWayToYourBattleRoom
	waitbutton
	closetext
	setval BATTLETOWERACTION_CHOOSEREWARD
	special BattleTowerAction
	sjump Script_WalkToBattleTowerElevator

Script_ResumeBattleTowerChallenge:
	closetext
	setval BATTLETOWERACTION_LOADLEVELGROUP ; load choice of level group
	special BattleTowerAction
Script_WalkToBattleTowerElevator:
	musicfadeout MUSIC_NONE, 8
	setmapscene BATTLE_TOWER_BATTLE_ROOM, SCENE_BATTLETOWERBATTLEROOM_ENTER
	setmapscene BATTLE_TOWER_ELEVATOR, SCENE_BATTLETOWERELEVATOR_ENTER
	setmapscene BATTLE_TOWER_HALLWAY, SCENE_BATTLETOWERHALLWAY_ENTER
	follow BATTLETOWER1F_RECEPTIONIST, PLAYER
	applymovement BATTLETOWER1F_RECEPTIONIST, MovementData_BattleTower1FWalkToElevator
	setval BATTLETOWERACTION_0A
	special BattleTowerAction
	warpsound
	disappear BATTLETOWER1F_RECEPTIONIST
	stopfollow
	applymovement PLAYER, MovementData_BattleTowerHallwayPlayerEntersBattleRoom
	warpcheck
	end

Script_GivePlayerHisPrize:
	setval BATTLETOWERACTION_1C
	special BattleTowerAction
	setval BATTLETOWERACTION_GIVEREWARD
	special BattleTowerAction
	ifequal POTION, Script_YourPackIsStuffedFull
	getitemname STRING_BUFFER_4, USE_SCRIPT_VAR
	giveitem ITEM_FROM_MEM, 5
	writetext Text_PlayerGotFive
	setval BATTLETOWERACTION_1D
	special BattleTowerAction
	closetext
	end

Script_YourPackIsStuffedFull:
	writetext Text_YourPackIsStuffedFull
	waitbutton
	closetext
	end

Script_BattleTowerIntroductionYesNo:
	writetext Text_WouldYouLikeToHearAboutTheBattleTower
	yesorno
	iffalse Script_BattleTowerSkipExplanation
Script_BattleTowerExplanation:
	writetext Text_BattleTowerIntroduction_2
Script_BattleTowerSkipExplanation:
	setval BATTLETOWERACTION_SET_EXPLANATION_READ
	special BattleTowerAction
	sjump Script_Menu_ChallengeExplanationCancel

Script_BattleTowerHopeToServeYouAgain:
	writetext Text_WeHopeToServeYouAgain
	waitbutton
	closetext
	end

Script_MobileError2: ; unreferenced
	special BattleTowerMobileError
	closetext
	end

Script_WaitButton:
	waitbutton
	closetext
	end

Script_ChooseChallenge2: ; unreferenced
	writetext Text_SaveBeforeEnteringBattleRoom
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setval BATTLETOWERACTION_SET_EXPLANATION_READ
	special BattleTowerAction
	special Function1700ba
	ifequal $a, Script_Menu_ChallengeExplanationCancel
	ifnotequal $0, Script_MobileError
	writetext Text_ReceivedAListOfLeadersOnTheHonorRoll
	turnobject BATTLETOWER1F_RECEPTIONIST, LEFT
	writetext Text_PleaseConfirmOnThisMonitor
	waitbutton
	turnobject BATTLETOWER1F_RECEPTIONIST, DOWN
	closetext
	end

Script_StartChallenge: ; unreferenced
	setval BATTLETOWERACTION_LEVEL_CHECK
	special BattleTowerAction
	ifnotequal $0, Script_AMonLevelExceeds
	setval BATTLETOWERACTION_UBERS_CHECK
	special BattleTowerAction
	ifnotequal $0, Script_MayNotEnterABattleRoomUnderL70
	special CheckForBattleTowerRules
	ifnotequal FALSE, Script_WaitButton
	setval BATTLETOWERACTION_05
	special BattleTowerAction
	ifequal $0, .zero
	writetext Text_CantBeRegistered_PreviousRecordDeleted
	sjump .continue

.zero
	writetext Text_CantBeRegistered
.continue
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	writetext Text_SaveBeforeReentry
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_BATTLETOWER1F_CHECKSTATE
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_BATTLETOWER1F_NOOP
	setval BATTLETOWERACTION_06
	special BattleTowerAction
	setval BATTLETOWERACTION_12
	special BattleTowerAction
	writetext Text_RightThisWayToYourBattleRoom
	waitbutton
	sjump Script_ResumeBattleTowerChallenge

Script_ReachedBattleLimit: ; unreferenced
	writetext Text_FiveDayBattleLimit_Mobile
	waitbutton
	sjump Script_BattleTowerHopeToServeYouAgain

Script_AMonLevelExceeds:
	writetext Text_AMonLevelExceeds
	waitbutton
	sjump Script_Menu_ChallengeExplanationCancel

Script_MayNotEnterABattleRoomUnderL70:
	writetext Text_MayNotEnterABattleRoomUnderL70
	waitbutton
	sjump Script_Menu_ChallengeExplanationCancel

Script_MobileError:
	special BattleTowerMobileError
	closetext
	end

BattleTower_LeftWithoutSaving:
	opentext
	writetext Text_BattleTower_LeftWithoutSaving
	waitbutton
	sjump Script_BattleTowerHopeToServeYouAgain

BattleTower1FYoungsterScript:
	faceplayer
	opentext
	writetext Text_BattleTowerYoungster
	waitbutton
	closetext
	turnobject BATTLETOWER1F_YOUNGSTER, RIGHT
	end

BattleTower1FCooltrainerFScript:
	jumptextfaceplayer Text_BattleTowerCooltrainerF

BattleTower1FBugCatcherScript:
	jumptextfaceplayer Text_BattleTowerBugCatcher

BattleTower1FGrannyScript:
	jumptextfaceplayer Text_BattleTowerGranny

MovementData_BattleTower1FWalkToElevator:
	step UP
	step UP
	step UP
	step UP
	step UP
MovementData_BattleTowerHallwayPlayerEntersBattleRoom:
	step UP
	step_end

MovementData_BattleTowerElevatorExitElevator:
	step DOWN
	step_end

MovementData_BattleTowerHallwayWalkTo1020Room:
	step RIGHT
	step RIGHT
MovementData_BattleTowerHallwayWalkTo3040Room:
	step RIGHT
	step RIGHT
	step UP
	step RIGHT
	turn_head LEFT
	step_end

MovementData_BattleTowerHallwayWalkTo90100Room:
	step LEFT
	step LEFT
MovementData_BattleTowerHallwayWalkTo7080Room:
	step LEFT
	step LEFT
MovementData_BattleTowerHallwayWalkTo5060Room:
	step LEFT
	step LEFT
	step UP
	step LEFT
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomPlayerWalksIn:
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomOpponentWalksIn:
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	turn_head LEFT
	step_end

MovementData_BattleTowerBattleRoomOpponentWalksOut:
	turn_head UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

MovementData_BattleTowerBattleRoomReceptionistWalksToPlayer:
	slow_step RIGHT
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_end

MovementData_BattleTowerBattleRoomReceptionistWalksAway:
	slow_step DOWN
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomPlayerTurnsToFaceReceptionist:
	turn_head DOWN
	step_end

MovementData_BattleTowerBattleRoomPlayerTurnsToFaceNextOpponent:
	turn_head RIGHT
	step_end

Text_BattleTowerWelcomesYou:
	text "La TORRE BATALLA"
	line "et dóna la"
	cont "benvinguda!"

	para "Et puc portar a"
	line "una SALA COMBAT."
	done

Text_WantToGoIntoABattleRoom:
	text "Vols anar a una"
	line "SALA DE COMBAT?"
	done

Text_RightThisWayToYourBattleRoom:
	text "Per aquí, si us"
	line "plau, a la teva"
	cont "SALA DE COMBAT."
	done

Text_BattleTowerIntroduction_1: ; unreferenced
	text "La TORRE BATALLA"
	line "és una instal·la-"
	cont "ció de combats"
	cont "#."

	para "Molts entrenadors"
	line "de # s'hi"

	para "reuneixen de tot"
	line "arreu per lluitar"

	para "en SALES DE"
	line "COMBAT especials."

	para "Hi ha moltes"
	line "SALES DE COMBAT"
	cont "a la TORRE."

	para "Cada SALA té set"
	line "entrenadors."

	para "Si derrotes els"
	line "set d'una SALA,"

	para "i tens un bon"
	line "rècord, podries"

	para "esdevenir el"
	line "LÍDER de la SALA."

	para "Tots els LÍDERS"
	line "seran inclosos al"

	para "QUADRE D'HONOR"
	line "per a la història."

	para "Pots competir en"
	line "fins a cinc"

	para "SALES DE COMBAT"
	line "cada dia."

	para "Però només pots"
	line "lluitar un cop al"

	para "dia a cada"
	line "SALA."

	para "Per interrompre"
	line "una sessió, has"

	para "de DESAR. Si no,"
	line "no podràs"

	para "reprendre el"
	line "desafiament."

	para ""
	done

Text_BattleTowerIntroduction_2:
	text "La TORRE BATALLA"
	line "és una instal·la-"
	cont "ció de combats"
	cont "#."

	para "Molts entrenadors"
	line "de # s'hi"

	para "reuneixen de tot"
	line "arreu per lluitar"

	para "en SALES DE"
	line "COMBAT especials."

	para "Hi ha moltes"
	line "SALES DE COMBAT"
	cont "a la TORRE."

	para "Cada SALA té set"
	line "entrenadors."

	para "Venç-los tots i"
	line "guanya un premi."

	para "Per interrompre"
	line "una sessió, has"

	para "de DESAR. Si no,"
	line "no podràs"

	para "reprendre el"
	line "desafiament."

	para ""
	done

Text_ReceivedAListOfLeadersOnTheHonorRoll:
	text "Has rebut la"
	line "llista de LÍDERS"
	cont "del QUADRE"
	cont "D'HONOR."

	para ""
	done

Text_PleaseConfirmOnThisMonitor:
	text "Si us plau,"
	line "confirma-ho en"
	cont "aquest monitor."
	done

Text_ThankYou: ; unreferenced
	text "Gràcies!"

	para ""
	done

Text_ThanksForVisiting:
	text "Gràcies per la"
	line "visita!"
	done

Text_BeatenAllTheTrainers_Mobile: ; unreferenced
	text "Felicitats!"

	para "Has vençut tots"
	line "els entrenadors!"

	para "La teva fita pot"
	line "ser digna de"

	para "registrar-se,"
	line "<PLAYER>. Amb els"

	para "teus resultats,"
	line "podries ser"

	para "escollit com a"
	line "LÍDER DE SALA."

	para ""
	done

Text_CongratulationsYouveBeatenAllTheTrainers:
	text "Felicitats!"

	para "Has vençut tots"
	line "els entrenadors!"

	para "Per això, reps"
	line "aquest gran premi!"

	para ""
	done

Text_AskRegisterRecord_Mobile: ; unreferenced
	text "Voldries registrar"
	line "el teu rècord"

	para "al CENTRE?"
	done

Text_PlayerGotFive:
	text "<PLAYER> ha rebut"
	line "cinc @"
	text_ram wStringBuffer4
	text "!@"
	sound_item
	text_promptbutton
	text_end

Text_YourPackIsStuffedFull:
	text "Ui, la MOTXILLA"
	line "és massa plena."

	para "Fes lloc i torna,"
	line "si us plau."
	done

Text_YourRegistrationIsComplete: ; unreferenced
	text "El teu registre"
	line "s'ha completat."

	para "Torna quan"
	line "vulguis!"
	done

Text_WeHopeToServeYouAgain:
	text "Esperem poder"
	line "atendre't aviat."
	done

Text_PleaseStepThisWay:
	text "Per aquí, si us"
	line "plau."
	done

Text_WouldYouLikeToHearAboutTheBattleTower:
	text "Vols saber més"
	line "sobre la TORRE"
	cont "BATALLA?"
	done

Text_CantBeRegistered:
	text "El teu rècord de"
	line "l'anterior SALA"

	para "DE COMBAT no es"
	line "pot registrar."
	cont "D'acord?"
	done

Text_CantBeRegistered_PreviousRecordDeleted:
	text "El teu rècord de"
	line "l'anterior SALA"

	para "DE COMBAT no es"
	line "pot registrar."

	para "A més, el rècord"
	line "existent serà"
	cont "esborrat. D'acord?"
	done

Text_CheckTheLeaderHonorRoll: ; unreferenced
	text "Vols consultar el"
	line "QUADRE D'HONOR"
	cont "dels LÍDERS?"
	done

Text_ReadBattleTowerRules:
	text "Aquí hi ha les"
	line "normes de la TORRE"
	cont "BATALLA."

	para "Vols llegir-les?"
	done

Text_BattleTowerRules:
	text "Tres # poden"
	line "entrar en combat."

	para "Tots tres han de"
	line "ser diferents."

	para "Els objectes que"
	line "portin també han"
	cont "de ser diferents."

	para "Alguns #"
	line "poden tenir"

	para "restriccions de"
	line "nivell."
	done

Text_BattleTower_LeftWithoutSaving:
	text "Perdona!"
	line "No vas DESAR"

	para "abans de sortir"
	line "de la SALA."

	para "Ho sento molt,"
	line "però el teu"

	para "desafiament serà"
	line "declarat invàlid."
	done

Text_YourMonWillBeHealedToFullHealth:
	text "Els teus #"
	line "seran"
	cont "curats del tot."
	done

Text_NextUpOpponentNo:
	text "Ara, l'oponent"
	line "núm.@"
	text_ram wStringBuffer3
	text ". Preparat?"
	done

Text_SaveBeforeConnecting_Mobile: ; unreferenced
	text "La sessió es"
	line "DESARÀ abans de"

	para "connectar amb"
	line "el CENTRE."
	done

Text_SaveBeforeEnteringBattleRoom:
	text "Abans d'entrar a"
	line "la SALA DE"

	para "COMBAT, el progrés"
	line "es desarà."
	done

Text_SaveAndEndTheSession:
	text "Vols DESAR i"
	line "acabar la sessió?"
	done

Text_SaveBeforeReentry:
	text "El teu rècord es"
	line "DESARÀ abans de"

	para "tornar a l'ante-"
	line "rior SALA."
	done

Text_CancelYourBattleRoomChallenge:
	text "Vols cancel·lar el"
	line "desafiament de"
	cont "la SALA?"
	done

Text_RegisterRecordOnFile_Mobile: ; unreferenced
	text "Tenim el teu"
	line "rècord anterior"

	para "arxivat. Voldries"
	line "registrar-lo al"
	cont "CENTRE?"
	done

Text_WeveBeenWaitingForYou:
	text "T'estàvem"
	line "esperant. Per"

	para "aquí a una SALA"
	line "DE COMBAT."
	done

Text_FiveDayBattleLimit_Mobile:
	text "Només pots entrar"
	line "a cinc SALES DE"
	cont "COMBAT cada dia."

	para "Torna demà,"
	line "si us plau."
	done

Text_TooMuchTimeElapsedNoRegister:
	text "Ho sento, però no"
	line "és possible"

	para "registrar el teu"
	line "rècord actual al"

	para "CENTRE perquè ha"
	line "passat massa temps"

	para "des de l'inici"
	line "del desafiament."
	done

Text_RegisterRecordTimedOut_Mobile: ; unreferenced
; duplicate of Text_TooMuchTimeElapsedNoRegister
	text "Ho sento, però no"
	line "és possible"

	para "registrar el teu"
	line "rècord més recent"

	para "al CENTRE perquè"
	line "ha passat massa"

	para "temps des de"
	line "l'inici del"
	cont "desafiament."
	done

Text_AMonLevelExceeds:
	text "El nivell d'un o"
	line "més dels teus"
	cont "# supera @"
	text_decimal wScriptVar, 1, 3
	text "."
	done

Text_MayNotEnterABattleRoomUnderL70:
	text_ram wcd49
	text " no pot"
	line "entrar a una SALA"
	cont "DE COMBAT sota"
	cont "N70."

	para "Aquesta SALA és"
	line "per a N@"
	text_decimal wScriptVar, 1, 3
	text "."
	done

Text_BattleTowerYoungster:
	text "Destruït pel"
	line "primer oponent"

	para "en un tres i no"
	line "res… No valc…"
	done

Text_BattleTowerCooltrainerF:
	text "Hi ha moltes"
	line "SALES DE COMBAT,"

	para "però les guanyaré"
	line "totes!"
	done

Text_BattleTowerGranny:
	text "És molt dur no"
	line "poder usar"

	para "objectes durant"
	line "el combat."

	para "Fer que els teus"
	line "# portin"

	para "objectes és la"
	line "clau per guanyar."
	done

Text_BattleTowerBugCatcher:
	text "Vull veure fins"
	line "on puc arribar"

	para "només amb # de"
	line "tipus insecte."

	para "Que no hi hagi"
	line "# de foc…"
	done

BattleTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  9, BATTLE_TOWER_OUTSIDE, 3
	warp_event  8,  9, BATTLE_TOWER_OUTSIDE, 4
	warp_event  7,  0, BATTLE_TOWER_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event  6,  6, BGEVENT_READ, BattleTower1FRulesSign

	def_object_events
	object_event  7,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower1FReceptionistScript, -1
	object_event 14,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BattleTower1FYoungsterScript, -1
	object_event  4,  9, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTower1FCooltrainerFScript, -1
	object_event  1,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleTower1FBugCatcherScript, -1
	object_event 14,  3, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower1FGrannyScript, -1
