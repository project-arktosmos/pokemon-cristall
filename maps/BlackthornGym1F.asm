object_const_def
	const BLACKTHORNGYM1F_CLAIR
	const BLACKTHORNGYM1F_COOLTRAINER_M1
	const BLACKTHORNGYM1F_COOLTRAINER_M2
	const BLACKTHORNGYM1F_COOLTRAINER_F
	const BLACKTHORNGYM1F_GYM_GUIDE

BlackthornGym1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, BlackthornGym1FBouldersCallback

BlackthornGym1FBouldersCallback:
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_1
	iffalse .skip1
	changeblock 8, 2, $3b ; fallen boulder 2
.skip1
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_2
	iffalse .skip2
	changeblock 2, 4, $3a ; fallen boulder 1
.skip2
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_3
	iffalse .skip3
	changeblock 8, 6, $3b ; fallen boulder 2
.skip3
	endcallback

BlackthornGymClairScript:
	faceplayer
	opentext
	checkflag ENGINE_RISINGBADGE
	iftrue .AlreadyGotBadge
	checkevent EVENT_BEAT_CLAIR
	iftrue .FightDone
	writetext ClairIntroText
	waitbutton
	closetext
	winlosstext ClairWinText, 0
	loadtrainer CLAIR, CLAIR1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CLAIR
	opentext
	writetext ClairText_GoToDragonsDen
	waitbutton
	closetext
	setevent EVENT_BEAT_COOLTRAINERM_PAUL
	setevent EVENT_BEAT_COOLTRAINERM_CODY
	setevent EVENT_BEAT_COOLTRAINERM_MIKE
	setevent EVENT_BEAT_COOLTRAINERF_FRAN
	setevent EVENT_BEAT_COOLTRAINERF_LOLA
	clearevent EVENT_MAHOGANY_MART_OWNERS
	setevent EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	clearevent EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	end

.FightDone:
	writetext ClairText_TooMuchToExpect
	waitbutton
	closetext
	end

.AlreadyGotBadge:
	checkevent EVENT_GOT_TM24_DRAGONBREATH
	iftrue .GotTM24
	writetext BlackthornGymClairText_YouKeptMeWaiting
	promptbutton
	giveitem TM_DRAGONBREATH
	iffalse .BagFull
	getitemname STRING_BUFFER_3, TM_DRAGONBREATH
	writetext BlackthornGymText_ReceivedTM24
	playsound SFX_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_TM24_DRAGONBREATH
	writetext BlackthornGymClairText_DescribeTM24
	promptbutton
	sjump .GotTM24

.BagFull:
	writetext BlackthornGymClairText_BagFull
	waitbutton
	closetext
	end

.GotTM24:
	writetext BlackthornGymClairText_League
	waitbutton
	closetext
	end

TrainerCooltrainermPaul:
	trainer COOLTRAINERM, PAUL, EVENT_BEAT_COOLTRAINERM_PAUL, CooltrainermPaulSeenText, CooltrainermPaulBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermPaulAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermMike:
	trainer COOLTRAINERM, MIKE, EVENT_BEAT_COOLTRAINERM_MIKE, CooltrainermMikeSeenText, CooltrainermMikeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermMikeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfLola:
	trainer COOLTRAINERF, LOLA, EVENT_BEAT_COOLTRAINERF_LOLA, CooltrainerfLolaSeenText, CooltrainerfLolaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfLolaAfterBattleText
	waitbutton
	closetext
	end

BlackthornGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CLAIR
	iftrue .BlackthornGymGuideWinScript
	writetext BlackthornGymGuideText
	waitbutton
	closetext
	end

.BlackthornGymGuideWinScript:
	writetext BlackthornGymGuideWinText
	waitbutton
	closetext
	end

BlackthornGymStatue:
	checkflag ENGINE_RISINGBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, CLAIR, CLAIR1
	jumpstd GymStatue2Script

ClairIntroText:
	text "Sóc la CLAIR."

	para "La millor mestra"
	line "de dragons del món"

	para "Puc fer front"
	line "fins i tot a"

	para "l'ELIT QUATRE de"
	line "la LLIGA #MON."

	para "Encara vols"
	line "enfrontar-te a mi?"

	para "…D'acord."
	line "Endavant!"

	para "Com a LÍDER DE"
	line "GIMNÀS, faré"

	para "servir tot el meu"
	line "poder!"
	done

ClairWinText:
	text "He perdut?"

	para "No m'ho crec."
	line "Hi ha d'haver"
	cont "algun error…"
	done

ClairText_GoToDragonsDen:
	text "No ho admetré."

	para "Potser he perdut,"
	line "però encara no"

	para "estàs preparat"
	line "per a la LLIGA."

	para "Ja sé! Hauries de"
	line "fer la prova dels"
	cont "domadors de dracs."

	para "Darrere el GIMNÀS"
	line "hi ha un lloc"
	cont "dit COVA DEL DRAC."

	para "Al centre hi ha"
	line "un petit santuari."

	para "Ves-hi."

	para "Si pots demostrar"
	line "que has deixat les"

	para "teves idees"
	line "mandroses, et"

	para "reconeixeré com"
	line "a entrenador digne"
	cont "d'una MEDALLA!"
	done

ClairText_TooMuchToExpect:
	text "Què passa?"

	para "És massa per"
	line "demanar-te?"
	done

BlackthornGymClairText_YouKeptMeWaiting:
	text "M'has fet esperar!"

	para "Aquí tens! Pren-ho"
	done

BlackthornGymText_ReceivedTM24:
	text "<PLAYER> ha rebut"
	line "la MT24."
	done

BlackthornGymClairText_DescribeTM24:
	text "Conté l'atac"
	line "DRAGONBREATH."

	para "No, no té res a"
	line "veure amb el meu"
	cont "alè."

	para "Si no el vols,"
	line "no cal que el"
	cont "prenguis."
	done

BlackthornGymClairText_BagFull:
	text "Què és això? No"
	line "tens espai?"
	done

BlackthornGymClairText_League:
	text "Què passa?"

	para "No vas cap a la"
	line "LLIGA #MON?"

	para "No saps on és?"

	para "Des d'aquí, ves a"
	line "POBLE ESCORÇA."

	para "Després fes SURF"
	line "cap a l'est. La"
	cont "ruta és molt dura."

	para "No t'atreveixis a"
	line "perdre a la LLIGA"
	cont "#MON!"

	para "Si ho fas, em"
	line "sentiré encara"

	para "pitjor per haver"
	line "perdut contra tu!"

	para "Dóna-ho tot!"
	done

CooltrainermPaulSeenText:
	text "El teu primer"
	line "combat amb dracs?"

	para "Et mostraré com"
	line "de durs són!"
	done

CooltrainermPaulBeatenText:
	text "El meu # drac"
	line "ha perdut?"
	done

CooltrainermPaulAfterBattleText:
	text "En LANCE t'ha dit"
	line "que li agradaria"

	para "tornar-te a veure?"
	line "De cap manera!"
	done

CooltrainermMikeSeenText:
	text "Probabilitat de"
	line "perdre? Ni un"
	cont "per cent!"
	done

CooltrainermMikeBeatenText:
	text "Què estrany."
	done

CooltrainermMikeAfterBattleText:
	text "Ara sé quines són"
	line "les meves manques."

	para "Gràcies per"
	line "mostrar-m'ho!"
	done

CooltrainerfLolaSeenText:
	text "Els dracs són"
	line "# sagrats."

	para "Estan plens"
	line "d'energia vital."

	para "Si no vas de"
	line "debò, no podràs"

	para "vèncer-los."
	done

CooltrainerfLolaBeatenText:
	text "Molt bé!"
	done

CooltrainerfLolaAfterBattleText:
	text "Els dracs són"
	line "febles contra"
	cont "atacs de drac."
	done

BlackthornGymGuideText:
	text "Ei! Futur CAMPIÓ!"

	para "Ha estat un llarg"
	line "viatge, però ja"

	para "gairebé acabem!"
	line "Compta amb mi!"

	para "La CLAIR fa servir"
	line "els mítics i"
	cont "sagrats # drac."

	para "No els pots fer"
	line "mal fàcilment."

	para "Però, saps?, diuen"
	line "que són febles"

	para "contra els atacs"
	line "de tipus gel."
	done

BlackthornGymGuideWinText:
	text "Has estat genial"
	line "en guanyar CLAIR!"

	para "Només queda el"
	line "repte de la LLIGA"
	cont "#MON."

	para "Estàs a punt de"
	line "ser el CAMPIÓ"
	cont "#MON!"
	done

BlackthornGym1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, BLACKTHORN_CITY, 1
	warp_event  5, 17, BLACKTHORN_CITY, 1
	warp_event  1,  7, BLACKTHORN_GYM_2F, 1
	warp_event  7,  9, BLACKTHORN_GYM_2F, 2
	warp_event  2,  6, BLACKTHORN_GYM_2F, 3
	warp_event  7,  7, BLACKTHORN_GYM_2F, 4
	warp_event  7,  6, BLACKTHORN_GYM_2F, 5

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, BlackthornGymStatue
	bg_event  6, 15, BGEVENT_READ, BlackthornGymStatue

	def_object_events
	object_event  5,  3, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornGymClairScript, -1
	object_event  6,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermMike, -1
	object_event  1, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermPaul, -1
	object_event  9,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfLola, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornGymGuideScript, -1
