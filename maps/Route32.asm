	object_const_def
	const ROUTE32_FISHER1
	const ROUTE32_FISHER2
	const ROUTE32_FISHER3
	const ROUTE32_YOUNGSTER1
	const ROUTE32_YOUNGSTER2
	const ROUTE32_YOUNGSTER3
	const ROUTE32_LASS1
	const ROUTE32_COOLTRAINER_M
	const ROUTE32_YOUNGSTER4
	const ROUTE32_FISHER4
	const ROUTE32_POKE_BALL1
	const ROUTE32_FISHER5
	const ROUTE32_FRIEDA
	const ROUTE32_POKE_BALL2

Route32_MapScripts:
	def_scene_scripts
	scene_script Route32Noop1Scene, SCENE_ROUTE32_COOLTRAINER_M_BLOCKS
	scene_script Route32Noop2Scene, SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	scene_script Route32Noop3Scene, SCENE_ROUTE32_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route32FriedaCallback

Route32Noop1Scene:
	end

Route32Noop2Scene:
	end

Route32Noop3Scene:
	end

Route32FriedaCallback:
	readvar VAR_WEEKDAY
	ifequal FRIDAY, .FriedaAppears
	disappear ROUTE32_FRIEDA
	endcallback

.FriedaAppears:
	appear ROUTE32_FRIEDA
	endcallback

Route32CooltrainerMScript:
	faceplayer
Route32CooltrainerMContinueScene:
	opentext
	checkevent EVENT_GOT_MIRACLE_SEED_IN_ROUTE_32
	iftrue .GotMiracleSeed
	checkflag ENGINE_ZEPHYRBADGE
	iffalse .DontHaveZephyrBadge
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue .GiveMiracleSeed
	writetext Route32CooltrainerMText_AideIsWaiting
	waitbutton
	closetext
	end

.GoToSproutTower: ; unreferenced
	writetext Route32CooltrainerMText_UnusedSproutTower
	waitbutton
	closetext
	end

.GiveMiracleSeed:
	writetext Route32CooltrainerMText_HaveThisSeed
	promptbutton
	verbosegiveitem MIRACLE_SEED
	iffalse .BagFull
	setevent EVENT_GOT_MIRACLE_SEED_IN_ROUTE_32
	sjump .GotMiracleSeed

.DontHaveZephyrBadge:
	writetext Route32CooltrainerMText_VioletGym
	waitbutton
	closetext
	end

.GotMiracleSeed:
	writetext Route32CooltrainerMText_ExperiencesShouldBeUseful
	waitbutton
.BagFull:
	closetext
	end

Route32CooltrainerMStopsYouScene:
	turnobject ROUTE32_COOLTRAINER_M, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext Route32CooltrainerMText_WhatsTheHurry
	waitbutton
	closetext
	follow PLAYER, ROUTE32_COOLTRAINER_M
	applymovement PLAYER, Movement_Route32CooltrainerMPushesYouBackToViolet
	stopfollow
	turnobject PLAYER, DOWN
	scall Route32CooltrainerMContinueScene
	applymovement ROUTE32_COOLTRAINER_M, Movement_Route32CooltrainerMReset1
	applymovement ROUTE32_COOLTRAINER_M, Movement_Route32CooltrainerMReset2
	end

Route32RoarTMGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM05_ROAR
	iftrue .AlreadyHaveRoar
	writetext Text_RoarIntro
	promptbutton
	verbosegiveitem TM_ROAR
	iffalse .Finish
	setevent EVENT_GOT_TM05_ROAR
.AlreadyHaveRoar:
	writetext Text_RoarOutro
	waitbutton
.Finish:
	closetext
	end

Route32WannaBuyASlowpokeTailScript:
	turnobject ROUTE32_FISHER4, DOWN
	turnobject PLAYER, UP
	sjump _OfferToSellSlowpokeTail

SlowpokeTailSalesmanScript:
	faceplayer
_OfferToSellSlowpokeTail:
	setscene SCENE_ROUTE32_NOOP
	opentext
	writetext Text_MillionDollarSlowpokeTail
	yesorno
	iffalse .refused
	writetext Text_ThoughtKidsWereLoaded
	waitbutton
	closetext
	end

.refused
	writetext Text_RefusedToBuySlowpokeTail
	waitbutton
	closetext
	end

TrainerCamperRoland:
	trainer CAMPER, ROLAND, EVENT_BEAT_CAMPER_ROLAND, CamperRolandSeenText, CamperRolandBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperRolandAfterText
	waitbutton
	closetext
	end

TrainerFisherJustin:
	trainer FISHER, JUSTIN, EVENT_BEAT_FISHER_JUSTIN, FisherJustinSeenText, FisherJustinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherJustinAfterText
	waitbutton
	closetext
	end

TrainerFisherRalph1:
	trainer FISHER, RALPH1, EVENT_BEAT_FISHER_RALPH, FisherRalph1SeenText, FisherRalph1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_FISHER_RALPH
	endifjustbattled
	opentext
	checkflag ENGINE_RALPH_READY_FOR_REMATCH
	iftrue .Rematch
	checkflag ENGINE_QWILFISH_SWARM
	iftrue .Swarm
	checkcellnum PHONE_FISHER_RALPH
	iftrue .NumberAccepted
	checkevent EVENT_RALPH_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext FisherRalphAfterText
	promptbutton
	setevent EVENT_RALPH_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskAgain:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_FISHER_RALPH
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, FISHER, RALPH1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext FisherRalph1BeatenText, 0
	readmem wRalphFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
.Fight2:
	checkflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_ECRUTEAK
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer FISHER, RALPH1
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 1
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer FISHER, RALPH2
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 2
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer FISHER, RALPH3
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 3
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer FISHER, RALPH4
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 4
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer FISHER, RALPH5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.Swarm:
	writetext FisherRalphSwarmText
	waitbutton
	closetext
	end

.AskNumber1:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.RematchStd:
	jumpstd RematchMScript
	end

TrainerFisherHenry:
	trainer FISHER, HENRY, EVENT_BEAT_FISHER_HENRY, FisherHenrySeenText, FisherHenryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherHenryAfterText
	waitbutton
	closetext
	end

TrainerPicnickerLiz1:
	trainer PICNICKER, LIZ1, EVENT_BEAT_PICNICKER_LIZ, PicnickerLiz1SeenText, PicnickerLiz1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_PICNICKER_LIZ
	endifjustbattled
	opentext
	checkflag ENGINE_LIZ_READY_FOR_REMATCH
	iftrue .Rematch
	checkcellnum PHONE_PICNICKER_LIZ
	iftrue .NumberAccepted
	checkevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext PicnickerLiz1AfterText
	promptbutton
	setevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskAgain:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_LIZ
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, PICNICKER, LIZ1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext PicnickerLiz1BeatenText, 0
	readmem wLizFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_ECRUTEAK
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer PICNICKER, LIZ1
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 1
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer PICNICKER, LIZ2
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 2
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer PICNICKER, LIZ3
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 3
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer PICNICKER, LIZ4
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 4
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer PICNICKER, LIZ5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1FScript
	end

.AskNumber2:
	jumpstd AskNumber2FScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberFScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedFScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedFScript
	end

.PhoneFull:
	jumpstd PhoneFullFScript
	end

.RematchStd:
	jumpstd RematchFScript
	end

TrainerYoungsterAlbert:
	trainer YOUNGSTER, ALBERT, EVENT_BEAT_YOUNGSTER_ALBERT, YoungsterAlbertSeenText, YoungsterAlbertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterAlbertAfterText
	waitbutton
	closetext
	end

TrainerYoungsterGordon:
	trainer YOUNGSTER, GORDON, EVENT_BEAT_YOUNGSTER_GORDON, YoungsterGordonSeenText, YoungsterGordonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterGordonAfterText
	waitbutton
	closetext
	end

TrainerBirdKeeperPeter:
	trainer BIRD_KEEPER, PETER, EVENT_BEAT_BIRD_KEEPER_PETER, BirdKeeperPeterSeenText, BirdKeeperPeterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperPeterAfterText
	waitbutton
	closetext
	end

FriedaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	iftrue .Friday
	readvar VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checkevent EVENT_MET_FRIEDA_OF_FRIDAY
	iftrue .MetFrieda
	writetext MeetFriedaText
	promptbutton
	setevent EVENT_MET_FRIEDA_OF_FRIDAY
.MetFrieda:
	writetext FriedaGivesGiftText
	promptbutton
	verbosegiveitem POISON_BARB
	iffalse .Done
	setevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	writetext FriedaGaveGiftText
	waitbutton
	closetext
	end

.Friday:
	writetext FriedaFridayText
	waitbutton
.Done:
	closetext
	end

.NotFriday:
	writetext FriedaNotFridayText
	waitbutton
	closetext
	end

Route32GreatBall:
	itemball GREAT_BALL

Route32Repel:
	itemball REPEL

Route32Sign:
	jumptext Route32SignText

Route32RuinsSign:
	jumptext Route32RuinsSignText

Route32UnionCaveSign:
	jumptext Route32UnionCaveSignText

Route32PokecenterSign:
	jumpstd PokecenterSignScript

Route32HiddenGreatBall:
	hiddenitem GREAT_BALL, EVENT_ROUTE_32_HIDDEN_GREAT_BALL

Route32HiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_ROUTE_32_HIDDEN_SUPER_POTION

Movement_Route32CooltrainerMPushesYouBackToViolet:
	step UP
	step UP
	step_end

Movement_Route32CooltrainerMReset1:
	step DOWN
	step_end

Movement_Route32CooltrainerMReset2:
	step RIGHT
	step_end

Route32CooltrainerMText_WhatsTheHurry:
	text "Espera!"
	line "On vas tan ràpid?"
	done

Route32CooltrainerMText_AideIsWaiting:
	text "<PLAYER>, oi?"
	line "Un home amb"

	para "ulleres et"
	line "buscava."

	para "Comprova-ho tu."
	line "T'espera al"

	para "CENTRE #MON."
	done

Route32CooltrainerMText_UnusedSproutTower:
	text "Has anat a la"
	line "TORRE LLUERNA?"

	para "Si visites CIUTAT"
	line "VIOLETA,"

	para "esperaran que"
	line "hi entrenaris."

	para "És bàsic per als"
	line "entrenadors. Ves"
	cont "a TORRE LLUERNA!"
	done

Route32CooltrainerMText_VioletGym:
	text "Has anat al"
	line "GIMNÀS #MON?"

	para "Pots posar a"
	line "prova els teus"
	cont "#MON i a tu."

	para "És un ritu de"
	line "pas per a tots"
	cont "els entrenadors!"
	done

Route32CooltrainerMText_HaveThisSeed:
	text "Tens uns #MON"
	line "molt bons."

	para "Deu ser per"
	line "l'entrenament"

	para "que els has donat"
	line "a CIUTAT VIOLETA."

	para "L'entrenament al"
	line "GIMNÀS deu haver"

	para "estat molt útil."

	para "Com a record de"
	line "CIUTAT VIOLETA,"
	cont "pren això."

	para "Augmenta la força"
	line "dels moviments de"
	cont "tipus planta."
	done

Route32CooltrainerMText_ExperiencesShouldBeUseful:
	text "Les experiències"
	line "a CIUTAT VIOLETA"

	para "et seran útils"
	line "pel teu viatge."
	done

Text_MillionDollarSlowpokeTail:
	text "Vols tenir aquesta"
	line "saborosa i"

	para "nutritiva CUA DE"
	line "SLOWPOKE?"

	para "Ara mateix per a"
	line "tu, 1.000.000 ¥!"

	para "La voldràs!"
	done

Text_ThoughtKidsWereLoaded:
	text "Ecs! Pensava que"
	line "els nens d'avui"
	cont "anaven carregats…"
	done

Text_RefusedToBuySlowpokeTail:
	text "No la vols?"
	line "Doncs fora! Xo!"
	done

FisherJustinSeenText:
	text "Ep!"

	para "M'has fet perdre"
	line "aquell peix!"
	done

FisherJustinBeatenText:
	text "Xof!"
	done

FisherJustinAfterText:
	text "Calma, serenitat…"
	line "L'essència de la"

	para "pesca i els"
	line "#MON"
	cont "és la mateixa."
	done

FisherRalph1SeenText:
	text "Sóc molt bo tant"
	line "en pesca com en"
	cont "#MON."

	para "No penso perdre"
	line "contra cap nen!"
	done

FisherRalph1BeatenText:
	text "Ecs! He intentat"
	line "anar massa ràpid…"
	done

FisherRalphAfterText:
	text "La pesca és una"
	line "passió de tota"
	cont "la vida."

	para "Els #MON són"
	line "amics per sempre!"
	done

FisherRalphSwarmText:
	text "Un, dos, tres…"
	line "Muahahaha, quina"

	para "bona pesca!"
	line "Ja he acabat!"

	para "Atrapa'n tots els"
	line "que puguis, nen!"
	done

Route32UnusedFisher1SeenText: ; unreferenced
	text "Sempre atrapo el"
	line "mateix #MON…"

	para "Potser un combat"
	line "em canviarà la"
	cont "sort."
	done

Route32UnusedFisher1BeatenText: ; unreferenced
	text "Res no em surt bé"
	line "ara mateix…"
	done

Route32UnusedFisher1AfterText: ; unreferenced
	text "Com és que el noi"
	line "del costat atrapa"
	cont "bons #MON?"
	done

Route32UnusedFisher2SeenText: ; unreferenced
	text "Avui tinc ratxa."
	line "Què tal un combat,"
	cont "nen?"
	done

Route32UnusedFisher2BeatenText: ; unreferenced
	text "Uf. Aquesta vegada"
	line "no he tingut sort."
	done

Route32UnusedFisher2AfterText: ; unreferenced
	text "Has de tenir una"
	line "bona CANYA si"

	para "vols atrapar bons"
	line "#MON."
	done

FisherHenrySeenText:
	text "Els meus #MON?"
	line "Recent pescats!"
	done

FisherHenryBeatenText:
	text "SPLASH?"
	done

FisherHenryAfterText:
	text "Els #MON recent"
	line "pescats no són"

	para "rivals per als"
	line "ben entrenats."
	done

YoungsterAlbertSeenText:
	text "No t'he vist mai"
	line "per aquí."

	para "Et penses que ets"
	line "molt dur?"
	done

YoungsterAlbertBeatenText:
	text "Ets fort!"
	done

YoungsterAlbertAfterText:
	text "Intentaré ser el"
	line "millor amb els"
	cont "meus preferits."

	para "No faré servir"
	line "els mateixos"
	cont "#MON"
	cont "forts que tothom."
	done

YoungsterGordonSeenText:
	text "He trobat uns"
	line "bons #MON a"
	cont "l'herba!"

	para "Crec que em"
	line "serviran!"
	done

YoungsterGordonBeatenText:
	text "Llàstima. Pensava"
	line "que podia guanyar."
	done

YoungsterGordonAfterText:
	text "L'herba és plena"
	line "de coses enganxo-"
	cont "ses."
	done

CamperRolandSeenText:
	text "Aquesta mirada…"
	line "És intrigant."
	done

CamperRolandBeatenText:
	text "Hmmm. Això és"
	line "decebedor."
	done

CamperRolandAfterText:
	text "Si no vols"
	line "combatre, evita"
	cont "el contacte"
	cont "visual."
	done

PicnickerLiz1SeenText:
	text "Sí, sí. I ja"
	line "saps…"

	para "Perdona? Combat?"
	line "Estic al telèfon."

	para "Bé, d'acord. Però"
	line "fes-ho ràpid."
	done

PicnickerLiz1BeatenText:
	text "Oh! He de desfogar"
	line "la meva ràbia!"
	done

PicnickerLiz1AfterText:
	text "Estava tenint una"
	line "bona xerrada."
	done

BirdKeeperPeterSeenText:
	text "Aquesta INSÍGNIA!"
	line "És de C. VIOLETA!"

	para "Has guanyat en"
	line "FALKNER?"
	done

BirdKeeperPeterBeatenText:
	text "Sé quines són"
	line "les meves"
	cont "febleses."
	done

BirdKeeperPeterAfterText:
	text "Hauria d'entrenar"
	line "de nou al GIMNÀS"
	cont "de C. VIOLETA."
	done

Route32UnusedText: ; unreferenced
	text "Els pescadors"
	line "m'han cridat per"
	cont "molestar-los…"
	done

Text_RoarIntro:
	text "GRUUUUU!"
	line "LA GENT FUIG QUAN"

	para "BRAMO! PERÒ TU"
	line "HAS VINGUT!"

	para "AIXÒ EM COMPLAU!"
	line "ARA PREN AIXÒ!"
	done

Text_RoarOutro:
	text "GRUUUUU!"
	line "ÉS ROAR!"

	para "FINS ELS #MON"
	line "FUGEN D'UN BRAMUL!"
	done

MeetFriedaText:
	text "FRIEDA: Visca!"
	line "És divendres!"

	para "Sóc la FRIEDA"
	line "del divendres!"

	para "Encantat de"
	line "conèixer-te!"
	done

FriedaGivesGiftText:
	text "Aquí tens una PUA"
	line "VERINOSA per a tu!"
	done

FriedaGaveGiftText:
	text "FRIEDA: Dóna-la a"
	line "un #MON amb"
	cont "moviments verí."

	para "Oh!"

	para "És genial!"

	para "Et sorprendrà com"
	line "millora els"
	cont "atacs de verí!"
	done

FriedaFridayText:
	text "FRIEDA: Ei! Quin"
	line "dia t'agrada?"

	para "M'encanta el"
	line "divendres. Segur!"

	para "No trobes que"
	line "és genial?"
	done

FriedaNotFridayText:
	text "FRIEDA: Avui no"
	line "és divendres?"

	para "És tan avorrit"
	line "quan no ho és!"
	done

Route32SignText:
	text "RUTA 32"

	para "CIUTAT VIOLETA -"
	line "POBLE AZALEA"
	done

Route32RuinsSignText:
	text "RUÏNES D'ALPH"
	line "ENTRADA EST"
	done

Route32UnionCaveSignText:
	text "COVA UNIÓ"
	line "ENDAVANT"
	done

Route32_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 73, ROUTE_32_POKECENTER_1F, 1
	warp_event  4,  2, ROUTE_32_RUINS_OF_ALPH_GATE, 3
	warp_event  4,  3, ROUTE_32_RUINS_OF_ALPH_GATE, 4
	warp_event  6, 79, UNION_CAVE_1F, 4

	def_coord_events
	coord_event 18,  8, SCENE_ROUTE32_COOLTRAINER_M_BLOCKS, Route32CooltrainerMStopsYouScene
	coord_event  7, 71, SCENE_ROUTE32_OFFER_SLOWPOKETAIL, Route32WannaBuyASlowpokeTailScript

	def_bg_events
	bg_event 13,  5, BGEVENT_READ, Route32Sign
	bg_event  9,  1, BGEVENT_READ, Route32RuinsSign
	bg_event 10, 84, BGEVENT_READ, Route32UnionCaveSign
	bg_event 12, 73, BGEVENT_READ, Route32PokecenterSign
	bg_event 12, 67, BGEVENT_ITEM, Route32HiddenGreatBall
	bg_event 11, 40, BGEVENT_ITEM, Route32HiddenSuperPotion

	def_object_events
	object_event  8, 49, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherJustin, -1
	object_event 12, 56, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherRalph1, -1
	object_event  6, 48, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherHenry, -1
	object_event 12, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterAlbert, -1
	object_event  4, 63, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterGordon, -1
	object_event  3, 45, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperRoland, -1
	object_event 10, 30, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerLiz1, -1
	object_event 19,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32CooltrainerMScript, -1
	object_event 11, 82, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperPeter, -1
	object_event  7, 70, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeTailSalesmanScript, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  6, 53, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route32GreatBall, EVENT_ROUTE_32_GREAT_BALL
	object_event 15, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32RoarTMGuyScript, -1
	object_event 12, 67, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FriedaScript, EVENT_ROUTE_32_FRIEDA_OF_FRIDAY
	object_event  3, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route32Repel, EVENT_ROUTE_32_REPEL
