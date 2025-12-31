	object_const_def
	const ROUTE35_YOUNGSTER1
	const ROUTE35_YOUNGSTER2
	const ROUTE35_LASS1
	const ROUTE35_LASS2
	const ROUTE35_YOUNGSTER3
	const ROUTE35_FISHER
	const ROUTE35_BUG_CATCHER
	const ROUTE35_SUPER_NERD
	const ROUTE35_OFFICER
	const ROUTE35_FRUIT_TREE
	const ROUTE35_POKE_BALL

Route35_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBirdKeeperBryan:
	trainer BIRD_KEEPER, BRYAN, EVENT_BEAT_BIRD_KEEPER_BRYAN, BirdKeeperBryanSeenText, BirdKeeperBryanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBryanAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerIrwin:
	trainer JUGGLER, IRWIN1, EVENT_BEAT_JUGGLER_IRWIN, JugglerIrwin1SeenText, JugglerIrwin1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_JUGGLER_IRWIN
	endifjustbattled
	opentext
	checkcellnum PHONE_JUGGLER_IRWIN
	iftrue Route35NumberAcceptedM
	checkevent EVENT_IRWIN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext JugglerIrwinAfterBattleText
	promptbutton
	setevent EVENT_IRWIN_ASKED_FOR_PHONE_NUMBER
	scall Route35AskNumber1M
	sjump .AskForNumber

.AskedAlready:
	scall Route35AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_JUGGLER_IRWIN
	ifequal PHONE_CONTACTS_FULL, Route35PhoneFullM
	ifequal PHONE_CONTACT_REFUSED, Route35NumberDeclinedM
	gettrainername STRING_BUFFER_3, JUGGLER, IRWIN1
	scall Route35RegisteredNumberM
	sjump Route35NumberAcceptedM

Route35AskNumber1M:
	jumpstd AskNumber1MScript
	end

Route35AskNumber2M:
	jumpstd AskNumber2MScript
	end

Route35RegisteredNumberM:
	jumpstd RegisteredNumberMScript
	end

Route35NumberAcceptedM:
	jumpstd NumberAcceptedMScript
	end

Route35NumberDeclinedM:
	jumpstd NumberDeclinedMScript
	end

Route35PhoneFullM:
	jumpstd PhoneFullMScript
	end

Route35RematchM:
	jumpstd RematchMScript
	end

TrainerCamperIvan:
	trainer CAMPER, IVAN, EVENT_BEAT_CAMPER_IVAN, CamperIvanSeenText, CamperIvanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperIvanAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperElliot:
	trainer CAMPER, ELLIOT, EVENT_BEAT_CAMPER_ELLIOT, CamperElliotSeenText, CamperElliotBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperElliotAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerBrooke:
	trainer PICNICKER, BROOKE, EVENT_BEAT_PICNICKER_BROOKE, PicnickerBrookeSeenText, PicnickerBrookeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerBrookeAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerKim:
	trainer PICNICKER, KIM, EVENT_BEAT_PICNICKER_KIM, PicnickerKimSeenText, PicnickerKimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerKimAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherArnie:
	trainer BUG_CATCHER, ARNIE1, EVENT_BEAT_BUG_CATCHER_ARNIE, BugCatcherArnieSeenText, BugCatcherArnieBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_BUG_CATCHER_ARNIE
	endifjustbattled
	opentext
	checkflag ENGINE_ARNIE_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkflag ENGINE_YANMA_SWARM
	iftrue .YanmaSwarming
	checkcellnum PHONE_BUG_CATCHER_ARNIE
	iftrue Route35NumberAcceptedM
	checkevent EVENT_ARNIE_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext BugCatcherArnieAfterBattleText
	promptbutton
	setevent EVENT_ARNIE_ASKED_FOR_PHONE_NUMBER
	scall Route35AskNumber1M
	sjump .AskForNumber

.AskedAlready:
	scall Route35AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_BUG_CATCHER_ARNIE
	ifequal PHONE_CONTACTS_FULL, Route35PhoneFullM
	ifequal PHONE_CONTACT_REFUSED, Route35NumberDeclinedM
	gettrainername STRING_BUFFER_3, BUG_CATCHER, ARNIE1
	scall Route35RegisteredNumberM
	sjump Route35NumberAcceptedM

.WantsBattle:
	scall Route35RematchM
	winlosstext BugCatcherArnieBeatenText, 0
	readmem wArnieFightCount
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
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer BUG_CATCHER, ARNIE1
	startbattle
	reloadmapafterbattle
	loadmem wArnieFightCount, 1
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer BUG_CATCHER, ARNIE2
	startbattle
	reloadmapafterbattle
	loadmem wArnieFightCount, 2
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer BUG_CATCHER, ARNIE3
	startbattle
	reloadmapafterbattle
	loadmem wArnieFightCount, 3
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer BUG_CATCHER, ARNIE4
	startbattle
	reloadmapafterbattle
	loadmem wArnieFightCount, 4
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer BUG_CATCHER, ARNIE5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.YanmaSwarming:
	writetext BugCatcherArnieYanmaText
	waitbutton
	closetext
	end

TrainerFirebreatherWalt:
	trainer FIREBREATHER, WALT, EVENT_BEAT_FIREBREATHER_WALT, FirebreatherWaltSeenText, FirebreatherWaltBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherWaltAfterBattleText
	waitbutton
	closetext
	end

TrainerOfficerDirk:
	faceplayer
	opentext
	checktime NITE
	iffalse .NotNight
	checkevent EVENT_BEAT_OFFICER_DIRK
	iftrue .AfterBattle
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficerDirkSeenText
	waitbutton
	closetext
	winlosstext OfficerDirkBeatenText, 0
	loadtrainer OFFICER, DIRK
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICER_DIRK
	closetext
	end

.AfterBattle:
	writetext OfficerDirkAfterBattleText
	waitbutton
	closetext
	end

.NotNight:
	writetext OfficerDirkPrettyToughText
	waitbutton
	closetext
	end

Route35Sign:
	jumptext Route35SignText

Route35TMRollout:
	itemball TM_ROLLOUT

Route35FruitTree:
	fruittree FRUITTREE_ROUTE_35

CamperIvanSeenText:
	text "He estat rebent"
	line "dades de #MON"

	para "per la ràdio. Crec"
	line "que estic bé."
	done

CamperIvanBeatenText:
	text "Em rendeixo!"
	done

CamperIvanAfterBattleText:
	text "La música a la"
	line "ràdio canvia"
	cont "l'humor dels"
	cont "#MON salvatges."
	done

CamperElliotSeenText:
	text "Li ensenyaré a la"
	line "meva xicota que"
	cont "sóc el millor!"
	done

CamperElliotBeatenText:
	text "M'hauria agradat"
	line "que haguessis"
	cont "perdut per mi…"
	done

CamperElliotAfterBattleText:
	text "M'han humiliat"
	line "davant de la meva"
	cont "xicota…"
	done

PicnickerBrookeSeenText:
	text "El meu xicot és"
	line "fluix, així que no"
	cont "puc confiar-hi."
	done

PicnickerBrookeBeatenText:
	text "Oh! Ets tan fort!"
	done

PicnickerBrookeAfterBattleText:
	text "Puc confiar més"
	line "en els meus"
	cont "#MON"
	cont "que en el meu"
	cont "xicot."
	done

PicnickerKimSeenText:
	text "Vas al GIMNÀS?"
	line "Jo també!"
	done

PicnickerKimBeatenText:
	text "Oh. No he pogut"
	line "guanyar…"
	done

PicnickerKimAfterBattleText:
	text "Les MEDALLES de"
	line "GIMNÀS són bonics."
	cont "Les col·lecciono."
	done

BirdKeeperBryanSeenText:
	text "Quins tipus de"
	line "BALLS fas servir?"
	done

BirdKeeperBryanBeatenText:
	text "Ui! No he estat"
	line "prou ràpid!"
	done

BirdKeeperBryanAfterBattleText:
	text "Alguns #MON"
	line "fugen de seguida."

	para "Prova d'atrapar-"
	line "los amb la FAST"
	cont "BALL d'en KURT."

	para "Quan trobo un"
	line "BONGUR BLANC, el"
	cont "porto a en KURT."

	para "Ell el converteix"
	line "en una BALL."
	done

JugglerIrwin1SeenText:
	text "Mira la meva"
	line "destresa elegant"
	cont "amb les BALLS!"
	done

JugglerIrwin1BeatenText:
	text "Uf! Això ha estat"
	line "un cop!"
	done

JugglerIrwinAfterBattleText:
	text "T'anava a enlluer-"
	line "nar amb el meu"
	cont "#MON premiat."

	para "Però la teva"
	line "habilitat m'ha"
	cont "electrificat!"
	done

BugCatcherArnieSeenText:
	text "Aniré on sigui si"
	line "hi apareixen"
	cont "#MON insecte."
	done

BugCatcherArnieBeatenText:
	text "Eh? No hauria"
	line "d'haver perdut…"
	done

BugCatcherArnieAfterBattleText:
	text "El meu VENONAT em"
	line "va fer guanyar el"

	para "Concurs d'Insectes"
	line "al PARC NACIONAL."
	done

BugCatcherArnieYanmaText:
	text "Uau… Mira tots"
	line "aquests YANMA!"

	para "Estic tan sorprès"
	line "que no em puc"
	cont "moure."
	done

FirebreatherWaltSeenText:
	text "Estic practicant"
	line "com bufar foc."
	done

FirebreatherWaltBeatenText:
	text "Au! M'he cremat"
	line "la punta del nas!"
	done

FirebreatherWaltAfterBattleText:
	text "La Marxa #MON"
	line "a la ràdio atrau"
	cont "#MON salvatges."
	done

OfficerDirkSeenText:
	text "El perill aguaita"
	line "a la nit!"
	done

OfficerDirkBeatenText:
	text "Upa!"
	done

OfficerDirkAfterBattleText:
	text "Saps, la nit és"
	line "divertida a la"
	cont "seva manera."

	para "Però no t'excedis"
	line "gaire, d'acord?"
	done

OfficerDirkPrettyToughText:
	text "Els teus #MON"
	line "semblen forts."

	para "Podries anar on"
	line "vulguis sense"
	cont "perill."
	done

Route35SignText:
	text "RUTA 35"
	done

Route35_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 33, ROUTE_35_GOLDENROD_GATE, 1
	warp_event 10, 33, ROUTE_35_GOLDENROD_GATE, 2
	warp_event  3,  5, ROUTE_35_NATIONAL_PARK_GATE, 3

	def_coord_events

	def_bg_events
	bg_event  1,  7, BGEVENT_READ, Route35Sign
	bg_event 11, 31, BGEVENT_READ, Route35Sign

	def_object_events
	object_event  4, 19, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperIvan, -1
	object_event  8, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperElliot, -1
	object_event  7, 20, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerBrooke, -1
	object_event 10, 26, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerKim, -1
	object_event 14, 28, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerBirdKeeperBryan, -1
	object_event  2, 10, SPRITE_FISHER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherWalt, -1
	object_event 16,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherArnie, -1
	object_event  5, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerJugglerIrwin, -1
	object_event  5,  6, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TrainerOfficerDirk, -1
	object_event  2, 25, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route35FruitTree, -1
	object_event 13, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route35TMRollout, EVENT_ROUTE_35_TM_ROLLOUT
