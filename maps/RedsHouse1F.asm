	object_const_def
	const REDSHOUSE1F_REDS_MOM

RedsHouse1F_MapScripts:
	def_scene_scripts
	scene_script RedHouse1FNoopScene ; unusable

	def_callbacks

RedHouse1FNoopScene:
	end

RedsMom:
	faceplayer
	opentext
	checkevent EVENT_MET_REDS_MOM
	iftrue .MetAlready
	writetext RedsMomText1
	waitbutton
	closetext
	setevent EVENT_MET_REDS_MOM
	end
.MetAlready:
	writetext RedsMomText2
	waitbutton
	closetext
	end

RedsHouse1FTV:
	jumptext RedsHouse1FTVText

RedsHouse1FBookshelf:
	jumpstd PictureBookshelfScript

RedsMomText1:
	text "Hola!"

	para "En RED fa temps"
	line "que no hi és."

	para "Tampoc no ha"
	line "trucat, així que"

	para "no sé on és ni"
	line "què ha estat"
	cont "fent."

	para "Diuen que cap"
	line "notícia és bona"

	para "notícia, però"
	line "estic preocupada"
	cont "per ell."
	done

RedsMomText2:
	text "Em preocupa que"
	line "en RED es faci"

	para "mal o emmalaltei-"
	line "xi, però és un"

	para "noi. Estic"
	line "orgullosa que"

	para "faci el que vol."
	done

RedsHouse1FTVText:
	text "Tenen programes"
	line "que no es veuen"
	cont "a JOHTO…"
	done

RedsHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, PALLET_TOWN, 1
	warp_event  3,  7, PALLET_TOWN, 1
	warp_event  7,  0, REDS_HOUSE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  1,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  2,  1, BGEVENT_READ, RedsHouse1FTV

	def_object_events
	object_event  5,  3, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsMom, -1
