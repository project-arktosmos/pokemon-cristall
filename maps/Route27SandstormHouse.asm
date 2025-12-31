	object_const_def
	const ROUTE27SANDSTORMHOUSE_GRANNY

Route27SandstormHouse_MapScripts:
	def_scene_scripts

	def_callbacks

SandstormHouseWoman:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM37_SANDSTORM
	iftrue .AlreadyGotItem
	special GetFirstPokemonHappiness
	writetext SandstormHouseWomanText1
	promptbutton
	ifgreater 150 - 1, .Loyal
	sjump .Disloyal

.Loyal:
	writetext SandstormHouseWomanLoyalText
	promptbutton
	verbosegiveitem TM_SANDSTORM
	iffalse .Done
	setevent EVENT_GOT_TM37_SANDSTORM
.AlreadyGotItem:
	writetext SandstormHouseSandstormDescription
	waitbutton
.Done:
	closetext
	end

.Disloyal:
	writetext SandstormHouseWomanDisloyalText
	waitbutton
	closetext
	end

SandstormHouseBookshelf:
	jumpstd MagazineBookshelfScript

SandstormHouseWomanText1:
	text "On vas amb els"
	line "teus #MON?"

	para "A la LLIGA"
	line "#MON?"

	para "Els teus #MON"
	line "són prou lleials"
	cont "per a guanyar?"

	para "Deixa'm veure…"
	done

SandstormHouseWomanLoyalText:
	text "Ah! El teu #MON"
	line "confia molt en"
	cont "tu."

	para "És un plaer veure"
	line "un bon entrenador."

	para "Té. Un regal pel"
	line "teu viatge."
	done

SandstormHouseSandstormDescription:
	text "L'MT37 resulta"
	line "ser SANDSTORM."

	para "És un moviment"
	line "que fa mal als"
	cont "dos combatents."

	para "És només per a"
	line "experts."

	para "Usa'l si t'atre-"
	line "veixes. Bona sort!"
	done

SandstormHouseWomanDisloyalText:
	text "Si no arriba a"
	line "confiar més en tu"

	para "podria ser difícil"
	line "avançar."

	para "La confiança és"
	line "el vincle entre"
	cont "#MON i humans."
	done

Route27SandstormHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_27, 1
	warp_event  3,  7, ROUTE_27, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, SandstormHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, SandstormHouseBookshelf

	def_object_events
	object_event  2,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SandstormHouseWoman, -1
