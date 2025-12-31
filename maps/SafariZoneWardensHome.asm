	object_const_def
	const SAFARIZONEWARDENSHOME_LASS

SafariZoneWardensHome_MapScripts:
	def_scene_scripts

	def_callbacks

WardensGranddaughter:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	iftrue .AlreadyMet
	writetext WardensGranddaughterText1
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	end
.AlreadyMet:
	writetext WardensGranddaughterText2
	waitbutton
	closetext
	end

WardenPhoto:
	jumptext WardenPhotoText

SafariZonePhoto:
	jumptext SafariZonePhotoText

WardensHomeBookshelf:
	jumpstd PictureBookshelfScript

WardensGranddaughterText1:
	text "El meu avi és el"
	line "GUARDIÀ de la"
	cont "ZONA SAFARI."

	para "O ho era…"

	para "Va decidir anar"
	line "de vacances i"

	para "se'n va anar a"
	line "l'estranger tot"
	cont "sol."

	para "Va deixar la ZONA"
	line "SAFARI sense més."
	done

WardensGranddaughterText2:
	text "Molta gent es va"
	line "decebre quan la"

	para "ZONA SAFARI va"
	line "tancar, però"
	cont "l'avi és tan"
	cont "tossut…"
	done

WardenPhotoText:
	text "És una foto d'un"
	line "home gran somrient"

	para "envoltat de"
	line "#MON."
	done

SafariZonePhotoText:
	text "És una foto d'una"
	line "gran plana herbosa"

	para "amb #MON rars"
	line "jugant-hi."
	done

SafariZoneWardensHome_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, FUCHSIA_CITY, 6
	warp_event  3,  7, FUCHSIA_CITY, 6

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, WardensHomeBookshelf
	bg_event  1,  1, BGEVENT_READ, WardensHomeBookshelf
	bg_event  7,  0, BGEVENT_READ, WardenPhoto
	bg_event  9,  0, BGEVENT_READ, SafariZonePhoto

	def_object_events
	object_event  2,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WardensGranddaughter, -1
