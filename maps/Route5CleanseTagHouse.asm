	object_const_def
	const ROUTE5CLEANSETAGHOUSE_GRANNY
	const ROUTE5CLEANSETAGHOUSE_TEACHER

Route5CleanseTagHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route5CleanseTagHouseGrannyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_CLEANSE_TAG
	iftrue .GotCleanseTag
	writetext Route5CleanseTagHouseGrannyText1
	promptbutton
	verbosegiveitem CLEANSE_TAG
	iffalse .NoRoom
	setevent EVENT_GOT_CLEANSE_TAG
.GotCleanseTag:
	writetext Route5CleanseTagHouseGrannyText2
	waitbutton
.NoRoom:
	closetext
	end

Route5CleanseTagHouseTeacherScript:
	jumptextfaceplayer Route5CleanseTagHouseTeacherText

HouseForSaleBookshelf:
	jumpstd DifficultBookshelfScript

Route5CleanseTagHouseGrannyText1:
	text "Eeyaaaah!"

	para "Sento una ombra"
	line "sinistre planant"
	cont "sobre tu."

	para "Pren això per"
	line "allunyar-la!"
	done

Route5CleanseTagHouseGrannyText2:
	text "Estaves en perill"
	line "de mort, però ara"
	cont "estàs protegit."
	done

Route5CleanseTagHouseTeacherText:
	text "La meva àvia està"
	line "obsessionada amb"

	para "allunyar el que"
	line "ella creu que són"
	cont "esperits malignes."

	para "Perdona si t'ha"
	line "espantat."
	done

Route5CleanseTagHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_5, 4
	warp_event  3,  7, ROUTE_5, 4

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, HouseForSaleBookshelf
	bg_event  1,  1, BGEVENT_READ, HouseForSaleBookshelf

	def_object_events
	object_event  2,  5, SPRITE_GRANNY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route5CleanseTagHouseGrannyScript, -1
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route5CleanseTagHouseTeacherScript, -1
