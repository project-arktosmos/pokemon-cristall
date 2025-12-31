	object_const_def
	const CINNABARISLAND_BLUE

CinnabarIsland_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CinnabarIslandFlypointCallback

CinnabarIslandFlypointCallback:
	setflag ENGINE_FLYPOINT_CINNABAR
	endcallback

CinnabarIslandBlue:
	faceplayer
	opentext
	writetext CinnabarIslandBlueText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement CINNABARISLAND_BLUE, CinnabarIslandBlueTeleport
	disappear CINNABARISLAND_BLUE
	clearevent EVENT_VIRIDIAN_GYM_BLUE
	end

CinnabarIslandGymSign:
	jumptext CinnabarIslandGymSignText

CinnabarIslandSign:
	jumptext CinnabarIslandSignText

CinnabarIslandPokecenterSign:
	jumpstd PokecenterSignScript

CinnabarIslandHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_CINNABAR_ISLAND_HIDDEN_RARE_CANDY

CinnabarIslandBlueTeleport:
	teleport_from
	step_end

CinnabarIslandBlueText:
	text "Qui ets tu?"

	para "Bé, és clar que"
	line "ets un entrenador…"

	para "Em dic BLUE."

	para "Vaig ser el CAMPIÓ"
	line "una vegada, encara"

	para "que només va ser"
	line "per poc temps…"

	para "Aquell RED tan"
	line "molest em va"
	cont "derrotar…"

	para "En fi, què vols?"
	line "Vols desafiar-me"

	para "o alguna cosa"
	line "així?"

	para "…Em sap greu dir-"
	line "ho, però ara no"

	para "estic d'humor per"
	line "a un combat."

	para "Mira bé al teu"
	line "voltant…"

	para "Un volcà erupciona"
	line "i, així com així,"

	para "tot un poble"
	line "desapareix."

	para "Podem continuar"
	line "guanyant i perdent"

	para "amb #MON. Però"
	line "si la natura fa"

	para "un sol gest, podem"
	line "perdre-ho tot."

	para "…"

	para "Així són les"
	line "coses…"

	para "Però, de totes"
	line "maneres, encara"
	cont "sóc un entrenador."

	para "Si veig un rival"
	line "fort, em vénen"
	cont "ganes de lluitar."

	para "Si vols combatre"
	line "amb mi, vine al"
	cont "GIMNÀS VIRIDIAN."

	para "Allà t'enfrontaré."
	done

CinnabarIslandGymSignText:
	text "Hi ha un avís"
	line "aquí…"

	para "El GIMNÀS CINNABAR"
	line "s'ha traslladat a"
	cont "LES ILLES SEAFOAM."

	para "BLAINE"
	done

CinnabarIslandSignText:
	text "ILLA CINNABAR"

	para "La Ciutat Ardent"
	line "del Desig Cremant"
	done

CinnabarIsland_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 11, CINNABAR_POKECENTER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 12, 11, BGEVENT_READ, CinnabarIslandPokecenterSign
	bg_event  9, 11, BGEVENT_READ, CinnabarIslandGymSign
	bg_event  7,  7, BGEVENT_READ, CinnabarIslandSign
	bg_event  9,  1, BGEVENT_ITEM, CinnabarIslandHiddenRareCandy

	def_object_events
	object_event  9,  6, SPRITE_BLUE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarIslandBlue, EVENT_BLUE_IN_CINNABAR
