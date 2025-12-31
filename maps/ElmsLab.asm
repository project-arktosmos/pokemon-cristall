object_const_def
	const ELMSLAB_ELM
	const ELMSLAB_ELMS_AIDE
	const ELMSLAB_POKE_BALL1
	const ELMSLAB_POKE_BALL2
	const ELMSLAB_POKE_BALL3
	const ELMSLAB_OFFICER

ElmsLab_MapScripts:
	def_scene_scripts
	scene_script ElmsLabMeetElmScene, SCENE_ELMSLAB_MEET_ELM
	scene_script ElmsLabNoop1Scene,   SCENE_ELMSLAB_CANT_LEAVE
	scene_script ElmsLabNoop2Scene,   SCENE_ELMSLAB_NOOP
	scene_script ElmsLabNoop3Scene,   SCENE_ELMSLAB_MEET_OFFICER
	scene_script ElmsLabNoop4Scene,   SCENE_ELMSLAB_UNUSED
	scene_script ElmsLabNoop5Scene,   SCENE_ELMSLAB_AIDE_GIVES_POTION
	scene_const SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS

	def_callbacks
	callback MAPCALLBACK_OBJECTS, ElmsLabMoveElmCallback

ElmsLabMeetElmScene:
	sdefer ElmsLabWalkUpToElmScript
	end

ElmsLabNoop1Scene:
	end

ElmsLabNoop2Scene:
	end

ElmsLabNoop3Scene:
	end

ElmsLabNoop4Scene:
	end

ElmsLabNoop5Scene:
	end

ElmsLabMoveElmCallback:
	checkscene
	iftrue .Skip ; not SCENE_ELMSLAB_MEET_ELM
	moveobject ELMSLAB_ELM, 3, 4
.Skip:
	endcallback

ElmsLabWalkUpToElmScript:
	applymovement PLAYER, ElmsLab_WalkUpToElmMovement
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	turnobject ELMSLAB_ELM, RIGHT
	opentext
	writetext ElmText_Intro
.MustSayYes:
	yesorno
	iftrue .ElmGetsEmail
	writetext ElmText_Refused
	sjump .MustSayYes

.ElmGetsEmail:
	writetext ElmText_Accepted
	promptbutton
	writetext ElmText_ResearchAmbitions
	waitbutton
	closetext
	playsound SFX_GLASS_TING
	pause 30
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 10
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext ElmText_GotAnEmail
	waitbutton
	closetext
	opentext
	turnobject ELMSLAB_ELM, RIGHT
	writetext ElmText_MissionFromMrPokemon
	waitbutton
	closetext
	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement1
	turnobject PLAYER, UP
	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement2
	turnobject PLAYER, RIGHT
	opentext
	writetext ElmText_ChooseAPokemon
	waitbutton
	setscene SCENE_ELMSLAB_CANT_LEAVE
	closetext
	end

ProfElmScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue ElmCheckMasterBall
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue ElmGiveTicketScript
ElmCheckMasterBall:
	checkevent EVENT_GOT_MASTER_BALL_FROM_ELM
	iftrue ElmCheckEverstone
	checkflag ENGINE_RISINGBADGE
	iftrue ElmGiveMasterBallScript
ElmCheckEverstone:
	checkevent EVENT_GOT_EVERSTONE_FROM_ELM
	iftrue ElmScript_CallYou
	checkevent EVENT_SHOWED_TOGEPI_TO_ELM
	iftrue ElmGiveEverstoneScript
	checkevent EVENT_TOLD_ELM_ABOUT_TOGEPI_OVER_THE_PHONE
	iffalse ElmCheckTogepiEgg
	setval TOGEPI
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	setval TOGETIC
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	writetext ElmThoughtEggHatchedText
	waitbutton
	closetext
	end

ElmEggHatchedScript:
	setval TOGEPI
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	setval TOGETIC
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	sjump ElmCheckGotEggAgain

ElmCheckTogepiEgg:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iffalse ElmCheckGotEggAgain
	checkevent EVENT_TOGEPI_HATCHED
	iftrue ElmEggHatchedScript
ElmCheckGotEggAgain:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE ; why are we checking it again?
	iftrue ElmWaitingEggHatchScript
	checkflag ENGINE_ZEPHYRBADGE
	iftrue ElmAideHasEggScript
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue ElmStudyingEggScript
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue ElmAfterTheftScript
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue ElmDescribesMrPokemonScript
	writetext ElmText_LetYourMonBattleIt
	waitbutton
	closetext
	end

LabTryToLeaveScript:
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext LabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, ElmsLab_CantLeaveMovement
	end

CyndaquilPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	reanchormap
	pokepic CYNDAQUIL
	cry CYNDAQUIL
	waitbutton
	closepokepic
	opentext
	writetext TakeCyndaquilText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, CYNDAQUIL
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke CYNDAQUIL, 5, BERRY
	closetext
	readvar VAR_FACING
	ifequal RIGHT, ElmDirectionsScript
	applymovement PLAYER, AfterCyndaquilMovement
	sjump ElmDirectionsScript

TotodilePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	reanchormap
	pokepic TOTODILE
	cry TOTODILE
	waitbutton
	closepokepic
	opentext
	writetext TakeTotodileText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, TOTODILE
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke TOTODILE, 5, BERRY
	closetext
	applymovement PLAYER, AfterTotodileMovement
	sjump ElmDirectionsScript

ChikoritaPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	reanchormap
	pokepic CHIKORITA
	cry CHIKORITA
	waitbutton
	closepokepic
	opentext
	writetext TakeChikoritaText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, CHIKORITA
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke CHIKORITA, 5, BERRY
	closetext
	applymovement PLAYER, AfterChikoritaMovement
	sjump ElmDirectionsScript

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	closetext
	end

ElmDirectionsScript:
	turnobject PLAYER, UP
	opentext
	writetext ElmDirectionsText1
	waitbutton
	closetext
	addcellnum PHONE_ELM
	opentext
	writetext GotElmsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, LEFT
	opentext
	writetext ElmDirectionsText2
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext ElmDirectionsText3
	waitbutton
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_ELM
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setscene SCENE_ELMSLAB_AIDE_GIVES_POTION
	setmapscene NEW_BARK_TOWN, SCENE_NEWBARKTOWN_NOOP
	end

ElmDescribesMrPokemonScript:
	writetext ElmDescribesMrPokemonText
	waitbutton
	closetext
	end

LookAtElmPokeBallScript:
	opentext
	writetext ElmPokeBallText
	waitbutton
	closetext
	end

ElmsLabHealingMachine:
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .CanHeal
	writetext ElmsLabHealingMachineText1
	waitbutton
	closetext
	end

.CanHeal:
	writetext ElmsLabHealingMachineText2
	yesorno
	iftrue ElmsLabHealingMachine_HealParty
	closetext
	end

ElmsLabHealingMachine_HealParty:
	special StubbedTrainerRankings_Healings
	special HealParty
	playmusic MUSIC_NONE
	setval HEALMACHINE_ELMS_LAB
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	closetext
	end

ElmAfterTheftDoneScript:
	waitbutton
	closetext
	end

ElmAfterTheftScript:
	writetext ElmAfterTheftText1
	checkitem MYSTERY_EGG
	iffalse ElmAfterTheftDoneScript
	promptbutton
	writetext ElmAfterTheftText2
	waitbutton
	takeitem MYSTERY_EGG
	scall ElmJumpBackScript1
	writetext ElmAfterTheftText3
	waitbutton
	scall ElmJumpBackScript2
	writetext ElmAfterTheftText4
	promptbutton
	writetext ElmAfterTheftText5
	promptbutton
	setevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	setflag ENGINE_MOBILE_SYSTEM
	setmapscene ROUTE_29, SCENE_ROUTE29_CATCH_TUTORIAL
	clearevent EVENT_ROUTE_30_YOUNGSTER_JOEY
	setevent EVENT_ROUTE_30_BATTLE
	writetext ElmAfterTheftText6
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS
	end

ElmStudyingEggScript:
	writetext ElmStudyingEggText
	waitbutton
	closetext
	end

ElmAideHasEggScript:
	writetext ElmAideHasEggText
	waitbutton
	closetext
	end

ElmWaitingEggHatchScript:
	writetext ElmWaitingEggHatchText
	waitbutton
	closetext
	end

ShowElmTogepiScript:
	writetext ShowElmTogepiText1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	setevent EVENT_SHOWED_TOGEPI_TO_ELM
	opentext
	writetext ShowElmTogepiText2
	promptbutton
	writetext ShowElmTogepiText3
	promptbutton
ElmGiveEverstoneScript:
	writetext ElmGiveEverstoneText1
	promptbutton
	verbosegiveitem EVERSTONE
	iffalse ElmScript_NoRoomForEverstone
	writetext ElmGiveEverstoneText2
	waitbutton
	closetext
	setevent EVENT_GOT_EVERSTONE_FROM_ELM
	end

ElmScript_CallYou:
	writetext ElmText_CallYou
	waitbutton
ElmScript_NoRoomForEverstone:
	closetext
	end

ElmGiveMasterBallScript:
	writetext ElmGiveMasterBallText1
	promptbutton
	verbosegiveitem MASTER_BALL
	iffalse .notdone
	setevent EVENT_GOT_MASTER_BALL_FROM_ELM
	writetext ElmGiveMasterBallText2
	waitbutton
.notdone
	closetext
	end

ElmGiveTicketScript:
	writetext ElmGiveTicketText1
	promptbutton
	verbosegiveitem S_S_TICKET
	setevent EVENT_GOT_SS_TICKET_FROM_ELM
	writetext ElmGiveTicketText2
	waitbutton
	closetext
	end

ElmJumpBackScript1:
	closetext
	readvar VAR_FACING
	ifequal DOWN, ElmJumpDownScript
	ifequal UP, ElmJumpUpScript
	ifequal LEFT, ElmJumpLeftScript
	ifequal RIGHT, ElmJumpRightScript
	end

ElmJumpBackScript2:
	closetext
	readvar VAR_FACING
	ifequal DOWN, ElmJumpUpScript
	ifequal UP, ElmJumpDownScript
	ifequal LEFT, ElmJumpRightScript
	ifequal RIGHT, ElmJumpLeftScript
	end

ElmJumpUpScript:
	applymovement ELMSLAB_ELM, ElmJumpUpMovement
	opentext
	end

ElmJumpDownScript:
	applymovement ELMSLAB_ELM, ElmJumpDownMovement
	opentext
	end

ElmJumpLeftScript:
	applymovement ELMSLAB_ELM, ElmJumpLeftMovement
	opentext
	end

ElmJumpRightScript:
	applymovement ELMSLAB_ELM, ElmJumpRightMovement
	opentext
	end

AideScript_WalkPotion1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkPotion2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GivePotion:
	opentext
	writetext AideText_GiveYouPotion
	promptbutton
	verbosegiveitem POTION
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_NOOP
	end

AideScript_WalkBalls1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkBalls2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GiveYouBalls:
	opentext
	writetext AideText_GiveYouBalls
	promptbutton
	getitemname STRING_BUFFER_4, POKE_BALL
	scall AideScript_ReceiveTheBalls
	giveitem POKE_BALL, 5
	writetext AideText_ExplainBalls
	promptbutton
	itemnotify
	closetext
	setscene SCENE_ELMSLAB_NOOP
	end

AideScript_ReceiveTheBalls:
	jumpstd ReceiveItemScript
	end

ElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue AideScript_AfterTheft
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue AideScript_ExplainBalls
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue AideScript_TheftTestimony
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	end

AideScript_TheftTestimony:
	writetext AideText_TheftTestimony
	waitbutton
	closetext
	end

AideScript_ExplainBalls:
	writetext AideText_ExplainBalls
	waitbutton
	closetext
	end

AideScript_AfterTheft:
	writetext AideText_AfterTheft
	waitbutton
	closetext
	end

MeetCopScript2:
	applymovement PLAYER, MeetCopScript2_StepLeft

MeetCopScript:
	applymovement PLAYER, MeetCopScript_WalkUp
CopScript:
	turnobject ELMSLAB_OFFICER, LEFT
	opentext
	writetext ElmsLabOfficerText1
	promptbutton
	special NameRival
	writetext ElmsLabOfficerText2
	waitbutton
	closetext
	applymovement ELMSLAB_OFFICER, OfficerLeavesMovement
	disappear ELMSLAB_OFFICER
	setscene SCENE_ELMSLAB_NOOP
	end

ElmsLabWindow:
	opentext
	checkflag ENGINE_FLYPOINT_VIOLET
	iftrue .Normal
	checkevent EVENT_ELM_CALLED_ABOUT_STOLEN_POKEMON
	iftrue .BreakIn
	sjump .Normal

.BreakIn:
	writetext ElmsLabWindowText2
	waitbutton
	closetext
	end

.Normal:
	writetext ElmsLabWindowText1
	waitbutton
	closetext
	end

ElmsLabTravelTip1:
	jumptext ElmsLabTravelTip1Text

ElmsLabTravelTip2:
	jumptext ElmsLabTravelTip2Text

ElmsLabTravelTip3:
	jumptext ElmsLabTravelTip3Text

ElmsLabTravelTip4:
	jumptext ElmsLabTravelTip4Text

ElmsLabTrashcan:
	jumptext ElmsLabTrashcanText

ElmsLabPC:
	jumptext ElmsLabPCText

ElmsLabTrashcan2: ; unreferenced
	jumpstd TrashCanScript

ElmsLabBookshelf:
	jumpstd DifficultBookshelfScript

ElmsLab_WalkUpToElmMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

ElmsLab_CantLeaveMovement:
	step UP
	step_end

MeetCopScript2_StepLeft:
	step LEFT
	step_end

MeetCopScript_WalkUp:
	step UP
	step UP
	turn_head RIGHT
	step_end

OfficerLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

AideWalksRight1:
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksRight2:
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksLeft1:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

AideWalksLeft2:
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

ElmJumpUpMovement:
	fix_facing
	big_step UP
	remove_fixed_facing
	step_end

ElmJumpDownMovement:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

ElmJumpLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

ElmJumpRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

ElmsLab_ElmToDefaultPositionMovement1:
	step UP
	step_end

ElmsLab_ElmToDefaultPositionMovement2:
	step RIGHT
	step RIGHT
	step UP
	turn_head DOWN
	step_end

AfterCyndaquilMovement:
	step LEFT
	step UP
	turn_head UP
	step_end

AfterTotodileMovement:
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

AfterChikoritaMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

ElmText_Intro:
	text "ELM: <PLAY_G>!"
	line "Ja ets aquí!"

	para "Necessito demanar-"
	line "te un favor."

	para "Estic fent una"
	line "recerca sobre"
	cont "#-"
	cont "MON."

	para "Volia saber si em"
	line "pots ajudar,"
	cont "<PLAY_G>."

	para "Mira…"

	para "Estic escrivint"
	line "un article que"

	para "vull presentar en"
	line "una conferència."

	para "Però hi ha coses"
	line "que encara no"
	cont "entenc bé."

	para "Per tant!"

	para "M'agradaria que"
	line "criessis un"
	cont "#MON"

	para "que vaig atrapar"
	line "fa poc."
	done

ElmText_Accepted:
	text "Gràcies, <PLAY_G>!"

	para "M'ajudes molt!"
	done

ElmText_Refused:
	text "Però… Si us plau,"
	line "necessito ajuda!"
	done

ElmText_ResearchAmbitions:
	text "Quan anunciï els"
	line "resultats, segur"

	para "que aprofundirem"
	line "més en els molts"

	para "misteris dels"
	line "#MON."

	para "Compta-hi!"
	done

ElmText_GotAnEmail:
	text "Oh! Tinc un"
	line "correu!"

	para "<……><……><……>"
	line "Hm… Ajà…"

	para "D'acord…"
	done

ElmText_MissionFromMrPokemon:
	text "Escolta."

	para "Conec un home"
	line "anomenat SR."
	cont "#MON."

	para "Sempre troba"
	line "coses estranyes i"

	para "va presumint dels"
	line "seus descobriments"

	para "De fet, m'acaba"
	line "d'arribar un"

	para "correu seu dient"
	line "que ara és real."

	para "És intrigant,"
	line "però estem molt"

	para "ocupats amb la"
	line "recerca #MON…"

	para "Espera!"

	para "Ja ho sé!"

	para "<PLAY_G>, pots"
	line "anar-hi per"
	cont "nosaltres?"
	done

ElmText_ChooseAPokemon:
	text "Vull que criïs un"
	line "dels #MON"

	para "d'aquestes"
	line "POKÉ BALLS."

	para "Seràs el primer"
	line "company d'aquest"
	cont "#MON, <PLAY_G>!"

	para "Endavant, tria'n"
	line "un!"
	done

ElmText_LetYourMonBattleIt:
	text "Si apareix un"
	line "#MON salvatge,"

	para "fes que el teu"
	line "#MON lluiti!"
	done

LabWhereGoingText:
	text "ELM: Espera! On"
	line "vas?"
	done

TakeCyndaquilText:
	text "ELM: Agafaràs"
	line "CYNDAQUIL, el"
	cont "# de foc?"
	done

TakeTotodileText:
	text "ELM: Vols"
	line "TOTODILE, el"
	cont "# d'aigua?"
	done

TakeChikoritaText:
	text "ELM: T'agrada"
	line "CHIKORITA, el"
	cont "# de planta?"
	done

DidntChooseStarterText:
	text "ELM: Pensa-t'ho"
	line "bé."

	para "El teu company és"
	line "important."
	done

ChoseStarterText:
	text "ELM: Trobo que és"
	line "un gran #MON!"
	done

ReceivedStarterText:
	text "<PLAYER> ha rebut"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

ElmDirectionsText1:
	text "El SR.#MON viu"
	line "una mica més"

	para "enllà de CIRERER,"
	line "la propera ciutat."

	para "És gairebé una"
	line "ruta directa,"

	para "així que no et"
	line "pots perdre."

	para "Però per si de"
	line "cas, aquí tens el"

	para "meu telèfon."
	line "Truca'm si passa"
	cont "res!"
	done

ElmDirectionsText2:
	text "Si el teu #MON"
	line "està ferit,"

	para "cura'l amb aquesta"
	line "màquina."

	para "Fes-la servir"
	line "quan vulguis."
	done

ElmDirectionsText3:
	text "<PLAY_G>, confio"
	line "en tu!"
	done

GotElmsNumberText:
	text "<PLAYER> ha"
	line "obtingut"
	cont "el núm. d'ELM."
	done

ElmDescribesMrPokemonText:
	text "El SR.#MON va"
	line "a tot arreu i"
	cont "troba rareses."

	para "Llàstima que són"
	line "rares però poc"
	cont "útils…"
	done

ElmPokeBallText:
	text "Conté un #MON"
	line "capturat pel"
	cont "PROF.ELM."
	done

ElmsLabHealingMachineText1:
	text "Què deu fer això?"
	done

ElmsLabHealingMachineText2:
	text "Vols curar els"
	line "teus #MON?"
	done

ElmAfterTheftText1:
	text "ELM: <PLAY_G>,"
	line "això és terrible…"

	para "Ah, sí, què era"
	line "el descobriment"

	para "del SR.#MON?"
	done

ElmAfterTheftText2:
	text "<PLAYER> ha donat"
	line "l'OU MISTERIÓS al"
	cont "PROF.ELM."
	done

ElmAfterTheftText3:
	text "ELM: Això?"
	done

ElmAfterTheftText4:
	text "Però… és un"
	line "OU de #MON?"

	para "Si ho és, és un"
	line "gran descobriment!"
	done

ElmAfterTheftText5:
	text "ELM: Què?!?"

	para "El PROF.OAK t'ha"
	line "donat una #DEX?"

	para "<PLAY_G>, és cert?"
	line "És increïble!"

	para "Ell és expert a"
	line "veure el potencial"

	para "de la gent com a"
	line "entrenadors."

	para "Uau, <PLAY_G>. Pot"
	line "ser que tinguis"

	para "el que cal per"
	line "ser el CAMPIÓ."

	para "Sembla que et va"
	line "molt bé amb els"
	cont "#MON."

	para "Hauries de fer el"
	line "repte dels GIMNA-"
	cont "SOS #MON."

	para "El GIMNÀS més"
	line "proper és el de"
	cont "CIUTAT VIOLETA."
	done

ElmAfterTheftText6:
	text "…<PLAY_G>. El camí"
	line "cap al campionat"
	cont "serà llarg."

	para "Abans de marxar,"
	line "assegura't de"

	para "parlar amb la"
	line "teva mare."
	done

ElmStudyingEggText:
	text "ELM: No et rendei-"
	line "xis! Et trucaré si"

	para "descobreixo res"
	line "sobre l'OU!"
	done

ElmAideHasEggText:
	text "ELM: <PLAY_G>?"
	line "No has vist el"
	cont "meu ajudant?"

	para "S'havia de trobar"
	line "amb tu amb l'OU"

	para "al CENTRE #MON"
	line "de VIOLETA."

	para "Us deveu haver"
	line "creuat. Intenta"
	cont "trobar-lo allà."
	done

ElmWaitingEggHatchText:
	text "ELM: Ei, l'OU ha"
	line "canviat gens?"
	done

ElmThoughtEggHatchedText:
	text "<PLAY_G>? Pensava"
	line "que l'OU havia"
	cont "eclosionat."

	para "On és el #MON?"
	done

ShowElmTogepiText1:
	text "ELM: <PLAY_G>, tens"
	line "molt bona cara!"
	done

ShowElmTogepiText2:
	text "Què?"
	line "Aquest #MON!?!"
	done

ShowElmTogepiText3:
	text "L'OU ha eclosio-"
	line "nat! Així que els"

	para "#MON neixen"
	line "d'ous…"

	para "No, potser no"
	line "tots els #MON."

	para "Uau, encara queda"
	line "molta recerca per"
	cont "fer."
	done

ElmGiveEverstoneText1:
	text "Gràcies, <PLAY_G>!"
	line "Ens ajudes a des-"

	para "vetllar misteris"
	line "dels #MON!"

	para "Vull que tinguis"
	line "això com a mostra"
	cont "d'agraïment."
	done

ElmGiveEverstoneText2:
	text "És una"
	line "PEDRA CONSTANT."

	para "Algunes espècies"
	line "de #MON"
	cont "evolucio-"

	para "nen quan arriben"
	line "a certs nivells."

	para "Un #MON que"
	line "porti la PEDRA"

	para "CONSTANT no"
	line "evolucionarà."

	para "Dóna-la a un"
	line "#MON que no"

	para "vulguis que"
	line "evolucioni."
	done

ElmText_CallYou:
	text "ELM: <PLAY_G>, et"
	line "trucaré si passa"
	cont "alguna cosa."
	done

AideText_AfterTheft:
	text "…suspir… El"
	line "#MON robat."

	para "Em pregunto com"
	line "li deu anar."

	para "Diuen que un"
	line "#MON criat per"

	para "algú dolent es"
	line "torna dolent."
	done

ElmGiveMasterBallText1:
	text "ELM: Hola,"
	line "<PLAY_G>! Gràcies"

	para "a tu, la recerca"
	line "va molt bé!"

	para "Tingues això com"
	line "a mostra del meu"
	cont "agraïment."
	done

ElmGiveMasterBallText2:
	text "La MASTER BALL és"
	line "la millor!"

	para "És la BALL"
	line "definitiva!"

	para "Atraparà qualsevol"
	line "#MON segur."

	para "Només es dona a"
	line "investigadors"
	cont "#MON"
	cont "reconeguts."

	para "Crec que li pots"
	line "donar millor ús"
	cont "que jo, <PLAY_G>!"
	done

ElmGiveTicketText1:
	text "ELM: <PLAY_G>!"
	line "Ja ets aquí!"

	para "He trucat perquè"
	line "tinc una cosa"
	cont "per a tu."

	para "Mira! És un"
	line "BITLLET S.S."

	para "Ara pots atrapar"
	line "#MON a KANTO."
	done

ElmGiveTicketText2:
	text "El vaixell surt"
	line "de CIUTAT OLIVA."

	para "Però ja ho sabies,"
	line "<PLAY_G>."

	para "Al cap i a la fi,"
	line "has viatjat per"

	para "tot arreu amb els"
	line "teus #MON."

	para "Saluda el"
	line "PROF.OAK de part"
	cont "meva a KANTO!"
	done

ElmsLabMonEggText: ; unreferenced
	text "És l'OU #MON"
	line "que estudia el"
	cont "PROF.ELM."
	done

AideText_GiveYouPotion:
	text "<PLAY_G>, vull que"
	line "tinguis això per"
	cont "a l'encàrrec."
	done

AideText_AlwaysBusy:
	text "Només som dos,"
	line "així que sempre"
	cont "estem ocupats."
	done

AideText_TheftTestimony:
	text "Hi ha hagut un"
	line "soroll fort fora…"

	para "Quan hem anat a"
	line "mirar, algú havia"
	cont "robat un #MON."

	para "És increïble que"
	line "algú faci això!"

	para "…suspir… El"
	line "#MON robat."

	para "Em pregunto com"
	line "li deu anar."

	para "Diuen que un"
	line "#MON criat per"

	para "algú dolent es"
	line "torna dolent."
	done

AideText_GiveYouBalls:
	text "<PLAY_G>!"

	para "Fes servir això"
	line "per a la #DEX!"
	done

AideText_ExplainBalls:
	text "Per afegir a la"
	line "#DEX, has"
	cont "d'atrapar #MON."

	para "Llança # BALLS"
	line "als #MON"
	cont "salvatges."
	done

ElmsLabOfficerText1:
	text "He sentit que han"
	line "robat un #MON…"

	para "Estava recollint"
	line "informació del"
	cont "PROF.ELM."

	para "Pel que sembla,"
	line "era un jove amb"
	cont "cabells llargs"
	cont "i vermells…"

	para "Què?"

	para "Has lluitat contra"
	line "un entrenador"
	cont "així?"

	para "Vas saber com"
	line "es deia?"
	done

ElmsLabOfficerText2:
	text "D'acord! Així que"
	line "<RIVAL> era el"
	cont "nom."

	para "Gràcies per ajudar"
	line "la investigació!"
	done

ElmsLabWindowText1:
	text "La finestra és"
	line "oberta."

	para "Entra una brisa"
	line "agradable."
	done

ElmsLabWindowText2:
	text "Ha entrat per"
	line "aquí!"
	done

ElmsLabTravelTip1Text:
	text "<PLAYER> ha obert"
	line "un llibre."

	para "Consell 1:"

	para "Prem START per"
	line "obrir el MENÚ."
	done

ElmsLabTravelTip2Text:
	text "<PLAYER> ha obert"
	line "un llibre."

	para "Consell 2:"

	para "Desa la partida"
	line "amb DESAR!"
	done

ElmsLabTravelTip3Text:
	text "<PLAYER> ha obert"
	line "un llibre."

	para "Consell 3:"

	para "Obre la MOTXILLA"
	line "i prem SELECT"
	cont "per moure coses."
	done

ElmsLabTravelTip4Text:
	text "<PLAYER> ha obert"
	line "un llibre."

	para "Consell 4:"

	para "Mira els atacs"
	line "del teu #MON."

	para "Prem el Botó A"
	line "per canviar-los."
	done

ElmsLabTrashcanText:
	text "Hi ha el paper de"
	line "l'esmorzar del"
	cont "PROF.ELM…"
	done

ElmsLabPCText:
	text "OBSERVACIONS SOBRE"
	line "L'EVOLUCIÓ #MON"

	para "…Diu a la"
	line "pantalla…"
	done

ElmsLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, NEW_BARK_TOWN, 1
	warp_event  5, 11, NEW_BARK_TOWN, 1

	def_coord_events
	coord_event  4,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  5,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  4,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript
	coord_event  5,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript2
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotion1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotion2
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS, AideScript_WalkBalls1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS, AideScript_WalkBalls2

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, ElmsLabHealingMachine
	bg_event  6,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  0,  7, BGEVENT_READ, ElmsLabTravelTip1
	bg_event  1,  7, BGEVENT_READ, ElmsLabTravelTip2
	bg_event  2,  7, BGEVENT_READ, ElmsLabTravelTip3
	bg_event  3,  7, BGEVENT_READ, ElmsLabTravelTip4
	bg_event  6,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  3, BGEVENT_READ, ElmsLabTrashcan
	bg_event  5,  0, BGEVENT_READ, ElmsLabWindow
	bg_event  3,  5, BGEVENT_DOWN, ElmsLabPC

	def_object_events
	object_event  5,  2, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfElmScript, -1
	object_event  2,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ElmsAideScript, EVENT_ELMS_AIDE_IN_LAB
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  5,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CopScript, EVENT_COP_IN_ELMS_LAB
