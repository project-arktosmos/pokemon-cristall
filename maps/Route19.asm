	object_const_def
	const ROUTE19_SWIMMER_GIRL
	const ROUTE19_SWIMMER_GUY1
	const ROUTE19_SWIMMER_GUY2
	const ROUTE19_SWIMMER_GUY3
	const ROUTE19_FISHER1
	const ROUTE19_FISHER2

Route19_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, Route19ClearRocksCallback

Route19ClearRocksCallback:
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .Done
	changeblock  6,  6, $7a ; rock
	changeblock  8,  6, $7a ; rock
	changeblock 10,  6, $7a ; rock
	changeblock 12,  8, $7a ; rock
	changeblock  4,  8, $7a ; rock
	changeblock 10, 10, $7a ; rock
.Done:
	endcallback

TrainerSwimmerfDawn:
	trainer SWIMMERF, DAWN, EVENT_BEAT_SWIMMERF_DAWN, SwimmerfDawnSeenText, SwimmerfDawnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDawnAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermHarold:
	trainer SWIMMERM, HAROLD, EVENT_BEAT_SWIMMERM_HAROLD, SwimmermHaroldSeenText, SwimmermHaroldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermHaroldAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermJerome:
	trainer SWIMMERM, JEROME, EVENT_BEAT_SWIMMERM_JEROME, SwimmermJeromeSeenText, SwimmermJeromeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermJeromeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermTucker:
	trainer SWIMMERM, TUCKER, EVENT_BEAT_SWIMMERM_TUCKER, SwimmermTuckerSeenText, SwimmermTuckerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermTuckerAfterBattleText
	waitbutton
	closetext
	end

Route19Fisher1Script:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext Route19Fisher1Text
	waitbutton
	closetext
	end

.RocksCleared:
	writetext Route19Fisher1Text_RocksCleared
	waitbutton
	closetext
	end

Route19Fisher2Script:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext Route19Fisher2Text
	waitbutton
	closetext
	end

.RocksCleared:
	writetext Route19Fisher2Text_RocksCleared
	waitbutton
	closetext
	end

Route19Sign:
	jumptext Route19SignText

CarefulSwimmingSign:
	jumptext CarefulSwimmingSignText

SwimmermHaroldSeenText:
	text "Has nedat mai al"
	line "mar de nit?"
	done

SwimmermHaroldBeatenText:
	text "Glup…"
	done

SwimmermHaroldAfterBattleText:
	text "De nit, el mar es"
	line "torna negre."

	para "Sembla que et"
	line "pugui engolir."
	done

SwimmermTuckerSeenText:
	text "Buf, buf…"
	line "Només… una mica…"

	para "més… fins a…"
	line "FUCHSIA…"
	done

SwimmermTuckerBeatenText:
	text "M'ofego!"
	done

SwimmermTuckerAfterBattleText:
	text "Vaig… demanar a la"
	line "meva xicota que"
	cont "nedés a FUCHSIA…"
	done

SwimmerfDawnSeenText:
	text "No suporto la"
	line "gent covarda!"
	done

SwimmerfDawnBeatenText:
	text "Et podria guanyar"
	line "nedant…"
	done

SwimmerfDawnAfterBattleText:
	text "És ràpid nedar"
	line "entre FUCHSIA i"
	cont "les ILLES SEAFOAM…"

	para "El meu xicot diu"
	line "que és molt fort!"

	para "Quin covard!"
	done

SwimmermJeromeSeenText:
	text "Nedar?"
	line "Se'm dóna fatal."

	para "Només xipollejo"
	line "en aquestes aigües"
	cont "poc fondes."
	done

SwimmermJeromeBeatenText:
	text "Pensava que podia"
	line "guanyar."
	done

SwimmermJeromeAfterBattleText:
	text "Potser nedo"
	line "malament, però"
	cont "m'encanta el mar."
	done

Route19Fisher1Text:
	text "Perdona. El camí"
	line "està tancat per"
	cont "obres."

	para "Si vols anar a"
	line "CINNABAR, millor"

	para "ves cap al sud des"
	line "de PALLET TOWN."
	done

Route19Fisher1Text_RocksCleared:
	text "Estic tot suat."
	line "Hora de nedar!"
	done

Route19Fisher2Text:
	text "Qui sap quant"
	line "trigaran a moure"
	cont "aquesta roca…"
	done

Route19Fisher2Text_RocksCleared:
	text "Les obres per fi"
	line "han acabat."

	para "Ara puc tornar"
	line "a pescar."
	done

Route19SignText:
	text "RUTA 19"

	para "FUCHSIA CITY -"
	line "ILLES SEAFOAM"
	done

CarefulSwimmingSignText:
	text "Si us plau, aneu"
	line "amb compte si"
	cont "nedeu a les ILLES"
	cont "SEAFOAM."

	para "POLICIA FUCHSIA"
	done

Route19_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  3, ROUTE_19_FUCHSIA_GATE, 3

	def_coord_events

	def_bg_events
	bg_event 11, 13, BGEVENT_READ, Route19Sign
	bg_event 11,  1, BGEVENT_READ, CarefulSwimmingSign

	def_object_events
	object_event  9, 23, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerSwimmerfDawn, -1
	object_event 13, 28, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermHarold, -1
	object_event 11, 17, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermJerome, -1
	object_event  8, 23, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerSwimmermTucker, -1
	object_event  9,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, Route19Fisher1Script, -1
	object_event 11,  5, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, Route19Fisher2Script, -1
