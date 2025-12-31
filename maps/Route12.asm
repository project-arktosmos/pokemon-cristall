object_const_def
const ROUTE12_FISHER1
const ROUTE12_FISHER2
const ROUTE12_FISHER3
const ROUTE12_FISHER4
const ROUTE12_POKE_BALL1
const ROUTE12_POKE_BALL2

Route12_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerFisherKyle:
	trainer FISHER, KYLE, EVENT_BEAT_FISHER_KYLE, FisherKyleSeenText, FisherKyleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherKyleAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMartin:
	trainer FISHER, MARTIN, EVENT_BEAT_FISHER_MARTIN, FisherMartinSeenText, FisherMartinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMartinAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherStephen:
	trainer FISHER, STEPHEN, EVENT_BEAT_FISHER_STEPHEN, FisherStephenSeenText, FisherStephenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherStephenAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherBarney:
	trainer FISHER, BARNEY, EVENT_BEAT_FISHER_BARNEY, FisherBarneySeenText, FisherBarneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherBarneyAfterBattleText
	waitbutton
	closetext
	end

Route12Sign:
	jumptext Route12SignText

FishingSpotSign:
	jumptext FishingSpotSignText

Route12Calcium:
	itemball CALCIUM

Route12Nugget:
	itemball NUGGET

Route12HiddenElixer:
	hiddenitem ELIXER, EVENT_ROUTE_12_HIDDEN_ELIXER

FisherMartinSeenText:
	text "La paciència és"
	line "la clau de la"
	cont "pesca i els #."
	done

FisherMartinBeatenText:
	text "Aaaarg!"
	done

FisherMartinAfterBattleText:
	text "Sóc massa impaci-"
	line "ent per pescar…"
	done

FisherStephenSeenText:
	text "Em sento tan bé,"
	line "pescant mentre"
	cont "escolto música"
	cont "a la ràdio."
	done

FisherStephenBeatenText:
	text "La ràdio m'ha"
	line "distret!"
	done

FisherStephenAfterBattleText:
	text "Has escoltat els"
	line "programes de"

	para "ràdio de KANTO?"
	line "Hi ha varietat."
	done

FisherBarneySeenText:
	text "Què és el més"
	line "important en la"
	cont "vida quotidiana?"
	done

FisherBarneyBeatenText:
	text "La resposta serà"
	line "revelada ara!"
	done

FisherBarneyAfterBattleText:
	text "Crec que l'elec-"
	line "tricitat és el"

	para "més important en"
	line "la vida diària."

	para "Si no ho fos,"
	line "la gent no hauria"

	para "fet tant d'enre-"
	line "nou quan la"

	para "CENTRAL ELÈCTRICA"
	line "va deixar de fun-"
	cont "cionar."
	done

FisherKyleSeenText:
	text "Te'n recordes?"
	done

FisherKyleBeatenText:
	text "Te'n recordes?"
	done

FisherKyleAfterBattleText:
	text "L'estirada que"
	line "notes a la CANYA"

	para "quan enganxes un"
	line "#MON…"

	para "És la millor"
	line "sensació per a un"
	cont "pescador com jo."
	done

Route12SignText:
	text "RUTA 12"

	para "AL NORD:"
	line "POBLE LAVANDA"
	done

FishingSpotSignText:
	text "ZONA DE PESCA"
	done

Route12_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 33, ROUTE_12_SUPER_ROD_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 11, 27, BGEVENT_READ, Route12Sign
	bg_event 13,  9, BGEVENT_READ, FishingSpotSign
	bg_event 14, 13, BGEVENT_ITEM, Route12HiddenElixer

	def_object_events
	object_event  5, 13, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherMartin, -1
	object_event 14, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherStephen, -1
	object_event 10, 38, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerFisherBarney, -1
	object_event  6,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherKyle, -1
	object_event  5, 43, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route12Calcium, EVENT_ROUTE_12_CALCIUM
	object_event  5, 51, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route12Nugget, EVENT_ROUTE_12_NUGGET
