	object_const_def
	const RADIOTOWER1F_RECEPTIONIST
	const RADIOTOWER1F_LASS
	const RADIOTOWER1F_YOUNGSTER
	const RADIOTOWER1F_ROCKET
	const RADIOTOWER1F_LUCKYNUMBERMAN
	const RADIOTOWER1F_CARD_WOMAN

RadioTower1F_MapScripts:
	def_scene_scripts

	def_callbacks

RadioTower1FReceptionistScript:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	writetext RadioTower1FReceptionistWelcomeText
	waitbutton
	closetext
	end

.Rockets:
	writetext RadioTower1FReceptionistNoToursText
	waitbutton
	closetext
	end

RadioTower1FLuckyNumberManScript:
	faceplayer
	opentext
	writetext RadioTower1FLuckyNumberManAskToPlayText
	promptbutton
	special CheckLuckyNumberShowFlag
	iffalse .skip
	special ResetLuckyNumberShowFlag
.skip
	special PrintTodaysLuckyNumber
	checkflag ENGINE_LUCKY_NUMBER_SHOW
	iftrue .GameOver
	writetext RadioTower1FLuckyNumberManThisWeeksIdIsText
	promptbutton
	closetext
	applymovement RADIOTOWER1F_LUCKYNUMBERMAN, RadioTower1FLuckyNumberManGoToPCMovement
	opentext
	writetext RadioTower1FLuckyNumberManCheckIfMatchText
	promptbutton
	waitsfx
	writetext RadioTower1FLuckyNumberManDotDotDotText
	playsound SFX_DEX_FANFARE_20_49
	waitsfx
	promptbutton
	special CheckForLuckyNumberWinners
	closetext
	applymovement RADIOTOWER1F_LUCKYNUMBERMAN, RadioTower1FLuckyNumberManReturnToPlayerMovement
	opentext
	ifequal 1, .FirstPlace
	ifequal 2, .SecondPlace
	ifequal 3, .ThirdPlace
	sjump .NoPrize

.GameOver:
	writetext RadioTower1FLuckyNumberManComeAgainText
	waitbutton
	closetext
	end

.FirstPlace:
	writetext RadioTower1FLuckyNumberManPerfectMatchText
	playsound SFX_1ST_PLACE
	waitsfx
	promptbutton
	giveitem MASTER_BALL
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.SecondPlace:
	writetext RadioTower1FLuckyNumberManOkayMatchText
	playsound SFX_2ND_PLACE
	waitsfx
	promptbutton
	giveitem EXP_SHARE
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.ThirdPlace:
	writetext RadioTower1FLuckyNumberManWeakMatchText
	playsound SFX_3RD_PLACE
	waitsfx
	promptbutton
	giveitem PP_UP
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.NoPrize:
	writetext RadioTower1FLuckyNumberManNoneOfYourIDNumbersMatchText
	waitbutton
	closetext
	end

.BagFull:
	writetext RadioTower1FLuckyNumberManNoRoomForYourPrizeText
	waitbutton
	closetext
	end

RadioTower1FRadioCardWomanScript:
	faceplayer
	opentext
	checkflag ENGINE_RADIO_CARD
	iftrue .GotCard
	writetext RadioTower1FRadioCardWomanOfferQuizText
	yesorno
	iffalse .NoQuiz
	writetext RadioTower1FRadioCardWomanQuestion1Text
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion2Text
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion3Text
	yesorno
	iftrue .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion4Text
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion5Text
	yesorno
	iftrue .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanYouWinText
	promptbutton
	getstring STRING_BUFFER_4, .RadioCardText
	scall .ReceiveItem
	writetext RadioTower1FPokegearIsARadioText
	promptbutton
	setflag ENGINE_RADIO_CARD
.GotCard:
	writetext RadioTower1FRadioCardWomanTuneInText
	waitbutton
	closetext
	end

.RadioCardText:
	db "TARGETA RÀDIO@"

.ReceiveItem:
	jumpstd ReceiveItemScript
	end

.WrongAnswer:
	playsound SFX_WRONG
	writetext RadioTower1FRadioCardWomanWrongAnswerText
	waitbutton
	closetext
	end

.NoQuiz:
	writetext RadioTower1FRadioCardWomanNotTakingQuizText
	waitbutton
	closetext
	end

RadioTower1FLassScript:
	jumptextfaceplayer RadioTower1FLassText

RadioTower1FYoungsterScript:
	jumptextfaceplayer RadioTower1FYoungsterText

TrainerGruntM3:
	trainer GRUNTM, GRUNTM_3, EVENT_BEAT_ROCKET_GRUNTM_3, GruntM3SeenText, GruntM3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM3AfterBattleText
	waitbutton
	closetext
	end

RadioTower1FDirectory:
	jumptext RadioTower1FDirectoryText

RadioTower1FLuckyChannelSign:
	jumptext RadioTower1FLuckyChannelSignText

RadioTower1FLuckyNumberManGoToPCMovement:
	step RIGHT
	turn_head UP
	step_end

RadioTower1FLuckyNumberManReturnToPlayerMovement:
	step LEFT
	turn_head UP
	step_end

RadioTower1FReceptionistWelcomeText:
	text "Benvingut!"
	done

RadioTower1FReceptionistNoToursText:
	text "Hola. Ho sento,"
	line "però avui no fem"
	cont "visites guiades."
	done

RadioTower1FLuckyNumberManAskToPlayText:
	text "Hola, véns pel"
	line "SORTEIG DEL NÚMERO"
	cont "DE LA SORT?"

	para "Vols que comprovi"
	line "els números d'ID"
	cont "dels teus #MON?"

	para "Si tens sort,"
	line "guanyes un premi."
	done

RadioTower1FLuckyNumberManThisWeeksIdIsText:
	text "El número d'ID"
	line "d'aquesta setmana"
	cont "és @"
	text_ram wStringBuffer3
	text "."
	done

RadioTower1FLuckyNumberManCheckIfMatchText:
	text "Vegem si hi ha"
	line "coincidència."
	done

RadioTower1FLuckyNumberManDotDotDotText:
	text "<……>"
	line "<……>"
	done

RadioTower1FLuckyNumberManComeAgainText:
	text "Torna la setmana"
	line "que ve pel proper"
	cont "NÚMERO DE LA SORT."
	done

RadioTower1FLuckyNumberManPerfectMatchText:
	text "Uau! Tens una"
	line "coincidència"
	cont "perfecta dels"
	cont "cinc números!"

	para "Tenim un guanyador"
	line "del gran premi!"

	para "Has guanyat una"
	line "MASTER BALL!"
	done

RadioTower1FLuckyNumberManOkayMatchText:
	text "Ei! Has encertat"
	line "els últims tres"
	cont "números!"

	para "Has guanyat el"
	line "segon premi, un"
	cont "EXP. SHARE!"
	done

RadioTower1FLuckyNumberManWeakMatchText:
	text "Oh, has encertat"
	line "els últims dos"
	cont "números."

	para "Has guanyat el"
	line "tercer premi,"
	cont "un PP UP."
	done

RadioTower1FLuckyNumberManNoneOfYourIDNumbersMatchText:
	text "No, cap dels teus"
	line "números d'ID no"
	cont "coincideix."
	done

RadioTower1FLuckyNumberManNoRoomForYourPrizeText:
	text "No tens espai per"
	line "al teu premi."

	para "Fes lloc i torna"
	line "de seguida."
	done

RadioTower1FRadioCardWomanOfferQuizText:
	text "Tenim una campanya"
	line "especial de"
	cont "preguntes."

	para "Respon cinc pre-"
	line "guntes bé i guanya"
	cont "TARGETA RÀDIO."

	para "Posa-la al"
	line "#GEAR"
	cont "per escoltar la"

	para "ràdio on vulguis"
	line "i quan vulguis."

	para "Vols fer el"
	line "qüestionari?"
	done

RadioTower1FRadioCardWomanQuestion1Text:
	text "Pregunta 1:"

	para "Hi ha un #MON"
	line "que només apareix"
	cont "al matí?"
	done

RadioTower1FRadioCardWomanQuestion2Text:
	text "Correcte!"
	line "Pregunta 2:"

	para "Aquesta afirmació"
	line "és correcta?"

	para "No pots comprar"
	line "BAIES a una BOTI-"
	cont "GA."
	done

RadioTower1FRadioCardWomanQuestion3Text:
	text "Molt bé!"
	line "Pregunta 3:"

	para "La MO01 conté el"
	line "moviment FLASH?"
	done

RadioTower1FRadioCardWomanQuestion4Text:
	text "De moment, bé!"
	line "Pregunta 4:"

	para "En BLAU és el"
	line "LÍDER DEL GIMNÀS"

	para "VIOLETA que usa"
	line "#MON ocell?"
	done

RadioTower1FRadioCardWomanQuestion5Text:
	text "Uau! Una altra"
	line "encertada! Última"
	cont "pregunta:"

	para "Les màquines del"
	line "CASINO POKEMON"

	para "D'ARAM tenen"
	line "Charmander als"
	cont "rodets?"
	done

RadioTower1FRadioCardWomanYouWinText:
	text "Bingo! Ho has"
	line "encertat!"
	cont "Felicitats!"

	para "Aquí tens el premi"
	line "TARGETA RÀDIO!"
	done

RadioTower1FPokegearIsARadioText:
	text "El #GEAR de"
	line "<PLAYER> ara també"
	cont "és una ràdio!"
	done

RadioTower1FRadioCardWomanTuneInText:
	text "Escolta els"
	line "nostres programes"
	cont "de ràdio."
	done

RadioTower1FRadioCardWomanWrongAnswerText:
	text "Oh, vaja."
	line "Ho sento, però"

	para "t'has equivocat."
	line "Torna-ho a provar!"
	done

RadioTower1FRadioCardWomanNotTakingQuizText:
	text "Ah, ja veig. Vine"
	line "a veure'm si"
	cont "canvies d'opinió."
	done

RadioTower1FLassText:
	text "En BLAU és un DJ"
	line "fabulós."

	para "La seva veu dolça"
	line "em fa fondre!"
	done

RadioTower1FYoungsterText:
	text "M'encanta la MARY"
	line "de #MON TALK."

	para "Però només sé"
	line "quina veu té."
	done

GruntM3SeenText:
	text "Per fi hem ocupat"
	line "la TORRE DE RÀDIO!"

	para "Ara tothom podrà"
	line "experimentar el"

	para "veritable terror"
	line "del TEAM ROCKET!"

	para "Et mostrarem"
	line "com de temibles"
	cont "som!"
	done

GruntM3BeatenText:
	text "Massa fort! T'hem"
	line "de vigilar…"
	done

GruntM3AfterBattleText:
	text "Ets massa fort."

	para "El nostre pla"
	line "podria fracassar."
	cont "He d'avisar els"
	cont "altres…"
	done

RadioTower1FDirectoryText:
	text "1P RECEPCIÓ"
	line "2P VENDES"

	para "3P PERSONAL"
	line "4P PRODUCCIÓ"

	para "5P DESPATX DEL"
	line "   DIRECTOR"
	done

RadioTower1FLuckyChannelSignText:
	text "CANAL DE LA SORT!"

	para "Guanya amb els"
	line "números d'ID dels"
	cont "#MON!"

	para "Intercanvia"
	line "#MON"
	cont "per aconseguir"
	cont "més números d'ID!"
	done

RadioTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 11
	warp_event  3,  7, GOLDENROD_CITY, 11
	warp_event 15,  0, RADIO_TOWER_2F, 2

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, RadioTower1FDirectory
	bg_event 13,  0, BGEVENT_READ, RadioTower1FLuckyChannelSign

	def_object_events
	object_event  5,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower1FReceptionistScript, -1
	object_event 16,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower1FLassScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 15,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FYoungsterScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 14,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM3, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FLuckyNumberManScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 12,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower1FRadioCardWomanScript, EVENT_GOLDENROD_CITY_CIVILIANS
