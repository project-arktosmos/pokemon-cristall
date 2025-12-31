	object_const_def
	const ROUTE37_WEIRD_TREE1
	const ROUTE37_WEIRD_TREE2
	const ROUTE37_YOUNGSTER
	const ROUTE37_FRUIT_TREE1
	const ROUTE37_SUNNY
	const ROUTE37_FRUIT_TREE2
	const ROUTE37_FRUIT_TREE3

Route37_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route37SunnyCallback

Route37SunnyCallback:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .SunnyAppears
	disappear ROUTE37_SUNNY
	endcallback

.SunnyAppears:
	appear ROUTE37_SUNNY
	endcallback

TrainerTwinsAnnandanne1:
	trainer TWINS, ANNANDANNE1, EVENT_BEAT_TWINS_ANN_AND_ANNE, TwinsAnnandanne1SeenText, TwinsAnnandanne1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsAnnandanne1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsAnnandanne2:
	trainer TWINS, ANNANDANNE2, EVENT_BEAT_TWINS_ANN_AND_ANNE, TwinsAnnandanne2SeenText, TwinsAnnandanne2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsAnnandanne2AfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicGreg:
	trainer PSYCHIC_T, GREG, EVENT_BEAT_PSYCHIC_GREG, PsychicGregSeenText, PsychicGregBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicGregAfterBattleText
	waitbutton
	closetext
	end

SunnyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_MAGNET_FROM_SUNNY
	iftrue SunnySundayScript
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, SunnyNotSundayScript
	checkevent EVENT_MET_SUNNY_OF_SUNDAY
	iftrue .MetSunny
	writetext MeetSunnyText
	promptbutton
	setevent EVENT_MET_SUNNY_OF_SUNDAY
.MetSunny:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Kris
	writetext SunnyGivesGiftText1
	promptbutton
	sjump .next
.Kris:
	writetext SunnyGivesGiftText2
	promptbutton
.next
	verbosegiveitem MAGNET
	iffalse SunnyDoneScript
	setevent EVENT_GOT_MAGNET_FROM_SUNNY
	writetext SunnyGaveGiftText
	waitbutton
	closetext
	end

SunnySundayScript:
	writetext SunnySundayText
	waitbutton
SunnyDoneScript:
	closetext
	end

SunnyNotSundayScript:
	writetext SunnyNotSundayText
	waitbutton
	closetext
	end

Route37Sign:
	jumptext Route37SignText

Route37FruitTree1:
	fruittree FRUITTREE_ROUTE_37_1

Route37FruitTree2:
	fruittree FRUITTREE_ROUTE_37_2

Route37FruitTree3:
	fruittree FRUITTREE_ROUTE_37_3

Route37HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_37_HIDDEN_ETHER

TwinsAnnandanne1SeenText:
	text "ANN: L'ANNE i jo"
	line "estem juntes en"
	cont "això!"
	done

TwinsAnnandanne1BeatenText:
	text "ANN i ANNE: Nnn…"
	line "Una mica massa"
	cont "fort."
	done

TwinsAnnandanne1AfterBattleText:
	text "ANN: Puc saber"
	line "què pensen la"

	para "meva germana i"
	line "els meus #MON."
	done

TwinsAnnandanne2SeenText:
	text "ANNE: L'ANN i jo"
	line "estem juntes en"
	cont "això!"
	done

TwinsAnnandanne2BeatenText:
	text "ANN i ANNE: Nnn…"
	line "Una mica massa"
	cont "fort."
	done

TwinsAnnandanne2AfterBattleText:
	text "ANNE: Compartim"
	line "els sentiments"
	cont "dels nostres"
	cont "#MON."
	done

PsychicGregSeenText:
	text "Els #MON no"
	line "poden fer res si"
	cont "estan adormits."

	para "Et mostraré com"
	line "n'és d'espantós!"
	done

PsychicGregBeatenText:
	text "He perdut. Això"
	line "és bastant trist…"
	done

PsychicGregAfterBattleText:
	text "Adormir o"
	line "paralitzar #MON"
	cont "són bones tècni-"
	cont "ques de combat."
	done

MeetSunnyText:
	text "SUNNY: Hola!"

	para "Soc la SUNNY del"
	line "diumenge, o sigui"
	cont "que avui és dg.!"
	done

SunnyGivesGiftText1:
	text "Em van dir que et"
	line "donés això si et"
	cont "veia!"
	done

SunnyGivesGiftText2:
	text "Em van dir que et"
	line "donés això si et"
	cont "veia!"
	done

SunnyGaveGiftText:
	text "SUNNY: Això…"

	para "Mmm…"

	para "… Què era…"

	para "…"

	para "Oh! Ja me'n"
	line "recordo!"

	para "Un #MON que"
	line "sàpiga moviments"

	para "elèctrics hauria"
	line "de portar-ho."

	para "La meva germana"
	line "MONICA va dir que"
	cont "millora els atacs"
	cont "elèctrics!"
	done

SunnySundayText:
	text "SUNNY: Els meus"
	line "germans són"
	cont "MONICA, TUSCANY,"
	cont "WESLEY, ARTHUR,"
	cont "FRIEDA i SANTOS."

	para "Tots són més"
	line "grans que jo!"
	done

SunnyNotSundayText:
	text "SUNNY: Avui no és"
	line "diumenge?"
	cont "Mmm… Ho he"
	cont "oblidat!"
	done

Route37SignText:
	text "RUTA 37"
	done

Route37_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event  5,  3, BGEVENT_READ, Route37Sign
	bg_event  4,  2, BGEVENT_ITEM, Route37HiddenEther

	def_object_events
	object_event  6, 12, SPRITE_WEIRD_TREE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAnnandanne1, -1
	object_event  7, 12, SPRITE_WEIRD_TREE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAnnandanne2, -1
	object_event  6,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicGreg, -1
	object_event 13,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route37FruitTree1, -1
	object_event 16,  8, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunnyScript, EVENT_ROUTE_37_SUNNY_OF_SUNDAY
	object_event 16,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route37FruitTree2, -1
	object_event 15,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route37FruitTree3, -1
