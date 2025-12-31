DEF BLUE_CARD_POINT_CAP EQU 30

	object_const_def
	const RADIOTOWER2F_SUPER_NERD
	const RADIOTOWER2F_TEACHER
	const RADIOTOWER2F_ROCKET1
	const RADIOTOWER2F_ROCKET2
	const RADIOTOWER2F_ROCKET3
	const RADIOTOWER2F_ROCKET_GIRL
	const RADIOTOWER2F_BLACK_BELT1
	const RADIOTOWER2F_BLACK_BELT2
	const RADIOTOWER2F_JIGGLYPUFF
	const RADIOTOWER2F_BUENA
	const RADIOTOWER2F_RECEPTIONIST

RadioTower2F_MapScripts:
	def_scene_scripts

	def_callbacks

RadioTower2FNoopScene: ; unreferenced
	end

RadioTower2FSuperNerdScript:
	jumptextfaceplayer RadioTower2FSuperNerdText

RadioTower2FTeacherScript:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	writetext RadioTower2FTeacherText
	waitbutton
	closetext
	end

.Rockets:
	writetext RadioTower2FTeacherText_Rockets
	waitbutton
	closetext
	end

RadioTowerJigglypuff:
	opentext
	writetext RadioTowerJigglypuffText
	cry JIGGLYPUFF
	waitbutton
	closetext
	end

RadioTower2FBlackBelt1Script:
	jumptextfaceplayer RadioTower2FBlackBelt1Text

RadioTower2FBlackBelt2Script:
	jumptextfaceplayer RadioTower2FBlackBelt2Text

TrainerGruntM4:
	trainer GRUNTM, GRUNTM_4, EVENT_BEAT_ROCKET_GRUNTM_4, GruntM4SeenText, GruntM4BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM4AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM5:
	trainer GRUNTM, GRUNTM_5, EVENT_BEAT_ROCKET_GRUNTM_5, GruntM5SeenText, GruntM5BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM5AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM6:
	trainer GRUNTM, GRUNTM_6, EVENT_BEAT_ROCKET_GRUNTM_6, GruntM6SeenText, GruntM6BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM6AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF2:
	trainer GRUNTF, GRUNTF_2, EVENT_BEAT_ROCKET_GRUNTF_2, GruntF2SeenText, GruntF2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF2AfterBattleText
	waitbutton
	closetext
	end

Buena:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover
	checkevent EVENT_MET_BUENA
	iffalse .Introduction
	checkflag ENGINE_BUENAS_PASSWORD_2
	iftrue .PlayedAlready
	readvar VAR_HOUR
	ifless NITE_HOUR, .TooEarly
	checkflag ENGINE_BUENAS_PASSWORD
	iffalse .TuneIn
	checkitem BLUE_CARD
	iffalse .NoBlueCard
	readvar VAR_BLUECARDBALANCE
	ifequal BLUE_CARD_POINT_CAP, .BlueCardCapped0
	playmusic MUSIC_BUENAS_PASSWORD
	writetext RadioTower2FBuenaDoYouKnowPasswordText
	special AskRememberPassword
	iffalse .ForgotPassword
	writetext RadioTower2FBuenaJoinTheShowText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	readvar VAR_FACING
	ifnotequal RIGHT, .DontNeedToMove
	applymovement PLAYER, RadioTower2FPlayerWalksToMicrophoneMovement
.DontNeedToMove:
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower2FBuenaEveryoneSayPasswordText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, DOWN
	reanchormap
	special BuenasPassword
	closetext
	iffalse .WrongAnswer
	opentext
	writetext RadioTower2FBuenaCorrectAnswerText
	waitbutton
	closetext
	readvar VAR_BLUECARDBALANCE
	addval 1
	writevar VAR_BLUECARDBALANCE
	waitsfx
	playsound SFX_TRANSACTION
	setflag ENGINE_BUENAS_PASSWORD_2
	pause 20
	turnobject RADIOTOWER2F_BUENA, RIGHT
	opentext
	writetext RadioTower2FBuenaThanksForComingText
	waitbutton
	closetext
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	readvar VAR_BLUECARDBALANCE
	ifequal BLUE_CARD_POINT_CAP, .BlueCardCapped1
	end

.Introduction:
	writetext RadioTower2FBuenaShowIntroductionText
	promptbutton
	setevent EVENT_MET_BUENA
	verbosegiveitem BLUE_CARD
.TuneIn:
	writetext RadioTower2FBuenaTuneInToMyShowText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered0
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered0:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.ForgotPassword:
	writetext RadioTower2FBuenaComeBackAfterListeningText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.PlayedAlready:
	writetext RadioTower2FBuenaAlreadyPlayedText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered1
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered1:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 10
	end

.WrongAnswer:
	setflag ENGINE_BUENAS_PASSWORD_2
	opentext
	writetext RadioTower2FBuenaDidYouForgetText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 20
	opentext
	writetext RadioTower2FBuenaThanksForComingText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.MidRocketTakeover:
	writetext RadioTower2FBuenaPasswordIsHelpText
	waitbutton
	closetext
	end

.NoBlueCard:
	writetext RadioTower2FBuenaNoBlueCardText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered2
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
.Registered2:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.BlueCardCapped0:
	writetext RadioTower2FBuenaCardIsFullText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered3
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
.Registered3:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.TooEarly:
	writetext RadioTower2FBuenaTuneInAfterSixText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered4
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered4:
	end

.BlueCardCapped1:
	checkcellnum PHONE_BUENA
	iftrue .HasNumber
	pause 20
	turnobject RADIOTOWER2F_BUENA, DOWN
	pause 15
	turnobject PLAYER, UP
	pause 15
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
	showemote EMOTE_SHOCK, RADIOTOWER2F_BUENA, 15
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	opentext
	writetext RadioTower2FBuenaOfferPhoneNumberText
	sjump .AskForNumber

.OfferedNumberBefore:
	opentext
	writetext RadioTower2FBuenaOfferNumberAgainText
.AskForNumber:
	askforphonenumber PHONE_BUENA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	writetext RadioTower2FRegisteredBuenasNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
	writetext RadioTower2FBuenaCallMeText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	addcellnum PHONE_BUENA
	end

.NumberDeclined:
	writetext RadioTower2FBuenaSadRejectedText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.PhoneFull:
	writetext RadioTower2FBuenaYourPhoneIsFullText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
.HasNumber:
	end

RadioTowerBuenaPrizeReceptionist:
	faceplayer
	opentext
	checkitem BLUE_CARD
	iffalse .NoCard
	writetext RadioTower2FBuenaReceptionistPointsForPrizesText
	promptbutton
	special BuenaPrize
	closetext
	end

.NoCard:
	writetext RadioTower2FBuenaReceptionistNoCardText
	promptbutton
	closetext
	end

RadioTower2FSalesSign:
	jumptext RadioTower2FSalesSignText

RadioTower2FOaksPKMNTalkSign:
	jumptext RadioTower2FOaksPKMNTalkSignText

RadioTower2FPokemonRadioSign:
	jumptext RadioTower2FPokemonRadioSignText

RadioTower2FBookshelf:
	jumpstd MagazineBookshelfScript

RadioTower2FPlayerWalksToMicrophoneMovement:
	slow_step DOWN
	slow_step RIGHT
	step_end

RadioTower2FSuperNerdText:
	text "Pots escoltar la"
	line "ràdio a qualsevol"
	cont "lloc. Sintonitza!"
	done

RadioTower2FTeacherText:
	text "Les cançons de"
	line "bressol a la ràdio"
	cont "adormen els"
	cont "#MON."
	done

RadioTower2FTeacherText_Rockets:
	text "Per què voldrien"
	line "apoderar-se de la"
	cont "TORRE de RÀDIO?"
	done

RadioTowerJigglypuffText:
	text "JIGGLYPUFF:"
	line "Jiggly…"
	done

RadioTower2FBlackBelt1Text:
	text "Ho sento. Només"
	line "personal"
	cont "autoritzat"
	cont "pot passar."

	para "Abans no era així."

	para "Al DIRECTOR li"
	line "passa alguna cosa"
	cont "estranya…"
	done

RadioTower2FBlackBelt2Text:
	text "Pots mirar on"
	line "vulguis."

	para "El DIRECTOR torna"
	line "a ser amable, com"
	cont "abans."
	done

GruntM4SeenText:
	text "Fa tres anys, el"
	line "TEAM ROCKET es va"
	cont "veure forçat a"
	cont "dissoldre's."

	para "Però ara tornem"
	line "aquí!"
	done

GruntM4BeatenText:
	text "Gwah! No et"
	line "passis!"
	done

GruntM4AfterBattleText:
	text "No deixarem que"
	line "arruïnis els plans"
	cont "del nostre retorn!"
	done

GruntM5SeenText:
	text "Som el TEAM"
	line "ROCKET,"
	cont "els explotadors de"
	cont "#MON!"

	para "Ens encanta ser"
	line "dolents! Por?"
	done

GruntM5BeatenText:
	text "Et creus un heroi?"
	done

GruntM5AfterBattleText:
	text "No sempre som"
	line "dolents. Fem el"
	cont "que ens ve de"
	cont "gust."
	done

GruntM6SeenText:
	text "Eh, eh! No et"
	line "fiquis al mig!"
	done

GruntM6BeatenText:
	text "Arggh. Em renyo."
	done

GruntM6AfterBattleText:
	text "Els EXECUTIUS"
	line "intenten ocupar"
	cont "aquest lloc."

	para "Tenen un gran pla."
	line "Què deu ser?"
	done

GruntF2SeenText:
	text "Hahaha!"

	para "Que avorrit."
	line "Ha estat massa"

	para "fàcil ocupar"
	line "aquest lloc!"

	para "Va, entreté'm!"
	done

GruntF2BeatenText:
	text "Q-qui ets?"
	done

GruntF2AfterBattleText:
	text "M'has guanyat, i"
	line "no ho oblidaré!"
	done

RadioTower2FBuenaShowIntroductionText:
	text "BUENA: Hola! Sóc"
	line "la BUENA!"

	para "Coneixes el"
	line "programa de ràdio"
	cont "CONTRASENYA?"

	para "Si em dius la"
	line "contrasenya del"

	para "programa, guanyes"
	line "punts."

	para "Acumula punts i"
	line "canvia'ls per"

	para "premis amb aquella"
	line "noia d'allà!"

	para "Aquí tens!"

	para "La teva targeta"
	line "de punts!"
	done

RadioTower2FBuenaTuneInToMyShowText:
	text "BUENA: Sintonitza"
	line "CONTRASENYA!"
	done

RadioTower2FBuenaDoYouKnowPasswordText:
	text "BUENA: Hola!"
	line "Has escoltat el"
	cont "meu programa?"

	para "Recordes la"
	line "contrasenya"
	cont "d'avui?"
	done

RadioTower2FBuenaJoinTheShowText:
	text "BUENA: Oh, genial!"
	line "Gràcies!"

	para "Com et deies?"

	para "…<PLAY_G>, d'acord!"

	para "Va, <PLAY_G>."
	line "Vine al programa."
	done

RadioTower2FBuenaEveryoneSayPasswordText:
	text "BUENA: Tothom a"
	line "punt?"

	para "Vull que crideu"
	line "la contrasenya"

	para "d'avui per a"
	line "<PLAY_G>!"
	done

RadioTower2FBuenaComeBackAfterListeningText:
	text "BUENA: Torna quan"
	line "hagis escoltat el"

	para "meu programa, va?"
	line "Fins aviat!"
	done

RadioTower2FBuenaAlreadyPlayedText:
	text "BUENA: Ho sento…"

	para "Només tens una"
	line "oportunitat al"
	cont "dia."

	para "Torna demà per"
	line "tornar-ho a"
	cont "provar!"
	done

RadioTower2FBuenaCorrectAnswerText:
	text "BUENA: VISCA!"
	line "És correcte!"

	para "Has escoltat!"
	line "Estic tan"
	cont "contenta!"

	para "Has guanyat un"
	line "punt! Felicitats!"
	done

RadioTower2FBuenaDidYouForgetText:
	text "BUENA: Ai…"
	line "No és això…"

	para "Has oblidat la"
	line "contrasenya?"
	done

RadioTower2FBuenaThanksForComingText:
	text "BUENA: Sí! El"
	line "nostre concursant"

	para "ha estat <PLAY_G>."
	line "Gràcies per venir!"

	para "Espero que tots"
	line "els oients vingueu"

	para "també!"
	line "Us esperaré!"
	done

RadioTower2FBuenaPasswordIsHelpText:
	text "BUENA: Eh?"
	line "La contrasenya?"

	para "HELP, és clar!"
	done

RadioTower2FBuenaCardIsFullText:
	text "BUENA: La TARGETA"
	line "BLAVA és plena."

	para "Canvia-la per un"
	line "premi fabulós!"
	done

RadioTower2FBuenaTuneInAfterSixText:
	text "BUENA: Sintonitza"
	line "CONTRASENYA cada"

	para "nit de sis a"
	line "mitjanit!"

	para "Escolta i vine"
	line "a visitar-nos!"
	done

RadioTower2FBuenaNoBlueCardText:
	text "BUENA: Oh? T'has"
	line "oblidat la TARGETA"
	cont "BLAVA?"

	para "No puc donar-te"
	line "punts si no"
	cont "la tens."
	done

RadioTower2FBuenaOfferPhoneNumberText:
	text "BUENA: Oh! La"
	line "TARGETA BLAVA ha"

	para "arribat a {d:BLUE_CARD_POINT_CAP}"
	line "punts! Increïble!"

	para "Hmm… No hi ha"
	line "premi per arribar"
	cont "a {d:BLUE_CARD_POINT_CAP} punts, però…"

	para "Has vingut tantes"
	line "vegades, <PLAY_G>."

	para "Et faré una"
	line "oferta especial!"

	para "Vols el meu"
	line "número de telèfon?"
	done

RadioTower2FBuenaOfferNumberAgainText:
	text "BUENA: <PLAY_G>,"
	line "vols registrar"

	para "el meu número"
	line "de telèfon?"
	done

RadioTower2FRegisteredBuenasNumberText:
	text "<PLAYER> ha"
	line "registrat"
	cont "el núm. de BUENA."
	done

RadioTower2FBuenaCallMeText:
	text "BUENA: Espero"
	line "notícies teves!"
	done

RadioTower2FBuenaSadRejectedText:
	text "BUENA: Ai… És un"
	line "premi especial…"
	done

RadioTower2FBuenaYourPhoneIsFullText:
	text "BUENA: <PLAY_G>,"
	line "la teva llista"

	para "de telèfon no té"
	line "espai per a mi…"
	done

RadioTower2FBuenaReceptionistPointsForPrizesText:
	text "Pots canviar els"
	line "punts acumulats"

	para "per un premi"
	line "al teu gust!"
	done

RadioTower2FBuenaReceptionistNoCardText:
	text "No pots canviar"
	line "punts sense la"
	cont "TARGETA BLAVA."

	para "No oblidis la"
	line "TARGETA BLAVA!"
	done

RadioTower2FSalesSignText:
	text "2P VENDES"
	done

RadioTower2FOaksPKMNTalkSignText:
	text "CONVERSA #MON"
	line "DEL PROF.OAK"

	para "El programa més"
	line "escoltat!"
	done

RadioTower2FPokemonRadioSignText:
	text "Arreu, sempre"
	line "Ràdio #MON"
	done

RadioTower2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_3F, 1
	warp_event 15,  0, RADIO_TOWER_1F, 3

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, RadioTower2FSalesSign
	bg_event  5,  0, BGEVENT_READ, RadioTower2FOaksPKMNTalkSign
	bg_event  9,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 10,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 11,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 13,  0, BGEVENT_READ, RadioTower2FPokemonRadioSign

	def_object_events
	object_event  6,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower2FSuperNerdScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 17,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower2FTeacherScript, -1
	object_event  1,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM5, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM6, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 10,  5, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGruntF2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  0,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower2FBlackBelt1Script, EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	object_event  1,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower2FBlackBelt2Script, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event 12,  1, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTowerJigglypuff, -1
	object_event 14,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Buena, -1
	object_event 12,  7, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTowerBuenaPrizeReceptionist, EVENT_GOLDENROD_CITY_CIVILIANS
