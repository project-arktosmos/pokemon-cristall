	object_const_def
	const ROUTE4_YOUNGSTER
	const ROUTE4_LASS1
	const ROUTE4_LASS2
	const ROUTE4_POKE_BALL

Route4_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBirdKeeperHank:
	trainer BIRD_KEEPER, HANK, EVENT_BEAT_BIRD_KEEPER_HANK, BirdKeeperHankSeenText, BirdKeeperHankBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperHankAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHope:
	trainer PICNICKER, HOPE, EVENT_BEAT_PICNICKER_HOPE, PicnickerHopeSeenText, PicnickerHopeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHopeAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerSharon:
	trainer PICNICKER, SHARON, EVENT_BEAT_PICNICKER_SHARON, PicnickerSharonSeenText, PicnickerSharonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerSharonAfterBattleText
	waitbutton
	closetext
	end

MtMoonSquareSign:
	jumptext MtMoonSquareSignText

Route4HPUp:
	itemball HP_UP

Route4HiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_4_HIDDEN_ULTRA_BALL

BirdKeeperHankSeenText:
	text "Estic entrenant"
	line "els meus #MON."
	cont "Vols lluitar?"
	done

BirdKeeperHankBeatenText:
	text "Ai! He perdut"
	line "aquesta…"
	done

BirdKeeperHankAfterBattleText:
	text "Si vols entrenar"
	line "un #MON en"

	para "concret, treu-lo"
	line "primer i canvia'l"

	para "de seguida. Així"
	line "és com es fa."
	done

PicnickerHopeSeenText:
	text "Tinc la sensació"
	line "que puc guanyar."

	para "A veure si tinc"
	line "raó!"
	done

PicnickerHopeBeatenText:
	text "Oh, ets massa"
	line "fort."
	done

PicnickerHopeAfterBattleText:
	text "Diuen que surten"
	line "CLEFAIRY al"
	cont "MT.MOON."

	para "Però on deuen"
	line "ser?"
	done

PicnickerSharonSeenText:
	text "Mm…"
	line "Jo…"
	done

PicnickerSharonBeatenText:
	text "…"
	done

PicnickerSharonAfterBattleText:
	text "……Aniré a"
	line "entrenar més…"
	done

MtMoonSquareSignText:
	text "PLAÇA MT.MOON"

	para "Només cal pujar"
	line "les escales."
	done

Route4_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  5, MOUNT_MOON, 2

	def_coord_events

	def_bg_events
	bg_event  3,  7, BGEVENT_READ, MtMoonSquareSign
	bg_event 10,  3, BGEVENT_ITEM, Route4HiddenUltraBall

	def_object_events
	object_event 17,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperHank, -1
	object_event  9,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerPicnickerHope, -1
	object_event 21,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerPicnickerSharon, -1
	object_event 26,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route4HPUp, EVENT_ROUTE_4_HP_UP
