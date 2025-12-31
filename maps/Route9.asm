	object_const_def
	const ROUTE9_YOUNGSTER1
	const ROUTE9_LASS1
	const ROUTE9_YOUNGSTER2
	const ROUTE9_LASS2
	const ROUTE9_POKEFAN_M1
	const ROUTE9_POKEFAN_M2

Route9_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerCamperDean:
	trainer CAMPER, DEAN, EVENT_BEAT_CAMPER_DEAN, CamperDeanSeenText, CamperDeanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperDeanAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHeidi:
	trainer PICNICKER, HEIDI, EVENT_BEAT_PICNICKER_HEIDI, PicnickerHeidiSeenText, PicnickerHeidiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHeidiAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperSid:
	trainer CAMPER, SID, EVENT_BEAT_CAMPER_SID, CamperSidSeenText, CamperSidBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperSidAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerEdna:
	trainer PICNICKER, EDNA, EVENT_BEAT_PICNICKER_EDNA, PicnickerEdnaSeenText, PicnickerEdnaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerEdnaAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerTim:
	trainer HIKER, TIM, EVENT_BEAT_HIKER_TIM, HikerTimSeenText, HikerTimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerTimAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerSidney:
	trainer HIKER, SIDNEY, EVENT_BEAT_HIKER_SIDNEY, HikerSidneySeenText, HikerSidneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerSidneyAfterBattleText
	waitbutton
	closetext
	end

Route9Sign:
	jumptext Route9SignText

Route9HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_9_HIDDEN_ETHER

CamperDeanSeenText:
	text "He vingut a"
	line "explorar el TÚNEL"
	cont "ROCA."
	done

CamperDeanBeatenText:
	text "Apa! Perill, home."
	done

CamperDeanAfterBattleText:
	text "Els meus #MON"
	line "ja estaven ferits"

	para "abans d'entrar al"
	line "TÚNEL ROCA."

	para "Hauria de dur-los"
	line "a un CENTRE"
	cont "#MON de"
	cont "seguida."
	done

PicnickerHeidiSeenText:
	text "Has anat mai a un"
	line "pícnic?"

	para "Són molt"
	line "divertits!"
	done

PicnickerHeidiBeatenText:
	text "Ohhhh!"
	done

PicnickerHeidiAfterBattleText:
	text "Fem moltes llami-"
	line "nadures i les"

	para "compartim amb"
	line "tothom. Delícies!"
	done

CamperSidSeenText:
	text "Ei, tu!"
	line "No llencis brossa!"
	done

CamperSidBeatenText:
	text "Només volia"
	line "assenyalar…"
	done

CamperSidAfterBattleText:
	text "Perdona. No"
	line "llençaves brossa."
	cont "M'he equivocat."
	done

PicnickerEdnaSeenText:
	text "La gent no hauria"
	line "de deixar brossa"
	cont "enrere."
	done

PicnickerEdnaBeatenText:
	text "Ohh… He perdut…"
	done

PicnickerEdnaAfterBattleText:
	text "Estalviar energia"
	line "és important, però"

	para "el medi ambient és"
	line "encara més vital."
	done

HikerTimSeenText:
	text "Ella vindrà per"
	line "la MT.PLATA quan"
	cont "arribi…"

	para "La MT.PLATA és a"
	line "JOHTO, oi?"
	done

HikerTimBeatenText:
	text "Estava massa"
	line "ocupat cantant…"
	done

HikerTimAfterBattleText:
	text "Els combats són"
	line "concentració."
	done

HikerSidneySeenText:
	text "Et diré un secret."

	para "Però primer,"
	line "lluitem!"
	done

HikerSidneyBeatenText:
	text "Oh, diantre!"
	line "He perdut…"
	done

HikerSidneyAfterBattleText:
	text "La CENTRAL està"
	line "a l'altre costat"
	cont "d'un petit riu."
	done

Route9SignText:
	text "RUTA 9"

	para "CIUTAT CERULEAN -"
	line "TÚNEL ROCA"
	done

Route9_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 48, 15, ROCK_TUNNEL_1F, 1

	def_coord_events

	def_bg_events
	bg_event 15,  7, BGEVENT_READ, Route9Sign
	bg_event 41, 15, BGEVENT_ITEM, Route9HiddenEther

	def_object_events
	object_event 23, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperDean, -1
	object_event 39,  8, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerHeidi, -1
	object_event 11,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerCamperSid, -1
	object_event 12, 15, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerEdna, -1
	object_event 28,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerTim, -1
	object_event 36, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerHikerSidney, -1
