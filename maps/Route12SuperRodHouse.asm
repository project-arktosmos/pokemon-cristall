object_const_def
	const ROUTE12SUPERRODHOUSE_FISHING_GURU

Route12SuperRodHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route12SuperRodHouseFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SUPER_ROD
	iftrue .GotSuperRod
	writetext OfferSuperRodText
	yesorno
	iffalse .Refused
	writetext GiveSuperRodText
	promptbutton
	verbosegiveitem SUPER_ROD
	iffalse .NoRoom
	setevent EVENT_GOT_SUPER_ROD
.GotSuperRod:
	writetext GaveSuperRodText
	waitbutton
	closetext
	end

.Refused:
	writetext DontWantSuperRodText
	waitbutton
.NoRoom:
	closetext
	end

SuperRodHouseBookshelf: ; unreferenced
	jumpstd PictureBookshelfScript

OfferSuperRodText:
	text "Sóc el germà petit"
	line "del GURU DE LA"
	cont "PESCA."

	para "Veig que t'agrada"
	line "pescar."

	para "No en tinc cap"
	line "dubte!"

	para "Oi que tinc raó?"
	done

GiveSuperRodText:
	text "Sí, sí. Tal com"
	line "pensava!"

	para "Té, aficionat a"
	line "la pesca! Pren"
	cont "la SUPERCANYA."
	done

GaveSuperRodText:
	text "Prova de pescar"
	line "allà on hi hagi"
	cont "aigua."

	para "Recorda: pots"
	line "capturar #MON"

	para "diferents segons"
	line "la CANYA usada."
	done

DontWantSuperRodText:
	text "Eh? Els meus ulls"
	line "m'han enganyat?"
	done

Route12SuperRodHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_12, 1
	warp_event  3,  7, ROUTE_12, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route12SuperRodHouseFishingGuruScript, -1
