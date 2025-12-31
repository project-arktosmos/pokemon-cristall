	object_const_def
	const GOLDENRODPOKECENTER1F_NURSE
	const GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	const GOLDENRODPOKECENTER1F_GAMEBOY_KID
	const GOLDENRODPOKECENTER1F_LASS
	const GOLDENRODPOKECENTER1F_POKEFAN_F

GoldenrodPokecenter1F_MapScripts:
	def_scene_scripts
	scene_const SCENE_GOLDENRODPOKECENTER1F_GS_BALL

	def_callbacks

GoldenrodPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

GoldenrodPokecenter1F_GSBallSceneLeft:
	setval BATTLETOWERACTION_GSBALL
	special BattleTowerAction
	ifequal GS_BALL_AVAILABLE, .gsball
	end

.gsball
	checkevent EVENT_GOT_GS_BALL_FROM_GOLDENROD_POKEMON_CENTER
	iftrue .cancel
	playsound SFX_EXIT_BUILDING
	moveobject GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, 0, 7
	disappear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtLeftDoorwayTileMovement
	turnobject PLAYER, UP
	opentext
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_GOLDENROD_POKEMON_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText
	waitbutton
	closetext
	applymovement GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromLeftDoorwayTileMovement
	special RestartMapMusic
	disappear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	playsound SFX_EXIT_BUILDING
.cancel
	end

GoldenrodPokecenter1F_GSBallSceneRight:
	setval BATTLETOWERACTION_GSBALL
	special BattleTowerAction
	ifequal GS_BALL_AVAILABLE, .gsball
	end

.gsball
	checkevent EVENT_GOT_GS_BALL_FROM_GOLDENROD_POKEMON_CENTER
	iftrue .cancel
	playsound SFX_EXIT_BUILDING
	moveobject GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, 0, 7
	disappear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtRightDoorwayTileMovement
	turnobject PLAYER, UP
	opentext
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_GOLDENROD_POKEMON_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText
	waitbutton
	closetext
	applymovement GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromRightDoorwayTileMovement
	special RestartMapMusic
	disappear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	playsound SFX_EXIT_BUILDING
.cancel
	end

GoldenrodPokecenter1FGameboyKidScript:
	jumptextfaceplayer GoldenrodPokecenter1FGameboyKidText

GoldenrodPokecenter1FLassScript:
	jumptextfaceplayer GoldenrodPokecenter1FLassText

GoldenrodPokecenter1FPokefanF:
	faceplayer
	opentext
	writetext GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText
	waitbutton
	writetext GoldenrodPokecenter1FAskGiveAwayAnEonMailText
	yesorno
	iffalse .NoEonMail
	takeitem EON_MAIL
	iffalse .NoEonMail
	writetext GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText
	waitbutton
	writetext GoldenrodPokecenter1FPokefanFThisIsForYouText
	waitbutton
	verbosegiveitem REVIVE
	iffalse .NoRoom
	writetext GoldenrodPokecenter1FPokefanFDaughterWillBeDelightedText
	waitbutton
	closetext
	end

.NoEonMail:
	writetext GoldenrodPokecenter1FPokefanFTooBadText
	waitbutton
	closetext
	end

.NoRoom:
	giveitem EON_MAIL
	writetext GoldenrodPokecenter1FPokefanFAnotherTimeThenText
	waitbutton
	closetext
	end

GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtLeftDoorwayTileMovement:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromLeftDoorwayTileMovement:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtRightDoorwayTileMovement:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromRightDoorwayTileMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

GoldenrodPokecomCenterWelcomeToTradeCornerText: ; unreferenced
	text "Hola! Benvingut al"
	line "RACÓ D'INTERCANVI"
	cont "del #COM"
	cont "CENTER."

	para "Pots intercanviar"
	line "# amb gent"
	cont "de molt lluny."
	done

GoldenrodPokecomCenterWeMustHoldYourMonText: ; unreferenced
	text "Per intercanviar,"
	line "hem de guardar el"
	cont "teu #."

	para "Vols fer un"
	line "intercanvi?"
	done

GoldenrodPokecomCenterWhatMonDoYouWantText: ; unreferenced
	text "Quin tipus de"
	line "# vols a"
	cont "canvi?"
	done

GoldenrodPokecomCenterWeWillTradeYourMonForMonText: ; unreferenced
	text "D'acord. Mirarem"
	line "d'intercanviar el"

	para "@"
	text_ram wStringBuffer3
	text " per"
	line "@"
	text_ram wStringBuffer4
	text "."

	para "Haurem de guardar"
	line "el teu # durant"
	cont "l'intercanvi."

	para "Espera mentre"
	line "preparem la sala."
	done

GoldenrodPokecomCenterWeWillTradeYourMonForNewText: ; unreferenced
	text "D'acord. Mirarem"
	line "d'intercanviar el"

	para "@"
	text_ram wStringBuffer3
	text " per un"
	line "# que no"
	cont "hagis vist mai."

	para "Haurem de guardar"
	line "el teu # durant"
	cont "l'intercanvi."

	para "Espera mentre"
	line "preparem la sala."
	done

GoldenrodPokecomCenterYourMonHasBeenReceivedText: ; unreferenced
	text "Hem rebut el teu"
	line "# per canviar."

	para "Trigarà una mica"
	line "a trobar algú per"

	para "intercanviar."
	line "Torna més tard."
	done

GoldenrodPokecomCenterYouHaveOnlyOneMonText: ; unreferenced
	text "Oh? Només tens un"
	line "# a l'equip."

	para "Torna quan tinguis"
	line "més # a"
	cont "l'equip."
	done

GoldenrodPokecomCenterWeHopeToSeeYouAgainText: ; unreferenced
	text "Esperem veure't"
	line "aviat."
	done

GoldenrodPokecomCenterCommunicationErrorText: ; unreferenced
	text "Error de"
	line "comunicació…"
	done

GoldenrodPokecomCenterCantAcceptLastMonText: ; unreferenced
	text "Si acceptem aquest"
	line "#, amb què"
	cont "lluitaràs?"
	done

GoldenrodPokecomCenterCantAcceptEggText: ; unreferenced
	text "Ho sento. No podem"
	line "acceptar un OU."
	done

GoldenrodPokecomCenterCantAcceptAbnormalMonText: ; unreferenced
	text "Ho sento, però el"
	line "teu # sembla"

	para "anormal. No el"
	line "podem acceptar."
	done

GoldenrodPokecomCenterAlreadyHoldingMonText: ; unreferenced
	text "Oh? No estem ja"
	line "guardant un #"
	cont "teu?"
	done

GoldenrodPokecomCenterCheckingTheRoomsText: ; unreferenced
	text "Revisarem les"
	line "sales."

	para "Espera, si us"
	line "plau."
	done

GoldenrodPokecomCenterTradePartnerHasBeenFoundText: ; unreferenced
	text "Gràcies per la"
	line "paciència."

	para "Hem trobat algú"
	line "per intercanviar."
	done

GoldenrodPokecomCenterItsYourNewPartnerText: ; unreferenced
	text "Aquí tens el teu"
	line "nou company."

	para "Cuida'l bé i amb"
	line "molt d'amor."

	para "Esperem veure't"
	line "aviat."
	done

GoldenrodPokecomCenterYourPartyIsFullText: ; unreferenced
	text "Oh! El teu equip"
	line "ja és ple."

	para "Torna quan tinguis"
	line "espai a l'equip."
	done

GoldenrodPokecomCenterNoTradePartnerFoundText: ; unreferenced
	text "Malauradament,"
	line "ningú no s'ha"

	para "ofert per fer"
	line "l'intercanvi."

	para "Vols recuperar"
	line "el teu #?"
	done

GoldenrodPokecomCenterReturnedYourMonText: ; unreferenced
	text "T'hem tornat el"
	line "teu #."
	done

GoldenrodPokecomCenterYourMonIsLonelyText: ; unreferenced
	text "Malauradament,"
	line "ningú no s'ha"

	para "ofert per fer"
	line "l'intercanvi."

	para "Fa molt que"
	line "guardem el teu"

	para "#. Per això,"
	line "se sent molt sol."

	para "Ho sento, però"
	line "te l'hem de"
	cont "tornar."
	done

GoldenrodPokecenter1FWeHopeToSeeYouAgainText_2: ; unreferenced
	text "Esperem veure't"
	line "aviat."
	done

GoldenrodPokecomCenterContinueToHoldYourMonText: ; unreferenced
	text "D'acord. Seguirem"
	line "guardant el teu"
	cont "#."
	done

GoldenrodPokecomCenterRecentlyLeftYourMonText: ; unreferenced
	text "Oh? Has deixat el"
	line "teu # fa poc."

	para "Torna més tard,"
	line "si us plau."
	done

GoldenrodPokecomCenterSaveBeforeTradeCornerText: ; unreferenced
	text "DESAREM abans de"
	line "connectar al"
	cont "CENTRE."
	done

GoldenrodPokecomCenterWhichMonToTradeText: ; unreferenced
	text "Quin # vols"
	line "intercanviar?"
	done

GoldenrodPokecomCenterTradeCanceledText: ; unreferenced
	text "Ho sento, però hem"
	line "de cancel·lar"
	cont "l'intercanvi."
	done

GoldenrodPokecomCenterEggTicketText: ; unreferenced
	text "Oh!"

	para "Veig que tens un"
	line "TIQUET D'OU!"

	para "És un cupó que"
	line "certes persones"

	para "poden canviar per"
	line "un # especial!"
	done

GoldenrodPokecomCenterOddEggBriefingText: ; unreferenced
	text "Deixa'm explicar-"
	line "t'ho breument."

	para "Els intercanvis"
	line "del RACÓ es fan"

	para "entre entrenadors"
	line "que no coneixen"

	para "la identitat de"
	line "l'altre."

	para "Per això, pot"
	line "trigar una mica."

	para "Però tens un OU"
	line "ESTRANY disponible"
	cont "només per a tu."

	para "Te l'enviarem"
	line "de seguida."

	para "Tria una de les"
	line "sales del CENTRE."

	para "L'OU ESTRANY"
	line "s'enviarà des de"
	cont "la sala triada."
	done

GoldenrodPokecomCenterPleaseWaitAMomentText: ; unreferenced
	text "Espera un moment,"
	line "si us plau."
	done

GoldenrodPokecomCenterHereIsYourOddEggText: ; unreferenced
	text "Gràcies per"
	line "esperar."

	para "Hem rebut el teu"
	line "OU ESTRANY."

	para "Aquí el tens!"

	para "Cuida'l amb molt"
	line "d'amor."
	done

GoldenrodPokecomCenterNoEggTicketServiceText: ; unreferenced
	text "Ho sento molt."

	para "El servei de"
	line "TIQUET D'OU no"
	cont "funciona ara."
	done

GoldenrodPokecomCenterNewsMachineText: ; unreferenced
	text "És una MÀQUINA"
	line "DE NOTÍCIES #."
	done

GoldenrodPokecomCenterWhatToDoText: ; unreferenced
	text "Què vols fer?"
	done

GoldenrodPokecomCenterNewsMachineExplanationText: ; unreferenced
	text "Les NOTÍCIES #"
	line "són notícies dels"

	para "fitxers DESATS"
	line "d'entrenadors"
	cont "#."

	para "En llegir les"
	line "NOTÍCIES, el teu"

	para "fitxer DESAT es"
	line "pot enviar."

	para "Les dades del"
	line "fitxer DESAT"

	para "contindran el teu"
	line "registre i perfil."

	para "El teu número de"
	line "telèfon no"
	cont "s'enviarà."

	para "El contingut de"
	line "les NOTÍCIES"

	para "variarà segons"
	line "els fitxers DESATS"

	para "enviats per tu i"
	line "altres"
	cont "entrenadors."

	para "Fins i tot podries"
	line "sortir-hi tu!"
	done

GoldenrodPokecomCenterWouldYouLikeTheNewsText: ; unreferenced
	text "Vols rebre les"
	line "NOTÍCIES?"
	done

GoldenrodPokecomCenterReadingTheLatestNewsText: ; unreferenced
	text "Llegint les"
	line "últimes NOTÍCIES…"
	cont "Espera, si us"
	cont "plau."
	done

GoldenrodPokecomCenterNoOldNewsText: ; unreferenced
	text "No hi ha NOTÍCIES"
	line "antigues…"
	done

GoldenrodPokecomCenterCorruptedNewsDataText: ; unreferenced
	text "Les dades de les"
	line "NOTÍCIES estan"
	cont "malmeses."

	para "Torna a baixar"
	line "les NOTÍCIES."
	done

GoldenrodPokecomCenterMakingPreparationsText: ; unreferenced
	text "Estem fent"
	line "preparatius."

	para "Torna més tard,"
	line "si us plau."
	done

GoldenrodPokecomCenterSaveBeforeNewsMachineText: ; unreferenced
	text "DESAREM el progrés"
	line "abans d'iniciar"

	para "la MÀQUINA DE"
	line "NOTÍCIES."
	done

GoldenrodPokecomCenterPerson1Text: ; unreferenced
	text "Uau, aquest CENTRE"
	line "# és enorme."

	para "L'acaben de"
	line "construir. Hi han"

	para "instal·lat moltes"
	line "màquines noves."
	done

GoldenrodPokecomCenterPerson2Text: ; unreferenced
	text "He tingut una idea"
	line "divertida per al"
	cont "RACÓ D'INTERCANVI!"

	para "Faig que un Pidgey"
	line "porti una CARTA,"

	para "i l'ofereixo a"
	line "canvi d'un altre!"

	para "Si tothom ho fes,"
	line "es podrien"

	para "intercanviar"
	line "CARTES"
	cont "amb molta gent!"

	para "Ho anomeno CARTA"
	line "PIDGEY!"

	para "Si es fa popular,"
	line "potser faré molts"
	cont "amics nous!"
	done

GoldenrodPokecomCenterPerson3Text: ; unreferenced
	text "Diuen que aquí"
	line "pots intercanviar"

	para "# amb gent"
	line "desconeguda."

	para "Però encara estan"
	line "ajustant coses."
	done

GoldenrodPokecomCenterPerson4Text: ; unreferenced
	text "Una noia que no"
	line "conec m'ha enviat"

	para "el seu Hoppip."
	line "Hauries de canviar"

	para "per un # que"
	line "vulguis."
	done

GoldenrodPokecomCenterPerson5Text: ; unreferenced
	text "He rebut un Hoppip"
	line "femella que es diu"
	cont "ESTANISLAU!"

	para "És el nom del"
	line "meu pare!"
	done

GoldenrodPokecomCenterPerson6Text: ; unreferenced
	text "Què és la MÀQUINA"
	line "DE NOTÍCIES?"

	para "Rep notícies d'una"
	line "zona més àmplia"
	cont "que la ràdio?"
	done

GoldenrodPokecomCenterPerson7Text: ; unreferenced
	text "El #COM CENTER"
	line "s'enllaçarà amb"

	para "tots els CENTRES"
	line "# sense fil."

	para "Això vol dir que"
	line "podré connectar"

	para "amb tot tipus de"
	line "gent."
	done

GoldenrodPokecomCenterPerson8Text: ; unreferenced
	text "Les màquines aquí"
	line "encara no es poden"
	cont "fer servir."

	para "Tot i així, és"
	line "genial venir a un"

	para "lloc modern abans"
	line "que la resta."
	done

GoldenrodPokecomCenterPerson9Text: ; unreferenced
	text "Un amic meu va"
	line "sortir a les"

	para "NOTÍCIES fa poc."
	line "Em va sorprendre!"
	done

GoldenrodPokecomCenterPerson10Text: ; unreferenced
	text "Em poso nerviós si"
	line "no miro les"
	cont "últimes NOTÍCIES!"
	done

GoldenrodPokecomCenterPerson11Text: ; unreferenced
	text "Si surto a les"
	line "NOTÍCIES i em faig"

	para "famós, segur que"
	line "m'admiraran."

	para "Com podria sortir"
	line "a les NOTÍCIES?"
	done

GoldenrodPokecenter1FGameboyKidText:
	text "El COLISEU de"
	line "dalt és per a"
	cont "combats per cable."

	para "Els resultats dels"
	line "combats es pengen"

	para "a la paret, així"
	line "que no puc perdre."
	done

GoldenrodPokecomCenterPerson12Text: ; unreferenced
	text "He vingut en"
	line "sentir que el"

	para "CENTRE # de"
	line "POKEMON GROC té"

	para "màquines noves que"
	line "ningú ha vist mai."

	para "Però sembla que"
	line "encara estan"

	para "ocupats amb els"
	line "preparatius…"
	done

GoldenrodPokecomCenterPerson13Text: ; unreferenced
	text "Només veure totes"
	line "aquestes coses"

	para "noves em fa sentir"
	line "més jove!"
	done

GoldenrodPokecenter1FLassText:
	text "Un # de nivell"
	line "alt no sempre"
	cont "guanya."

	para "Al cap i a la fi,"
	line "pot tenir un tipus"
	cont "en desavantatge."

	para "No crec que hi"
	line "hagi cap # que"
	cont "sigui el més fort."
	done

GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText:
	text "Ets <PLAYER>, oi?"

	para "Enhorabona!"

	para "Com a oferta"
	line "especial, t'hem"
	cont "enviat una GS"
	cont "BALL!"

	para "Accepta-la, si us"
	line "plau!"
	done

GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText:
	text "Torna quan"
	line "vulguis!"
	done

GoldenrodPokecomCenterSignText: ; unreferenced
	text "#COM CENTER"
	line "PLANTA 1 INFO"

	para "Esquerra:"
	line "ADMINISTRACIÓ"

	para "Centre:"
	line "RACÓ D'INTERCANVI"

	para "Dreta:"
	line "NOTÍCIES #"
	done

GoldenrodPokecomCenterNewsMachineNotYetText: ; unreferenced
	text "És una MÀQUINA"
	line "DE NOTÍCIES #!"

	para "Encara no està"
	line "en funcionament…"
	done

GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText:
	text "Mare meva, la teva"
	line "motxilla pesa"
	cont "molt!"

	para "Oh! Per casualitat"
	line "tens una CARTA"
	cont "AURORA?"

	para "La meva filla en"
	line "vol una."

	para "Me'n pots donar"
	line "una, oi?"
	done

GoldenrodPokecenter1FAskGiveAwayAnEonMailText:
	text "Donar una CARTA"
	line "AURORA?"
	done

GoldenrodPokecenter1FPokefanFThisIsForYouText:
	text "Oh, fantàstic!"
	line "Gràcies, bonica!"

	para "Té, això és per a"
	line "tu a canvi!"
	done

GoldenrodPokecenter1FPokefanFDaughterWillBeDelightedText:
	text "La meva filla"
	line "s'alegrarà molt!"
	done

GoldenrodPokecenter1FPokefanFTooBadText:
	text "Oh? No en tens?"
	line "Quina llàstima."
	done

GoldenrodPokecenter1FPokefanFAnotherTimeThenText:
	text "Oh… Doncs serà"
	line "un altre cop."
	done

GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText:
	text "<PLAYER> ha donat"
	line "la CARTA AURORA."
	done

GoldenrodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, GOLDENROD_CITY, 15
	warp_event  4,  7, GOLDENROD_CITY, 15
	warp_event  0,  6, POKECOM_CENTER_ADMIN_OFFICE_MOBILE, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events
	coord_event  3,  7, SCENE_GOLDENRODPOKECENTER1F_GS_BALL, GoldenrodPokecenter1F_GSBallSceneLeft
	coord_event  4,  7, SCENE_GOLDENRODPOKECENTER1F_GS_BALL, GoldenrodPokecenter1F_GSBallSceneRight

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FNurseScript, -1
	object_event 16,  8, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FLassScript, -1
	object_event  7,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FPokefanF, -1
