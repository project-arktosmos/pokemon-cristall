object_const_def
const ROUTE10SOUTH_POKEFAN_M1
const ROUTE10SOUTH_POKEFAN_M2

Route10South_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerHikerJim:
	trainer HIKER, JIM, EVENT_BEAT_HIKER_JIM, HikerJimSeenText, HikerJimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerJimAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmRobert:
	trainer POKEFANM, ROBERT, EVENT_BEAT_POKEFANM_ROBERT, PokefanmRobertSeenText, PokefanmRobertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmRobertAfterBattleText
	waitbutton
	closetext
	end

Route10Sign:
	jumptext Route10SignText

HikerJimSeenText:
	text "Hahahah!"
	done

HikerJimBeatenText:
	text "Hahaha-atxim!"
	done

HikerJimAfterBattleText:
	text "L'al·lèrgia al"
	line "pol·len em fa"
	cont "esternudar!"
	cont "Ahahah-ATXIM!"
	done

PokefanmRobertSeenText:
	text "T'agraden els"
	line "#MON, oi?"

	para "A mi també!"
	done

PokefanmRobertBeatenText:
	text "He de dir que"
	line "he perdut."
	done

PokefanmRobertAfterBattleText:
	text "Mira què has fet"
	line "als meus #MON…"

	para "No oblidaré"
	line "això…"
	done

Route10SignText:
	text "RUTA 10"

	para "CIUTAT CELESTE -"
	line "POBLE LAVANDA"
	done

Route10South_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  1, ROCK_TUNNEL_1F, 2

	def_coord_events

	def_bg_events
	bg_event  5,  3, BGEVENT_READ, Route10Sign

	def_object_events
	object_event 17,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerJim, -1
	object_event  8, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmRobert, -1
